import 'package:eurointegrate_app/components/consts.dart';
import 'package:flutter/material.dart';

class EditarNascimento extends StatefulWidget {
  final String dataNascimento;

  const EditarNascimento({super.key, required this.dataNascimento});

  @override
  _EditarNascimentoState createState() => _EditarNascimentoState();
}

class _EditarNascimentoState extends State<EditarNascimento> {
  late TextEditingController _dataNascimentoController;
  late DateTime _dataNascimento;
  bool isSaveButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Converte a string para DateTime, assumindo que a data está no formato 'yyyy-MM-dd'
    _dataNascimento = DateTime.parse(widget.dataNascimento);
    _dataNascimentoController = TextEditingController(
      text: _formatDate(_dataNascimento),
    );
  }

  @override
  void dispose() {
    _dataNascimentoController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dataNascimento, // A data inicial agora será a última selecionada
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _dataNascimento) {
      setState(() {
        _dataNascimento = picked; // Atualiza a data de nascimento para a nova data selecionada
        _dataNascimentoController.text = _formatDate(_dataNascimento);
        isSaveButtonEnabled = _dataNascimento != DateTime.parse(widget.dataNascimento); // Habilita o botão apenas se a nova data for diferente da original
      });
    }
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
                'Data de nascimento',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24.0, left: 16.0),
              child: Text(
                'Insira sua data de nascimento',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: _dataNascimentoController,
                  decoration: const InputDecoration(
                    labelText: 'Data de nascimento',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0x80424242)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: azulEuro),
                    ),
                  ),
                ),
              ),
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
