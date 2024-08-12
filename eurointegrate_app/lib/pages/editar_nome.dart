import 'package:eurointegrate_app/components/campos_edicao.dart';
import 'package:eurointegrate_app/components/consts.dart';
import 'package:flutter/material.dart';

class EditarNome extends StatefulWidget {
  final String primeiroNome;
  final String sobrenome;

  const EditarNome({super.key, required this.primeiroNome, required this.sobrenome});

  @override
  _EditarNomeState createState() => _EditarNomeState();
}

class _EditarNomeState extends State<EditarNome> {
  late TextEditingController nomeController;
  late TextEditingController sobrenomeController;
  bool isSaveButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.primeiroNome);
    sobrenomeController = TextEditingController(text: widget.sobrenome);

    // Adiciona listeners para monitorar mudanças nos campos
    nomeController.addListener(_checkIfValuesChanged);
    sobrenomeController.addListener(_checkIfValuesChanged);
  }

  @override
  void dispose() {
    nomeController.dispose();
    sobrenomeController.dispose();
    super.dispose();
  }

  void _checkIfValuesChanged() {
    setState(() {
      isSaveButtonEnabled = nomeController.text != widget.primeiroNome ||
                            sobrenomeController.text != widget.sobrenome;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações pessoais'),
        backgroundColor: azulEuro,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0, left: 16.0, top: 20.0),
              child: Text(
                'Nome e sobrenome',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24.0, left: 16.0),
              child: Text(
                'Como gostaria que nós te chamássemos?',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
            ),
            CampoNovo(
              nomeController: nomeController,
              label: 'Nome',
            ),
            CampoNovo(
              nomeController: sobrenomeController,
              label: 'Sobrenome',
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSaveButtonEnabled ? () {
                    // Lógica para salvar os dados
                  } : null,
                  child: Text('Salvar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulEuro,
                    padding: EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
