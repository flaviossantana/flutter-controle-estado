import 'package:flutter/material.dart';
import 'package:flutter_controle_estado/herois/herois_bloc.dart';
import 'package:provider/provider.dart';

import 'cep/consulta_cep_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroisBloc>(
          create: (_) => HeroisBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: ConsultaCepPage(),
      ),
    );
  }
}
