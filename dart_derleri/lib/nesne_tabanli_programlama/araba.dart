//late kullanılırsa class değerleri daha sonradan verilebilir.
/*class Araba {
  late String renk;
  late int hiz;
  late bool calisiyorMu;
}*/

class Araba {
  String renk;
  int hiz;
  bool calisiyorMu;

  // Constructor ALT + INSERT
  // required bize renk, hiz, calisiyormu çıktılarını verdi
  Araba({required this.renk, required this.hiz, required this.calisiyorMu});

  void calistir() {
    //Side effect : Yan etki
    calisiyorMu = true;
    hiz = 5;
  }

  void durdur() {
    calisiyorMu = false;
    hiz = 0;
  }

  void hizlan(int kacKM) {
    hiz += kacKM; //hiz = hiz + kacKM;
  }

  void yavasla(int kacKM) {
    hiz -= kacKM; //hiz = hiz + kacKM;
  }

  void bilgiAl() {
    print("---------------------------------------------------------------");
    print("Renk         : ${renk}");
    print("Hız          : ${hiz}");
    print("Çalışıyor mu : ${calisiyorMu}");
  }
}
