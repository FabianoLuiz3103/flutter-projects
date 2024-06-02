import 'package:flutter/material.dart';

class FutureBuild<T> extends StatelessWidget {
  final Future<List<T>> Function()? fetchItems;
  final Widget Function(List<T> items, int index) itemBuilder;

  const FutureBuild({
    super.key,
    required this.fetchItems,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
      return FutureBuilder<List<T>>(
        future: fetchItems!(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar os itens'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhum item encontrado'),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    Center(
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        children: List.generate(
                          snapshot.data!.length,
                          (index) {
                            return itemBuilder(snapshot.data!, index);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
  }
}
