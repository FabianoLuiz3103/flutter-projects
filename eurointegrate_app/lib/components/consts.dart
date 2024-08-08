import 'package:flutter/material.dart';
const medidaRaio = Radius.circular(25.0);
const raio =  BorderRadius.all(medidaRaio);
const azulEuro = Color(0xFF06065F);
const cinza = Color(0xFFD9D9D9);
const WidgetStateProperty<Color> botaoAzul = WidgetStatePropertyAll(azulEuro);
const WidgetStateProperty<OutlinedBorder> radiusBorda = WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: raio),);
