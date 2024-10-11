void main() {
  // 1. Kilometreyi Mile Dönüştürme Metodu
  double kmToMile(double km) {
    return km * 0.621;
  }

  // 2. Dikdörtgenin Alanını Hesaplayan Metod
  double dikdortgenAlani(double kenar1, double kenar2) {
    return kenar1 * kenar2;
  }

  // 3. Faktöriyel Hesaplayan Metod
  int faktoriyel(int sayi) {
    if (sayi <= 1) return 1;
    return sayi * faktoriyel(sayi - 1);
  }

  // 4. Kelime İçindeki 'e' Harflerini Sayan Metod
  int eHarfiniSay(String kelime) {
    return kelime.split('e').length - 1;
  }

  // 5. Kenar Sayısına Göre İç Açı Hesaplama Metodu
  double icAciHesapla(int kenarSayisi) {
    return ((kenarSayisi - 2) * 180) / kenarSayisi;
  }

  // 6. Gün Sayısına Göre Maaş Hesaplayan Metod
  double maasHesapla(int gunSayisi) {
    int toplamSaat = gunSayisi * 8;
    int mesaiSaati = toplamSaat > 150 ? toplamSaat - 150 : 0;
    int normalSaat = toplamSaat - mesaiSaati;

    return (normalSaat * 40) + (mesaiSaati * 80);
  }

  // 7. Otopark Ücretini Hesaplayan Metod
  double otoparkUcreti(int saat) {
    if (saat <= 1) {
      return 50.0;
    } else {
      return 50.0 + (saat - 1) * 10.0;
    }
  }

  print("10 km = ${kmToMile(10)} mil");
  print("Dikdörtgenin alanı: ${dikdortgenAlani(5, 10)} m²");
  print("5! = ${faktoriyel(5)}");
  print("'Merhaba' kelimesinde ${eHarfiniSay('Merhaba')} tane 'e' harfi var.");
  print("Dörtgenin iç açısı: ${icAciHesapla(4)} derece");
  print("20 gün çalışmanın maaşı: ${maasHesapla(20)} ₺");
  print("3 saat otopark ücreti: ${otoparkUcreti(3)} ₺");
}
