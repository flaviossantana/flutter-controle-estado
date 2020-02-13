import 'package:flutter/foundation.dart';
import 'package:flutter_controle_estado/model/heroi_model.dart';

class HeroisController extends ChangeNotifier {

  List<HeroiModel> herois = [
    HeroiModel(nome: "Homem Aranha"),
    HeroiModel(nome: "Homem de Ferro"),
    HeroiModel(nome: "Capitão Caverna"),
    HeroiModel(nome: "Dead Pool"),
  ];

  checkFavoritos(HeroiModel heroi){
    heroi.ehFavorito = !heroi.ehFavorito;
    notifyListeners();
  }

  int totalFavoritos(){
    return herois.where((heroi) => heroi.ehFavorito).length;
  }

}
