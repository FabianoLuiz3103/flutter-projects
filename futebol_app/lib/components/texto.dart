import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Texto extends StatelessWidget {
  final String texto;
  final double tamanho;
  const Texto({super.key, required this.texto, required this.tamanho});

  @override
  Widget build(BuildContext context) {
    return Text(texto, 
    style: GoogleFonts.permanentMarker(
                              fontSize: tamanho,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.white));
  }
}