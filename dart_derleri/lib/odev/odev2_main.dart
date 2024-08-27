import 'package:dart_derleri/odev/odev_2.dart';

void main() {
  var o2 = odev2();

  double sonuc = o2.soru1(5.6);
  print("sonuc : $sonuc");
//----------------------------------------------------------------

  Dikdortgen dikdortgen = Dikdortgen();

  double alanSonucu = dikdortgen.alan(5.0, 3.0);
  print("diktörtgen alanı : $alanSonucu");

}
