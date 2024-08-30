import 'package:flutter/material.dart';

import '../models/to_do.dart';
import 'detail_screen.dart';

class ToDoScreen extends StatelessWidget {
  final List<ToDo> todos;
  const ToDoScreen({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo Screen'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(todo : todos[index]),
                ),
            );
            },
          );
        },
      ),
    );
  }
}