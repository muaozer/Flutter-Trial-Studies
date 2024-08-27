import 'package:dart_derleri/nesne_tabanli_programlama/kalitim/Ev.dart';
import 'package:dart_derleri/nesne_tabanli_programlama/kalitim/Saray.dart';
import 'package:dart_derleri/nesne_tabanli_programlama/kalitim/Villa.dart';

void main() {
  var topkapiSaray = Saray(kuleSayisi: 10, pencereSayisi: 300);
  print(topkapiSaray.kuleSayisi);
  print(topkapiSaray.pencereSayisi);

  var bogazVilla = Villa(garajVarmi: true, pencereSayisi: 50);
  print(bogazVilla.garajVarmi);
  print(bogazVilla.pencereSayisi);

  //Classları birbirine dönüştürme
  //Tip kontrolü
  if (topkapiSaray is Saray) {
    //instance of diye javada geçer
    print("Saraydir");
  } else {
    print("Saray değildir");
  }

  //Downcasting
  //Super Classı alt classlara çevirir
  //Evi Saraya dönüştürme
  //Üst classı alt classa çevirme
  var ev = Ev(pencereSayisi: 10);
  var saray = ev as Saray;

  //Upcasting
  //Alt classı üst classa çevirme
  var s = Saray(kuleSayisi: 3, pencereSayisi: 100);
  Ev e = s; //e ev nesnesi s de saray
}
