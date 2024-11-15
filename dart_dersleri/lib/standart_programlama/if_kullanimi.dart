void main() {
  int yas = 17;
  String isim = "Mehmet";

  if (yas >= 18){
    print("Reşitsiniz");
  }
  else{
    print("Reşit değilsiniz");
  }


  //Metinsel ifadelerde == veya != değildir kullanılır.
  if (isim == "Mehmet"){
    print("Merhaba Mehmet");
  }
  else if (isim == "Ahmet"){
    print("Merhaba Ahmet");
  }
  else{
    print("Tanınmayan Kişi");
  }

  String ka = "admin";
  int s = 123456;

  if(ka == "admin" && s == 123456){
    print("Kullanıcı girişi başarılı");
  }
  else{
    print ("Kullanıcı girişi hatalı");
  }

  int sayi = 10;

  if (sayi == 9 || sayi == 10){
    print("Sayı 9 veya 10 dur.");
  }
  else{
    print("Sayı 9 veya 10 değil.");
  }
}