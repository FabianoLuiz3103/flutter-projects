import 'package:flutter/material.dart';
import 'package:futebol_app/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: false,
      ).copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme().copyWith(
         iconTheme: const IconThemeData(
            color: Colors.black, 
          )
        ),
        
      ),
      home: const LoginScreen(),
    );
  }
}

