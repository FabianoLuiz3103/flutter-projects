
import 'package:flutter/material.dart';
import 'package:futebol_app/components/app_bar.dart';
import 'package:futebol_app/components/card.dart';
import 'package:futebol_app/components/future_builder.dart';
import 'package:futebol_app/components/nav_bar.dart';
import 'package:futebol_app/components/variables.dart';
import 'package:futebol_app/models/campeonato.dart';
import 'package:futebol_app/pages/times_screen.dart';

class CampeonatosScreen extends StatelessWidget {
  final List<Campeonato> campeonatos;
  final String foto;
   const CampeonatosScreen({super.key, required this.campeonatos, required this.foto});

  Future<List<Campeonato>> fetchCampeonatos() async {
    await Future.delayed(const Duration(seconds: 1));
    return campeonatos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarra(titulo: "Campeonatos"),
      body: FutureBuild(
        fetchItems: fetchCampeonatos,
        itemBuilder: (campeonato, index) => Cards(
            foto: campeonato[index].foto,
            texto: campeonato[index].nome,
            onTAP: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TimesScreen(timesCarregados: campeonato[index].times)));
            }),
      ),
      bottomNavigationBar: NavBar(foto: fotoPais, currentPageIndex: 1, contador: favoritos.length,)
    );
  }
}

