import 'package:flutter/material.dart';
import 'package:geren_tarefas_app/componentes/InitialScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const InitialScreen(),
    );
  }
}

