import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _trasferencia = new List();

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciaState();
  }
}

class ListaTranferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transferências',
        ),
      ),
      body: ListView.builder(
        itemCount: widget._trasferencia.length,
        itemBuilder: (contex, index) {
          final transferencia = widget._trasferencia[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTrasferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('Entrou no then do future');
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              setState(() {
                widget._trasferencia.add(transferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
