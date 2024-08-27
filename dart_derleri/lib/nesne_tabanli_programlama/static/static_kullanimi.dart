import 'package:dart_derleri/nesne_tabanli_programlama/static/a_sinifi.dart';

void main() {
  var a = ASinifi();

  //Standart kullanımı
  //print(a.degisken);
  //a.metod();

  //Sanal nesne - isimsiz nesne
  //print(ASinifi().degisken);//1. Nesne
  //ASinifi().metod();//2. Nesne

  //Static kullanım
  print(ASinifi.degisken);
  ASinifi.metod();
}
