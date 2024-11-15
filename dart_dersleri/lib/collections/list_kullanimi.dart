void main() {
  //Tanımlama
  var plakalar = [16, 23, 6];
  var meyveler = <String>[];
  //Veri ekleme
  meyveler.add("Muz"); //0 index
  meyveler.add("Kiraz"); //1 index
  meyveler.add("Elma"); //2 index
  print(meyveler);

  //Güncelleme
  meyveler[1] = "Yeni Kiraz";
  print(meyveler);

  //Insert
  meyveler.insert(1, "Portlakal");
  print(meyveler);

  //Veri okuma
  String meyve = meyveler[2];
  print(meyve);

  print("Boyut : ${meyveler.length}");
  print(
      "Boş Kontrol : ${meyveler.isEmpty}"); //veya boş değilmi isNotEmpty kullanılabilir.

  //For each
  for (var meyve in meyveler) {
    print("Sonuç : $meyve");
  }
  //0 - 1 - 2 - 3
  for (var i = 0; i < meyveler.length; i++) {
    print("$i. -> ${meyveler[i]}");
  }

  //reversed terse listeyi serse çevirme
  var liste = meyveler.reversed.toList();
  print(liste);

  //alfabetik sıralama
  meyveler.sort();
  print(meyveler);

  //Dizi silme
  meyveler.removeAt(1);
  print(meyveler);

  //Liste sıfırlama
  meyveler.clear();
  print(meyveler);
}
