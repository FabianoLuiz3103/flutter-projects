import 'package:contatos_app/components/favoritar_contato.dart';
import 'package:contatos_app/components/icon_button.dart';
import 'package:contatos_app/components/iniciar_contatos.dart';
import 'package:contatos_app/models/Contato.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => __InitialScreenState();
}

class __InitialScreenState extends State<InitialScreen> {
  List<Contato> contatos = listaDeContatos();
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contatos Favoritos: $_contador',
        ),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contatos[index].fotoPerfil!),
            ),
            title: Text('${contatos[index].nome}'),
            subtitle: Text('${contatos[index].email}'),
            trailing: IconButton(
              icon: contatos[index].favorito! ? activateIcon : inactivateIcon,
              onPressed: () {
                setState(() {
                  _contador = favoritarContato(contatos, index, _contador);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
