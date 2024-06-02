import 'package:flutter/material.dart';
import 'package:futebol_app/models/campeonato.dart';
import 'package:futebol_app/models/time.dart';

List<Time> favoritos = [];
String fotoPais = "";
List<Campeonato> camps = [];

const activateIcon = Icon(Icons.star, color: Color.fromARGB(255, 246, 255, 0));
const inactivateIcon = Icon(Icons.star_border, color: Color.fromARGB(255, 246, 255, 0),);