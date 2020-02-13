import 'package:flutter/material.dart';
import 'package:flutter_controle_estado/model/endereco_model.dart';

import 'consulta_cep_bloc.dart';

class ConsultaCepPage extends StatefulWidget {
  @override
  _ConsultaCepPageState createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {

  ConsultaCepBloc _consultaCepBloc = ConsultaCepBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta CEP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (valor){
                _consultaCepBloc.input.add(valor);
              },
              decoration: InputDecoration(
                hintText: "Digite seu CEP",
                border: OutlineInputBorder(),
              ),
            ),
            Center(
              child: StreamBuilder<EnderecoModel>(
                initialData: EnderecoModel(bairro: ""),
                stream: _consultaCepBloc.output,
                builder: (context, snapshot) {

                  if(snapshot.hasError){
                    return Text("Endereço não ncontrado.");
                  }

                  EnderecoModel endereco = snapshot.data;
                  return Text("Bairro: ${endereco?.bairro}");
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
