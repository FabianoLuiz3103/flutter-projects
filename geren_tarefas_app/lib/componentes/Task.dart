import 'package:flutter/material.dart';
import 'package:geren_tarefas_app/componentes/Difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String img;
  final int dificuldade;
  const Task(this.nome, this.img, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
   int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
             color: Colors.blue
          ) ,
           height: 140, ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(6.0),
                   color: Colors.white
                ),
                 height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(6.0),
                      color: Colors.black26
                    ),
                     width: 72, height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.asset(widget.img,
                      fit:BoxFit.cover
                      ),
                    ),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(widget.nome,
                        style: const TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Difficulty(widget.dificuldade),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          (nivel < widget.dificuldade*10) ? nivel++ : null;
                          
                        });
                      }, 
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_drop_up),
                          Text('UP', style: TextStyle(fontSize: 12),
                          )
                        ],
                        )
                      ),
                  ),
                ],
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0) ?
                          (nivel/widget.dificuldade)/10
                          : 1,
                        )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Nível: $nivel', style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                      ),
                                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
 
  }
}