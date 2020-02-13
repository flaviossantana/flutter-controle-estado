import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_controle_estado/model/endereco_model.dart';

class ConsultaCepBloc {
  final StreamController<String> _streamCtrl = StreamController<String>();

  Sink<String> get input => _streamCtrl.sink;

  Stream<EnderecoModel> get output => _streamCtrl.stream
      .where((cep) => cep.length > 7)
      .asyncMap((cep) => _searchCep(cep));

  String _url(String cep) {
    return "https://viacep.com.br/ws/${cep}/json/";
  }

  Future<EnderecoModel> _searchCep(String cep) async {
    Response response = await Dio().get(_url(cep));
    return EnderecoModel.fromJson(response.data);
  }
}
