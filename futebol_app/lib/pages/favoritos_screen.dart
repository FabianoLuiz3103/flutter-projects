import 'package:flutter/material.dart';
import 'package:futebol_app/components/app_bar.dart';
import 'package:futebol_app/components/variables.dart';
import 'package:futebol_app/components/nav_bar.dart';
import 'package:futebol_app/models/time.dart';
import 'package:futebol_app/pages/details_times.dart';

class  FavoritosScreen extends StatefulWidget {
  final List<Time> timesFavoritos;
  final int contador;
  const FavoritosScreen({super.key, required this.timesFavoritos, required this.contador});

  @override
  State<FavoritosScreen> createState() => _TimesScreenState();
}

class _TimesScreenState extends State<FavoritosScreen> {
  late List<Time> _times;
  late int _contador;
  @override
  void initState(){
    super.initState();
    _times = widget.timesFavoritos;
    _contador = widget.contador;
  }
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarra(titulo: "Favoritos"),
      body: ListView.builder(
              itemCount: _times.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_times[index].foto),
                    backgroundColor: Colors.white,
                  ),
                  title: Text(_times[index].nome),
                  trailing: IconButton(
              icon: _times[index].favorito ? activateIcon : inactivateIcon,
              onPressed: () {
                setState(() {
                  _times[index].favorito = !_times[index].favorito;
                if (!_times[index].favorito) {
                  _contador--; 
                }
                if (!_times[index].favorito) {
                  _times.remove(_times[index]);
                }
                });
              },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsTimes(time: _times[index]),
                      ),
                    );
                  },
                );
              },
            ),
        bottomNavigationBar:  NavBar(foto: fotoPais, currentPageIndex: 2, contador: _contador)
    );
  }
}
