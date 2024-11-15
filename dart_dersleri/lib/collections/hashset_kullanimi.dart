import 'dart:collection';

void main() {
  //Tanımlama
  var plakalar = HashSet.from([16, 23, 6]);
  var meyveler = HashSet<String>();

  //Değer atama
  meyveler.add("Kiraz");
  meyveler.add("Muz");
  meyveler.add("Elma");
  print(meyveler);

  //Listeye yeni eleman ekleme
  meyveler.add("Amasya Elması");
  print(meyveler);

  //Listenin ikinci indexindeki elemanı yazdırma
  String meyve = meyveler.elementAt(2);
  print(meyve);

  //Dizinin kaç elemanlı olduğunu yazdırır
  print("Boyut : ${meyveler.length}");

  //Dizi boş mu dolumu kontrolü yapar boş ise tru değilse false yazar
  print("Boş kontrol : ${meyveler.isEmpty}");

  //Diziyi tek tek ekrana yazdırır
  for (var meyve in meyveler) {
    print("Sonuç : ${meyve}");
  }

  //İndexi 0 dan başlatarak meyveler.leng uzunğuna gelene kadar artırarark ekrana yazdırır.
  for (var i = 0; i < meyveler.length; i++) {
    print("$i. -> ${meyveler.elementAt(i)}");
  }

  //Elma isimli veriyi siler.
  meyveler.remove("Elma");
  print(meyveler);

  //Tüm listeyi temizler
  meyveler.clear();
  print(meyveler);
}
