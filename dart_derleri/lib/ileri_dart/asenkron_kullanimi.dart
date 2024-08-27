Future <void> main() async{
  //Bir işlem yapılırken onu farklı çekirdeklere yaptırmaya asenkron denir.
  //Asenkron işlem çekirdeklerin birbirine bağlı olmadığı için, işlemler birbirinin bitmesine ve çekirdeklerin birbirini beklememesine gerek kalmaz.
  //Bu yüzden, asenkron işlemlerde hızlı işlemlerin sonucu daha hızlı işlemlerin başarılı olması ve daha fazla işlem yapılması sağlanır.
  //Asenkron işlemlerde, işlem sırasında diğer işlemlerin devam etmesine izin verilir.
  //Örnek olarak, bir dosya yükleme işlemi ve bir resim yükleme işlemi asenkron olarak yapılabilir. Bu yüzden, bir resim yükleme işlemi başarılı olana kadar dosya yükleme işlemi devam edecek ve resim yükleneceği yerdeki yerleşik bir resim görünür.
  //await yazdığımız fonksiyonun çalıştırılması bekletilir
  //await kullanılıcaksa main şu şekilde yazılır Future <void> main() async
  //Bir fonksiyona Asenkron yazmak istiyorsak Future keyworldü ile yazılır
  //await ile beklenen işlemlerin tamamlanmasından sonra main fonksiyonu devam eder.
  
  print("Verilerin alınması bekleniyor");
  var veri = await veritabanindanVeriAl();
  print("Alınan veri: $veri");
}

Future<String> veritabanindanVeriAl() async {
  for(var i=1;i<6;i++){//1,2,3,4,5
  Future.delayed(Duration(seconds: i),() => print("Veri miktarı : ½${i*20}"));
  }
  return Future.delayed(Duration(seconds: 5),() => "Merhaba");
}
