import 'package:dart_derleri/nesne_tabanli_programlama/araba.dart';

void main() {
  //Nesne oluşturma
  var bmw = Araba(renk: "Mavi", hiz: 100, calisiyorMu: true);

  /*print("---------------------------------------------------------------");
  print("Renk         : ${bmw.renk}");
  print("Hız          : ${bmw.hiz}");
  print("Çalışıyor mu : ${bmw.calisiyorMu}");*/

  bmw.bilgiAl();

  //Değer atama
  bmw.renk = "Kırmızı";
  bmw.hiz = 0;
  bmw.calisiyorMu = false;
  /*print("---------------------------------------------------------------");
  print("Renk         : ${bmw.renk}");
  print("Hız          : ${bmw.hiz}");
  print("Çalışıyor mu : ${bmw.calisiyorMu}");*/

  bmw.bilgiAl();
  bmw.calistir();
  bmw.bilgiAl();
  bmw.hizlan(100);
  bmw.bilgiAl();
  bmw.yavasla(9);
  bmw.bilgiAl();

  var sahin = Araba(renk: "Beyaz", hiz: 0, calisiyorMu: false);
  sahin.renk = "Sarı";
  sahin.hiz = 150;
  sahin.calisiyorMu = true;
  sahin.bilgiAl();
  /*print("---------------------------------------------------------------");
  print("Renk         : ${bmw.renk}");
  print("Hız          : ${bmw.hiz}");
  print("Çalışıyor mu : ${bmw.calisiyorMu}");*/
  sahin.bilgiAl();
  sahin.durdur();
  sahin.bilgiAl();
  sahin.hizlan(150);
  sahin.bilgiAl();
  sahin.yavasla(10);
  sahin.bilgiAl();
}
