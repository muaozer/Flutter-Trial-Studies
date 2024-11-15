import 'package:dart_derleri/nesne_tabanli_programlama/enumaration/konserve_boyut.dart';

void main() {
  //Enumeration , enum
  ucretHesapla(KonserveBoyut.orta, 20);
}

void ucretHesapla(KonserveBoyut boyut, int adet) {
  switch (boyut) {
    case KonserveBoyut.kucuk:
      {
        print("Toplam maliyet : ${adet * 32} TL");
      }
      break;
    case KonserveBoyut.orta:
      {
        print("Toplam maliyet : ${adet * 45} TL");
      }
      break;
    case KonserveBoyut.buyuk:
      {
        print("Toplam maliyet : ${adet * 67} TL");
      }
      break;
  }
}
