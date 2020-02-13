import 'package:flutter/foundation.dart';
import 'package:flutter_controle_estado/model/heroi_model.dart';

class HeroisController extends ChangeNotifier {

  List<HeroiModel> herois = [
    HeroiModel(nome: "Homem Aranha"),
    HeroiModel(nome: "Homem de Ferro"),
    HeroiModel(nome: "Capitão Caverna"),
    HeroiModel(nome: "Dead Pool"),
    HeroiModel(nome: "Batman"),
    HeroiModel(nome: "Mulher-Maravilha"),
    HeroiModel(nome: "Capitão América"),
    HeroiModel(nome: "Hulk"),
    HeroiModel(nome: "Wolverine"),
    HeroiModel(nome: "Flash"),
    HeroiModel(nome: "Thor"),
    HeroiModel(nome: "Coringa"),
    HeroiModel(nome: "Super Mouse"),
  ];

  checkFavoritos(HeroiModel heroi){
    heroi.ehFavorito = !heroi.ehFavorito;
    notifyListeners();
  }

  int totalFavoritos(){
    return herois.where((heroi) => heroi.ehFavorito).length;
  }

}
