import 'package:dart_derleri/collections/ogrenciler.dart';

void main() {
  var o1 = Ogrenciler(no: 25, ad: "Ahmet", sinif: "4D");
  var o2 = Ogrenciler(no: 30, ad: "Mehmet", sinif: "5A");
  var o3 = Ogrenciler(no: 9, ad: "Can", sinif: "3H");

  var ogrencilerList = <Ogrenciler>[];
  ogrencilerList.add(o1);
  ogrencilerList.add(o2);
  ogrencilerList.add(o3);

  for (var o in ogrencilerList) {
    print("No : ${o.no}, Ad : ${o.ad}, Sınıf : ${o.sinif}");
  }

  //Sorting
  print("---------- Sayısal : Küçükten > Büyüğe --------");
  Comparator<Ogrenciler> s1 = (x, y) => x.no.compareTo(y.no);
  ogrencilerList.sort(s1);
  for (var o in ogrencilerList) {
    print("No : ${o.no}, Ad : ${o.ad}, Sınıf : ${o.sinif}");
  }

  print("---------- Sayısal : Büyükten > Küçüğe --------");
  Comparator<Ogrenciler> s2 = (x, y) => y.no.compareTo(x.no);
  ogrencilerList.sort(s2);
  for (var o in ogrencilerList) {
    print("No : ${o.no}, Ad : ${o.ad}, Sınıf : ${o.sinif}");
  }

  print("---------- Alfabetik : Küçükten > Büyüğe --------");
  Comparator<Ogrenciler> s3 = (x, y) => x.ad.compareTo(y.ad);
  ogrencilerList.sort(s3);
  for (var o in ogrencilerList) {
    print("No : ${o.no}, Ad : ${o.ad}, Sınıf : ${o.sinif}");
  }

  print("---------- Alfabetik : Büyükten > Küçüğe --------");
  Comparator<Ogrenciler> s4 = (x, y) => y.ad.compareTo(x.ad);
  ogrencilerList.sort(s4);
  for (var o in ogrencilerList) {
    print("No : ${o.no}, Ad : ${o.ad}, Sınıf : ${o.sinif}");
  }

  //Filtreleme
  //where veri tabanında kullanılan bir koşuldur
  print("---------- Listeleme : 10'dan Büyük 25'den Küçük No --------");
  Iterable<Ogrenciler> f1 = ogrencilerList.where((ogrenciNesnesi) {
    return ogrenciNesnesi.no > 10 && ogrenciNesnesi.no < 50;
  });

  var list1 = f1.toList();
  for (var o in list1) {
    print("No : ${o.no}, Ad : ${o.ad}, Sınıf : ${o.sinif}");
  }

  print("---------- Listeleme : String araştırma --------");
  Iterable<Ogrenciler> f2 = ogrencilerList.where((ogrenciNesnesi) {
    return ogrenciNesnesi.ad.contains("a");
  });

  var list2 = f2.toList();
  for (var o in list2) {
    print("No : ${o.no}, Ad : ${o.ad}, Sınıf : ${o.sinif}");
  }
}
