import 'package:dart_derleri/nesne_tabanli_programlama/fonksiyonlar/fonksiyonlar.dart';

void main() {
  var f = Fonksiyonlar();

  f.selamla1();

  String gelenSonuc = f.selamla2();
  print("Gelen Sonuç : $gelenSonuc");

  f.selamla3("Zeynep");

  int gelenToplam = f.toplama(10, 20);
  print("Gelen Toplam : $gelenToplam");
}
