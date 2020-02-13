import 'package:flutter/material.dart';
import 'package:flutter_controle_estado/herois/herois_bloc.dart';
import 'package:flutter_controle_estado/model/heroi_model.dart';
import 'package:provider/provider.dart';

class HeroisListWidget extends StatefulWidget {
  @override
  _HeroisListWidgetState createState() => _HeroisListWidgetState();
}

class _HeroisListWidgetState extends State<HeroisListWidget> {
  _buildList() {
    HeroisBloc heroisCtrl = Provider.of<HeroisBloc>(context);
    return ListView.builder(
        itemCount: heroisCtrl.herois.length,
        itemBuilder: (context, idx) {
          return _buildItem(heroisCtrl.herois[idx]);
        });
  }

  _buildItem(HeroiModel heroi) {
    HeroisBloc heroisCtrl = Provider.of<HeroisBloc>(context);
    return ListTile(
      title: Text(heroi.nome),
      trailing: heroi.ehFavorito
          ? Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : Icon(Icons.star_border),
      onTap: () {
        heroisCtrl.checkFavoritos(heroi);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Consumer<HeroisBloc>(
              builder: (context, ctrl, widget) {
                return Text(
                  "Total de Favoritos:  ${ctrl.totalFavoritos()}",
                  style: TextStyle(fontSize: 16.0),
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: Consumer<HeroisBloc>(
              builder: (context, heroisController, widget) {
                return _buildList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
