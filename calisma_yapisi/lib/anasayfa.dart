import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:calisma_yapisi/kisiler.dart';
import 'package:flutter/widgets.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;
  bool kontrol = false;

//Sadece sayfa yüklendiğinde bir kere çalışır
  @override
  void initState() {
    super.initState();
    print("initState çalıştı");
  }

  Future<int> toplam(int sayi1, int sayi2) async {
    int toplama = sayi1 + sayi2;
    return toplama;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç : $sayac"),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    sayac = sayac + 1;
                  });
                },
                child: const Text("Tıkla")),
            ElevatedButton(
                onPressed: () {
                  var kisi =
                      Kisiler(ad: "Ahmet", yas: 24, boy: 1.56, bekar: true);
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OyunEkrani(kisi: kisi)))
                      .then((value) {
                    print("Anasayfaya dönüldü");
                  });
                },
                child: const Text("Başla")),
            Visibility(visible: kontrol, child: const Text("Merhaba")),
            Text(
              kontrol ? "Merhaba" : "Güle Güle",
              style: TextStyle(color: kontrol ? Colors.blue : Colors.red),
            ),
            (() {
              if (kontrol) {
                return const Text(
                  "Merhaba",
                  style: TextStyle(color: Colors.blue),
                );
              } else {
                return const Text(
                  "Güle Güle",
                  style: TextStyle(color: Colors.red),
                );
              }
            }()),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    kontrol = true;
                  });
                },
                child: const Text("Durum 1 True")),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                  kontrol = false;
                },
                child: const Text("Durum 1 False")),
            FutureBuilder<int>(
                future: toplam(10, 20),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Hata Oluştu");
                  }
                  if (snapshot.hasData) {
                    return Text("Sonuç : ${snapshot.data}");
                  } else {
                    return const Text("Sonuç Yok");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
