// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:futebol_app/pages/initial_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  bool _carregando = false;
  String? _mensagemErro;
  bool _valido = false;

  Future<void> _login() async {
    setState(() {
      _carregando = true; 
      _mensagemErro = null;
    });


    await Future.delayed(const Duration(seconds: 1)); 

    _valido = (_email.text == "fabianojesus1991@gmail.com" && _senha.text == "12345678") ? true : false;
    _valido ? Navigator.push(context, MaterialPageRoute(builder: (context) =>  InitialScreen())) : setState(() {
      _carregando = false;
      _mensagemErro = 'Email ou senha inválidos';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _carregando ? Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  
           children:[ const CircularProgressIndicator(), 
           SizedBox(height: 5,),
           Text("Validando dados...", 
                     style:  GoogleFonts.permanentMarker(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    )
           ],
           ),
           ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 100,
                child: Column(
          
                  children: [
                    const CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("images/ball.png"),
                    ),
                    Text("World Football Teams", 
                     style:  GoogleFonts.permanentMarker(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    )
                  ],
                )
              ),
              const SizedBox(height: 10.0,),
              TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: _senha,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
               const SizedBox(height: 15.0,),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: _carregando ? null : _login,
                  child:  Text("Entrar", 
                  style:  GoogleFonts.permanentMarker(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                          ),
                ),
              ),
              const SizedBox(height: 15.0,),
              if (_mensagemErro != null)
                Text(
                  _mensagemErro!,
                  style:  GoogleFonts.permanentMarker(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}