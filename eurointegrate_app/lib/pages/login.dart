import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  String? _mensagemErro;
  bool erro = false;

  Future<void> _login() async {
    var url = Uri.parse(
        'https://955e-2804-7efc-32c-4a01-3953-1aa8-e0ce-c0c5.ngrok-free.app/users/login');
    var body = {"email": _email.text, "senha": _senha.text};
    var jsonBody = jsonEncode(body);
    http.Response? response;
    try {
      response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        // Se o servidor retornar um código 200 OK, parse o JSON.
        print('Resposta: ${response.body}');
      } else {
        print('Falha ao fazer login: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }

    setState(() {
      if (response!.statusCode == 401) {
        _mensagemErro = '${response.body}: email ou senha inválidos';
        erro = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60.0, 8.0, 60.0, 8.0),
            child: TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: erro
                        ? Colors.red
                        : Colors.grey, // Cor padrão quando não há erro
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: erro
                        ? Colors.red
                        : Colors.blue, // Cor quando o campo está em foco
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(60.0, 8.0, 60.0, 8.0),
            child: TextField(
              controller: _senha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                 enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: erro
                        ? Colors.red
                        : Colors.grey, // Cor padrão quando não há erro
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: erro
                        ? Colors.red
                        : Colors.blue, // Cor quando o campo está em foco
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          SizedBox(
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: _login,
              child: const Text(
                "Entrar",
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          if (_mensagemErro != null)
            Text(
              _mensagemErro!,
              style: const TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
