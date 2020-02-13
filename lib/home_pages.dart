import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'herois_controller.dart';
import 'model/heroi_model.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {
    HeroisController heroisCtrl = Provider.of<HeroisController>(context);

    return ListView.builder(
        itemCount: heroisCtrl.herois.length,
        itemBuilder: (context, idx) {
          return _buildItem(heroisCtrl.herois[idx]);
        });
  }

  _buildItem(HeroiModel heroi) {
    HeroisController heroisCtrl = Provider.of<HeroisController>(context);
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
            child: Consumer<HeroisController>(
              builder: (context, ctrl, widget){
                return Text(
                  "Total de Favoritos:  ${ctrl.totalFavoritos()}",
                  style: TextStyle(fontSize: 16.0),
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: Consumer<HeroisController>(
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
