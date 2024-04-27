import 'package:flutter/material.dart';
import 'package:geren_tarefas_app/componentes/Task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text('Tarefas'),
  ),
  body: AnimatedOpacity(
    opacity: opacidade ? 1: 0,
    duration: const Duration(
      milliseconds: 800,
    ),
    child: ListView(
      children: const [
        Task('Aprender Flutter',
         'assets/images/flut.png',
         3,),
        Task('Aprender Kotlin', 
        'assets/images/ktl.png',
        5,),
        Task('Aprender UI/UX',
         'assets/images/uix.jpg',
         2,),
        Task('Aprender Java', 
        'assets/images/jv.png',
        4,),
        Task('Aprender SpringBoot3', 
        'assets/images/spng.png',
        2,),
        Task('Aprender HTML', 
        'assets/images/html.png',
        3,),
        Task('Aprender CSS', 
        'assets/images/css.jpg',
        4,),
        Task('Aprender JavaScript', 
        'assets/images/js.jpg',
        4,),
        Task('Aprender PL/SQL', 
        'assets/images/oracle.png',
        5,
        ),
        SizedBox(height: 80,)

      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: (){
      setState(() {
         opacidade = !opacidade;
      });
    },
    child: const Icon(Icons.remove_red_eye),
    ),
);
  }
}