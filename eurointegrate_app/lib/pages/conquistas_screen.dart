import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:eurointegrate_app/components/consts.dart';
import 'package:eurointegrate_app/model/conquista.dart';

class ConquistasScreen extends StatefulWidget {
  const ConquistasScreen({super.key});

  @override
  State<ConquistasScreen> createState() => _ConquistasScreenState();
}

class _ConquistasScreenState extends State<ConquistasScreen> {
  int myPoints = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conquistas"),
        backgroundColor: azulEuro,
      ),
      body: FutureBuilder<List<Conquista>>(
        future: loadConquistas(), // Certifique-se de que esta função está definida
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar conquistas"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhuma conquista disponível"));
          } else {
            final conquistas = snapshot.data!;
            return ListView.separated(
              itemCount: conquistas.length,
              itemBuilder: (context, index) {
                final isUnlocked = myPoints >= conquistas[index].pontos;

                return Stack(
                  children: [
                    ListTile(
                      leading: Image.asset(conquistas[index].image),
                      title: Text(conquistas[index].titulo),
                      subtitle: Text(conquistas[index].descricao),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: isUnlocked
                            ? const Icon(Icons.arrow_forward_ios)
                            : const Icon(Icons.block, color: Colors.white),
                      ),
                    ),
                    if (!isUnlocked)
                      Positioned.fill(
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              color: Colors.black.withOpacity(0.03),
                            ),
                          ),
                        ),
                      ),
                    if (!isUnlocked)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.star, color: Colors.amber),
                                ),
                                Text(
                                  conquistas[index].pontos.toString(),
                                  style: const TextStyle(color: azulEuro),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(); // Adiciona um divisor entre os itens
              },
            );
          }
        },
      ),
    );
  }
}
