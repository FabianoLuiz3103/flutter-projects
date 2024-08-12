import 'package:avatar_maker/avatar_maker.dart';
import 'package:eurointegrate_app/components/consts.dart';
import 'package:eurointegrate_app/pages/editar_avatar.dart';
import 'package:eurointegrate_app/pages/editar_nascimento.dart';
import 'package:eurointegrate_app/pages/editar_nome.dart';
import 'package:eurointegrate_app/pages/editar_telefone.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Perfil()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações pessoais'),
        backgroundColor: azulEuro,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  AvatarMakerAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 40,
                  ),
                  const SizedBox(width: 16), // Espaçamento entre avatar e texto
                  Expanded(
                    child: const Text(
                      'Larissa Santos',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditarAvatar()),
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Informação pessoal 1
          Row(
            children: [
              Icon(Icons.person_outlined),
              const SizedBox(width: 16), // Espaçamento entre ícone e texto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome e sobrenome'),
                    Text("Larissa Santos"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditarNome(primeiroNome: 'Larissa', sobrenome: 'Santos',)),
                      );
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const Divider(),
          // Informação pessoal 2
          Row(
            children: [
              Icon(Icons.credit_card),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Documento de identidade'),
                    Text("548.244.567.78"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.lock_outlined),
              ),
            ],
          ),
          const Divider(),
          // Informação pessoal 3
          Row(
            children: [
              Icon(Icons.cake_outlined),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data de nascimento'),
                    Text("15/03/1994"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditarNascimento(dataNascimento: '1994-03-15')),
                      );
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const Divider(),
          // Informação pessoal 4
          Row(
            children: [
              Icon(Icons.phone_android),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Telefone'),
                    Text("+55 11 99999-9999"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditarTelefone(telefone: '1199999-9999')),
                      );
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const Divider(),
          // Informação pessoal 5
          Row(
            children: [
              Icon(Icons.mail_outline),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail institucional'),
                    Text("larissa.santos@example.com"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.lock_outlined),
              ),
            ],
          ),
          const Divider(),
          // Informação pessoal 6
          Row(
            children: [
              Icon(Icons.calendar_month_outlined),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data de admissão'),
                    Text("01/01/2020"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.lock_outlined),
              ),
            ],
          ),
          const Divider(),
          // Informação pessoal 7
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Departamento'),
                    Text("TI"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.lock_outlined),
              ),
            ],
          ),
          const Divider(),
          // Informação pessoal 8
          Row(
            children: [
              Icon(Icons.badge_outlined),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Matrícula'),
                    Text("12345678"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.lock_outlined),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Icon(Icons.power_settings_new),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sair'),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Guia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Conquistas',
          ),
        ],
        selectedItemColor: azulEuro,
        unselectedItemColor: cinza,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
