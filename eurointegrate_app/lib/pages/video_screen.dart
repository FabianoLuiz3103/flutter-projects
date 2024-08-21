import 'dart:async';
import 'package:eurointegrate_app/components/consts.dart';
import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late CachedVideoPlayerController _videoPlayerController1,
      _videoPlayerController2,
      _videoPlayerController3;

  Timer? _progressTimer;
  double _globalProgress = 0.0;
  Set<int> _watchedVideos = {}; // Para marcar vídeos assistidos
  Map<int, Timer?> _videoTimers = {}; // Para armazenar timers por vídeo

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  @override
  void initState() {
    super.initState();

    _initializeVideoControllers();
  }

  void _initializeVideoControllers() {
    _videoPlayerController1 = CachedVideoPlayerController.network(longVideo)
      ..initialize().then((_) {
        setState(() {});
        _startVideoTimer(1, _videoPlayerController1);
      });

    _videoPlayerController2 = CachedVideoPlayerController.network(video240)
      ..initialize().then((_) {
        _startVideoTimer(2, _videoPlayerController2);
      });

    _videoPlayerController3 = CachedVideoPlayerController.network(video480)
      ..initialize().then((_) {
        _startVideoTimer(3, _videoPlayerController3);
      });
  }

  void _startVideoTimer(int videoIndex, CachedVideoPlayerController videoController) {
    videoController.addListener(() {
      if (videoController.value.isPlaying) {
        if (_videoTimers[videoIndex] == null) {
          _videoTimers[videoIndex] = Timer.periodic(Duration(seconds: 1), (_) {
            if (videoController.value.isPlaying && !videoController.value.isBuffering) {
              setState(() {
                _globalProgress += 1; // Incrementa o progresso em 1 segundo
              });
            }
          });
        }
      } else {
        _videoTimers[videoIndex]?.cancel();
        _videoTimers[videoIndex] = null;
      }

      if (videoController.value.position == videoController.value.duration) {
        setState(() {
          _watchedVideos.add(videoIndex);
        });
        _videoTimers[videoIndex]?.cancel();
        _videoTimers[videoIndex] = null;
      }
    });
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _videoPlayerController3.dispose();
    _videoTimers.forEach((_, timer) => timer?.cancel());
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trilha institucional"),
        backgroundColor: azulEuro,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90 ,
          height: MediaQuery.of(context).size.height * 0.85,
          child: PageView(
            children: [
              _buildVideoPage("Video 1", perguntasVideo1, _videoPlayerController1, 1),
              _buildVideoPage("Video 2", perguntasVideo2, _videoPlayerController2, 2),
              _buildVideoPage("Video 3", perguntasVideo3,_videoPlayerController3, 3),
              _buildVideoPage("Video 4", perguntasVideo4, _videoPlayerController1, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPage(String videoTitle, List<Pergunta> perguntas, CachedVideoPlayerController videoController, int videoIndex) {
    double progress = (_globalProgress /1000);

   return Column(
    children: [
      // Barra de progresso
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: progress,
                color: azulEuro,
                backgroundColor: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                minHeight: 20,
              ),
            ),
            SizedBox(width: 8,),
            Text(
            "${(progress * 10).toStringAsFixed(1)}%",
            style: const TextStyle(
              fontSize: 12, // Aumenta o tamanho do texto
              fontWeight: FontWeight.bold, // Deixa o texto em negrito
              color: azulEuro
            ),
            textAlign: TextAlign.center, // Centraliza o texto
          ),
          ],
        ),
      ),
        Expanded(
          child: CustomVideoPlayer(
            customVideoPlayerController: CustomVideoPlayerController(
              context: context,
              videoPlayerController: videoController,
              customVideoPlayerSettings: _customVideoPlayerSettings,
              additionalVideoSources: {
                "240p": _videoPlayerController2,
                "480p": _videoPlayerController3,
                "720p": _videoPlayerController1,
              },
            ),
          ),
        ),
        SizedBox(height: 12,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: cinza,
            ),
            child: PageView(
              children: perguntas.map((pergunta) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        pergunta.enunciado,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: pergunta.ops.length,
                        itemBuilder: (context, index) {
                          bool isCorrect = false;
                          Color buttonColor = azulEuro;

                          if (pergunta.selectedOptionIndex == index) {
                            isCorrect = pergunta.checkAnswer(index);
                            buttonColor = isCorrect ? Colors.green : Colors.red;
                          }

                          return ListTile(
                            title: TextButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(buttonColor),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                pergunta.ops[index].texto,
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                              onPressed: pergunta.isAnswered
                                  ? null
                                  : () {
                                      setState(() {
                                        _globalProgress += 20;
                                        pergunta.selectedOptionIndex = index;
                                        pergunta.isAnswered = true;
                                        pergunta.isCorrect = pergunta.checkAnswer(index);
                                      });
                                    },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class Pergunta {
  String enunciado = '';
  List<Opcao> ops = [];
  int? selectedOptionIndex;
  bool isAnswered = false;
  bool? isCorrect;

  Pergunta({required String enun, required List<Opcao> op}) {
    this.enunciado = enun;
    this.ops = op;
  }

  bool checkAnswer(int index) {
    return ops[index].opcao == "A"; // Supondo que "A" é a resposta correta.
  }
}

class Opcao {
  String texto = ' ';
  String opcao = ' ';
  Opcao({required String tex, required String op}) {
    this.texto = tex;
    this.opcao = op;
  }
}

String longVideo =
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
String video720 =
    "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4";
String video480 =
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4";
String video240 =
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4";

// Listas de perguntas para cada vídeo
List<Pergunta> perguntasVideo1 = [
  Pergunta(
      enun:
          "QUESTÃO 1: Qual das alternativas abaixo está correta em relação ao tema abordado?",
      op: [
        Opcao(tex: "OPCAO A - Q1", op: "A"),
        Opcao(tex: "OPCAO B - Q1", op: "B"),
        Opcao(tex: "OPCAO C - Q1", op: "C"),
        Opcao(tex: "OPCAO D - Q1", op: "D")
      ]),
  Pergunta(
      enun:
          "QUESTÃO 2: Qual das alternativas abaixo está correta em relação ao tema abordado?",
      op: [
        Opcao(tex: "OPCAO A - Q2", op: "A"),
        Opcao(tex: "OPCAO B - Q2", op: "B"),
        Opcao(tex: "OPCAO C - Q2", op: "C"),
        Opcao(tex: "OPCAO D - Q2", op: "D")
      ]),
];

List<Pergunta> perguntasVideo2 = [
  Pergunta(
      enun:
          "QUESTÃO 1: Qual das alternativas abaixo está correta em relação ao tema abordado?",
      op: [
        Opcao(tex: "OPCAO A - Q1", op: "A"),
        Opcao(tex: "OPCAO B - Q1", op: "B"),
        Opcao(tex: "OPCAO C - Q1", op: "C"),
        Opcao(tex: "OPCAO D - Q1", op: "D")
      ]),
  Pergunta(
      enun:
          "QUESTÃO 2: Qual das alternativas abaixo está correta em relação ao tema abordado?",
      op: [
        Opcao(tex: "OPCAO A - Q2", op: "A"),
        Opcao(tex: "OPCAO B - Q2", op: "B"),
        Opcao(tex: "OPCAO C - Q2", op: "C"),
        Opcao(tex: "OPCAO D - Q2", op: "D")
      ]),
];

List<Pergunta> perguntasVideo3 = [
  Pergunta(
      enun:
          "QUESTÃO 1: Qual das alternativas abaixo está correta em relação ao tema abordado?",
      op: [
        Opcao(tex: "OPCAO A - Q1", op: "A"),
        Opcao(tex: "OPCAO B - Q1", op: "B"),
        Opcao(tex: "OPCAO C - Q1", op: "C"),
        Opcao(tex: "OPCAO D - Q1", op: "D")
      ]),
  Pergunta(
      enun:
          "QUESTÃO 2: Qual das alternativas abaixo está correta em relação ao tema abordado?",
      op: [
        Opcao(tex: "OPCAO A - Q2", op: "A"),
        Opcao(tex: "OPCAO B - Q2", op: "B"),
        Opcao(tex: "OPCAO C - Q2", op: "C"),
        Opcao(tex: "OPCAO D - Q2", op: "D")
      ]),
];

List<Pergunta> perguntasVideo4 = [
  Pergunta(
      enun:
          "QUESTÃO 1: Qual das alternativas abaixo está correta em relação ao tema abordado?",
      op: [
        Opcao(tex: "OPCAO A - Q1", op: "A"),
        Opcao(tex: "OPCAO B - Q1", op: "B"),
        Opcao(tex: "OPCAO C - Q1", op: "C"),
        Opcao(tex: "OPCAO D - Q1", op: "D")
      ]),
  Pergunta(
      enun:
          "QUESTÃO 2: Qual das alternativas abaixo está correta em relação ao tema abordado?",
      op: [
        Opcao(tex: "OPCAO A - Q2", op: "A"),
        Opcao(tex: "OPCAO B - Q2", op: "B"),
        Opcao(tex: "OPCAO C - Q2", op: "C"),
        Opcao(tex: "OPCAO D - Q2", op: "D")
      ]),
];