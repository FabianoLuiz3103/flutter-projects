import 'package:flutter/material.dart';
import 'package:futebol_app/components/app_bar.dart';
import 'package:futebol_app/components/nav_bar.dart';
import 'package:futebol_app/components/variables.dart';
import 'package:futebol_app/models/time.dart';
import 'package:futebol_app/pages/details_times.dart';

class TimesScreen extends StatefulWidget {
  final List<Time> timesCarregados;
  const TimesScreen({super.key, required this.timesCarregados});

  @override
  State<TimesScreen> createState() => _TimesScreenState();
}

class _TimesScreenState extends State<TimesScreen> {
  //List<Time> favoritos = [];
  late List<Time> _times;
  @override
  void initState(){
    super.initState();
    _times = widget.timesCarregados;
  }
  int currentPageIndex = 1;
  int _contador = favoritos.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarra(titulo: "Times"),
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
                if (_times[index].favorito) {
                  _contador++; 
                } else {
                  _contador--; 
                }
                if (_times[index].favorito) {
                  favoritos.add(_times[index]);
                } else {
                  favoritos.remove(_times[index]);
                  //favoritos.removeWhere((time) => time.nome == _times[index].nome);
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
        bottomNavigationBar: NavBar(foto: fotoPais, currentPageIndex: 1, contador: _contador)
    );
  }
}
