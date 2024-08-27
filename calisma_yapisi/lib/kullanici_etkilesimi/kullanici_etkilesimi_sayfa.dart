import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget {
  const KullaniciEtkilesimiSayfa({super.key});

  @override
  State<KullaniciEtkilesimiSayfa> createState() =>
      _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {
  var tfControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kullanıcı Etkileişimi"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Silmek istiyor musunuz ?"),
                      action: SnackBarAction(
                        label: "Evet",
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Silindi"),
                          ));
                        },
                      ),
                    ));
                  },
                  child: const Text("Snackbar")),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text(
                      "Silmek istiyor musunuz ?",
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                    backgroundColor: Colors.white,
                    action: SnackBarAction(
                      label: "Evet",
                      textColor: Colors.red,
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Silindi",
                              style: TextStyle(color: Colors.red)),
                          backgroundColor: Colors.white,
                        ));
                      },
                    ),
                  ));
                },
                child: const Text("Snackbar (Özel)"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Başlık"),
                          content: TextField(
                            controller: tfControl,
                            decoration: const InputDecoration(hintText: "Veri"),
                          ),
                          backgroundColor: Colors.grey,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  print("İptal seçildi");
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "İptal",
                                  style: TextStyle(color: Colors.black),
                                )),
                            TextButton(
                                onPressed: () {
                                  print("Alınan veri : ${tfControl.text}");
                                  Navigator.pop(context);
                                  tfControl.text = "";
                                },
                                child: const Text("Tamam",
                                    style: TextStyle(color: Colors.black))),
                          ],
                        );
                      });
                },
                child: const Text("Alert"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Kayıt İşlemi"),
                          content: const Text("İçerik"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("İptal")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Tamam")),
                          ],
                        );
                      });
                },
                child: const Text("Alert(Özel)"),
              )
            ],
          ),
        ));
  }
}
