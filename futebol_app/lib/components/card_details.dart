import 'package:flutter/material.dart';
import 'package:futebol_app/components/texto.dart';
import 'package:futebol_app/components/variables.dart';
import 'package:futebol_app/models/time.dart';

class CardDetails extends StatefulWidget {
  final Time time;
   final VoidCallback updateFavoriteCounter;
  const CardDetails({super.key, required this.time, required this.updateFavoriteCounter});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          width: double.infinity,
          height: 500.0,
          child: Card(
            color: const Color.fromARGB(255, 21, 21, 21),
            elevation: 2.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             Image.asset(
                          widget.time.foto,
                          width: 100,
                        ),
                IconButton(
              icon: widget.time.favorito ? activateIcon : inactivateIcon,
              onPressed: () {
                setState(() {
                widget.time.favorito = !widget.time.favorito;
                if (widget.time.favorito) {
                  favoritos.add(widget.time);
                } else {
                  favoritos.remove(widget.time);
                }
                  widget.updateFavoriteCounter();
                });
              },
                  ),
                          ],
                        ),
                        const SizedBox(
                          height: 22.0,
                        ),
                       Texto(texto: widget.time.nome, tamanho: 15)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                 Column(
                  children: [
                    Texto(texto: "Fundado em.....: ${widget.time.fundacao}", tamanho: 15),
                    SizedBox(height: 10.0,),
                    Texto(texto: "Número de títulos.....: ${widget.time.titulos}", tamanho: 15),
                    SizedBox(height: 10.0,),
                    Texto(texto: "Número de torcedores....: ${widget.time.torcedores}", tamanho: 15),
                    SizedBox(height: 10.0,),
                  
                  ],
                )
              ],
            ),
          ),
        );
  }
}