import 'package:flutter/material.dart';
import 'package:futebol_app/components/app_bar.dart';
import 'package:futebol_app/components/card.dart';
import 'package:futebol_app/components/future_builder.dart';
import 'package:futebol_app/components/variables.dart';
import 'package:futebol_app/inicializacao/iniciando_dados.dart';
import 'package:futebol_app/models/pais.dart';
import 'package:futebol_app/pages/campeonatos_screen.dart';
import 'package:futebol_app/pages/favoritos_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Future<List<Pais>> fetchPais() async {
    await Future.delayed(const Duration(seconds: 1));
    return paises;
  }


  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AppBarra(titulo: "Países"),
      body: GestureDetector(
        child: FutureBuild(
          fetchItems: fetchPais,
          itemBuilder: (pais, index) => Cards(
            foto: pais[index].foto,
            texto: pais[index].nome,
            onTAP: () {
              fotoPais = pais[index].foto;
              camps = pais[index].campeonato;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CampeonatosScreen(
                          campeonatos: pais[index].campeonato, foto: fotoPais,)));
            },
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavoritosScreen(
                        timesFavoritos: favoritos,
                        contador: favoritos.length)));
          }
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations:  <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
          icon: Badge(
            label: Text('${favoritos.length}'),
            child: const Icon(Icons.star),
          ),
          label: 'Favoritos',
        ),
        ],
      ),
    );
  }
}
