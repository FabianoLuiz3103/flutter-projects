import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/foundation.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late CachedVideoPlayerController _videoPlayerController,
      _videoPlayerController2,
      _videoPlayerController3;

  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
  const CustomVideoPlayerSettings(showSeekButtons: true);

  final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
  CustomVideoPlayerWebSettings(
    src: longVideo,
  );

  int totalAnswered = 0;
  int totalCorrect = 0;
  double progress = 0.0; // Variável para acompanhar o progresso

  @override
  void initState() {
    super.initState();

    _videoPlayerController = CachedVideoPlayerController.network(
      longVideo,
    )
      ..initialize().then((value) => setState(() {}))
      ..addListener(_onVideoProgress); // Listener para o progresso do vídeo

    _videoPlayerController2 = CachedVideoPlayerController.network(video240);
    _videoPlayerController3 = CachedVideoPlayerController.network(video480);
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
      additionalVideoSources: {
        "240p": _videoPlayerController2,
        "480p": _videoPlayerController3,
        "720p": _videoPlayerController,
      },
    );

    _customVideoPlayerWebController = CustomVideoPlayerWebController(
      webVideoPlayerSettings: _customVideoPlayerWebSettings,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_onVideoProgress); // Remove o listener
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  // Função para atualizar o progresso do vídeo
  void _onVideoProgress() {
    final currentPosition = _videoPlayerController.value.position.inMilliseconds.toDouble();
    final totalDuration = _videoPlayerController.value.duration.inMilliseconds.toDouble();
    final currentProgress = totalDuration > 0 ? currentPosition / totalDuration : 0.0;

    setState(() {
      progress = currentProgress * 100; // Calcula a porcentagem do progresso
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vídeo e Perguntas"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Respondidas: $totalAnswered"),
                Text("Corretas: $totalCorrect"),
                Text("Progresso: ${progress.toStringAsFixed(1)}%"), // Mostra o progresso na tela
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          child: PageView(
            children: [
              _buildVideoPage("Video 1", perguntasVideo1, Colors.blue, Colors.white),
              _buildVideoPage("Video 2", perguntasVideo2, Colors.green, const Color.fromARGB(255, 4, 247, 89)),
              _buildVideoPage("Video 3", perguntasVideo3, Colors.orange, Colors.grey),
              _buildVideoPage("Video 4", perguntasVideo4, Colors.purple, Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPage(String videoTitle, List<Pergunta> perguntas, Color topColor, Color bottomColor) {
    CachedVideoPlayerController videoController;
    if (videoTitle == "Video 1") {
      videoController = _videoPlayerController;
    } else if (videoTitle == "Video 2") {
      videoController = _videoPlayerController2;
    } else if (videoTitle == "Video 3") {
      videoController = _videoPlayerController3;
    } else {
      videoController = _videoPlayerController;
    }

    return Column(
      children: [
        // Metade superior - Vídeo
        Expanded(
          child: kIsWeb
              ? CustomVideoPlayerWeb(
            customVideoPlayerWebController:
            CustomVideoPlayerWebController(
              webVideoPlayerSettings: CustomVideoPlayerWebSettings(
                src: videoController.dataSource,
              ),
            ),
          )
              : CustomVideoPlayer(
            customVideoPlayerController: CustomVideoPlayerController(
              context: context,
              videoPlayerController: videoController,
              customVideoPlayerSettings: _customVideoPlayerSettings,
              additionalVideoSources: {
                "240p": _videoPlayerController2,
                "480p": _videoPlayerController3,
                "720p": _videoPlayerController,
              },
            ),
          ),
        ),
        // Metade inferior - Perguntas do vídeo
        Expanded(
          child: Container(
            color: bottomColor,
            child: PageView(
              children: perguntas.map((pergunta) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        pergunta.enunciado,
                        style: TextStyle(fontSize: 18, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: pergunta.ops.length,
                        itemBuilder: (context, index) {
                          bool isCorrect = false;
                          Color buttonColor = Colors.grey;

                          if (pergunta.selectedOptionIndex == index) {
                            isCorrect = pergunta.checkAnswer(index);
                            buttonColor = isCorrect ? Colors.green : Colors.red;
                          }

                          return ListTile(
                            title: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(buttonColor),
                              ),
                              child: Text(
                                pergunta.ops[index].texto,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              onPressed: pergunta.isAnswered
                                  ? null
                                  : () {
                                setState(() {
                                  if (!pergunta.isAnswered) {
                                    if (pergunta.selectedOptionIndex != null) {
                                      // Recalculate counters if an answer was previously selected
                                      totalAnswered--;
                                      if (pergunta.isCorrect!) {
                                        totalCorrect--;
                                      }
                                    }

                                    pergunta.selectedOptionIndex = index;
                                    pergunta.isAnswered = true;
                                    pergunta.isCorrect = pergunta.checkAnswer(index);

                                    totalAnswered++;
                                    if (pergunta.isCorrect!) {
                                      totalCorrect++;
                                    }

                                    // Adiciona 1% ao progresso quando uma pergunta é respondida
                                    progress += 1;
                                    if (progress > 100) {
                                      progress = 100;
                                    }
                                  }
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