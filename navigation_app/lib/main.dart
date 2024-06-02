import 'package:flutter/material.dart';
import 'package:navigation_app/componenets/lista_todo.dart';
import 'package:navigation_app/pages/to_do_screen.dart';

import 'models/to_do.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ToDo> lista = lista_toDo();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
    home:  ToDoScreen(todos: lista),
    );
  }
}

