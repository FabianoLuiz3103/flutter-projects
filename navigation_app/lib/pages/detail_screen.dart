import 'package:flutter/material.dart';
import 'package:navigation_app/models/to_do.dart';

class DetailScreen extends StatelessWidget {
  final ToDo todo;
  const DetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefa n° ${todo.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      )

    );
  }
}