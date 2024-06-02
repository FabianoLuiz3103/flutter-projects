import 'package:flutter/material.dart';
import 'package:futebol_app/components/app_bar.dart';
import 'package:futebol_app/components/card_details.dart';
import 'package:futebol_app/components/nav_bar.dart';
import 'package:futebol_app/components/variables.dart';
import 'package:futebol_app/models/time.dart';

class DetailsTimes extends StatefulWidget {
  final Time time;
  const DetailsTimes({super.key, required this.time});

  @override
  State<DetailsTimes> createState() => _DetailsTimesState();
}

class _DetailsTimesState extends State<DetailsTimes> {
 
    late int favoritosCounter = favoritos.length;
     void updateFavoriteCounter() {
    setState(() {
      favoritosCounter = favoritos.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarra(titulo: widget.time.nome,),
      body: CardDetails(time: widget.time, updateFavoriteCounter: updateFavoriteCounter,),
      bottomNavigationBar: NavBar(foto: fotoPais, currentPageIndex: 2, contador: favoritosCounter),
    );
  }
}