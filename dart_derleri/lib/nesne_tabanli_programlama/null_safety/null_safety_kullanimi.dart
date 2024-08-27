void main() {
//Null safety - Nullable - Optional(Swift)
//null : nil(Swift) : NoN

  String str = "Merhaba";

  //Tanımlama
  String? mesaj = null;

  //mesaj değişkenine bir değer verildiğinde mesaj? metodunu kullanmanıza gerek kalmaz.
  mesaj = "merhaba";

  //Yöntem 1;
  print("Yöntem 1: ${mesaj?.toUpperCase()}");

  //Yöntem 2;
  //mesaj! olarak kullanılırsa ben yazdığım koda güveniyorum diyebilirsiniz hata alma olasılığınız artar.
  //print("Yöntem 1: ${mesaj!.toUpperCase()}");

  //Yöntem 3;
  if (mesaj != null) {
    print("Yöntem 3 : ${mesaj.toUpperCase()}");
  } else {
    print("Mesaj nulldur");
  }
}
