import 'package:flutter/material.dart';
import 'package:futebol_app/components/variables.dart';
import 'package:futebol_app/pages/campeonatos_screen.dart';
import 'package:futebol_app/pages/favoritos_screen.dart';
import 'package:futebol_app/pages/initial_screen.dart';

class NavBar extends StatelessWidget {
  final String foto;
  final int currentPageIndex;
  final int contador;
  const NavBar({super.key, required this.foto, required this.currentPageIndex, required this.contador});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        if (index == 0) {
           Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => InitialScreen()),
            (Route<dynamic> route) => false,
          );
        } if(index==1){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CampeonatosScreen(campeonatos: camps, foto: fotoPais,)),
            (Route<dynamic> route) => false,
          );
        } if (index == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritosScreen(timesFavoritos: favoritos, contador: favoritos.length)));
        }
      },
      indicatorColor: Colors.amber,
      selectedIndex: currentPageIndex,
      destinations: <Widget>[
        const NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
       NavigationDestination(
         selectedIcon: CountryFlagIcon(foto: foto),
         icon: CountryFlagIcon(foto: foto),
         label: "País",
       ),
        NavigationDestination(
          icon: Badge(
            label: Text('$contador'),
            child: const Icon(Icons.star),
          ),
          label: 'Favoritos',
        ),
      ],
    );
  }
}

class CountryFlagIcon extends StatelessWidget {
  final String foto;
  final double size;

  const CountryFlagIcon({super.key, required this.foto, this.size = 24,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Image.asset(foto),
    );
  }
}