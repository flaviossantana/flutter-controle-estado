import 'package:flutter/material.dart';
import 'package:flutter_controle_estado/herois_controller.dart';
import 'package:flutter_controle_estado/home_pages.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroisController>(
          create: (_) => HeroisController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: HomeWidget(),
      ),
    );
  }
}
