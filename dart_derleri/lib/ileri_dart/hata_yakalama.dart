void main() {
  //1.Compile error
  String x = "Hello";
  //x = 100;

  //2.Runtime exception (error) kodu çalıştırırken alınan hata
  var liste = <String>[];
  liste.add("Ahmet"); //0
  liste.add("Zeynep"); //1

  try {
    String isim = liste[3];
    print("Gelen isim : $isim");
  } catch (a) {
    print("Hata");
  }
}
