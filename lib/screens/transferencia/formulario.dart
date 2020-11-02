import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';


class FormularioTrasferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTrasferencia> {
  final TextEditingController _controllerCampoNConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferêcia"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controllerCampoNConta,
              rotulo: 'Número da Conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controllerCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: () {
                _criarTransferencia(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    print("Clicou no confirmar");
    final int nroConta = int.tryParse(_controllerCampoNConta.text);
    final double valor = double.tryParse(_controllerCampoValor.text);

    if (nroConta != null && valor != null) {
      print("$nroConta");
      print("$valor");

      final transferencia = Transferencia(valor, nroConta);

      debugPrint('Criando Tranferencia');

      print("$transferencia");

      Navigator.pop(context, transferencia);
    }
  }
}
