import 'package:flutter/material.dart';
import 'package:futebol_app/components/texto.dart';

class Cards extends StatelessWidget {
  final String foto;
  final String texto;
  final VoidCallback onTAP;
  const Cards(
      {super.key,
      required this.foto,
      required this.texto,
      required this.onTAP});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTAP,
      child: SizedBox(
        width: 300.0,
        height: 200.0,
        child: Card(
          color: const Color.fromARGB(255, 21, 21, 21),
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    foto,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  Texto(texto: texto, tamanho: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
