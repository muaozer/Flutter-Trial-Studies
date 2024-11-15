import 'package:final_exam/sepet.dart';
import 'package:final_exam/yemek_detay.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class YemekListe extends StatefulWidget {
  @override
  _YemekListeState createState() => _YemekListeState();
}

class _YemekListeState extends State<YemekListe> {
  List<dynamic> yemekler = [];
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    tumYemekleriGetir();
  }

  Future<void> tumYemekleriGetir() async {
    final url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        yemekler = data["yemekler"];
      });
    } else {
      throw Exception("Yemekler alınamadı");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          "Yemek Sipariş Uygulaması",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SepetSayfasi()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: aramaYapiliyorMu
                  ? TextField(
                      decoration: InputDecoration(
                        hintText: 'Ara...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (aramaSonucu) {
                        // Filter yemekler based on search
                      },
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          aramaYapiliyorMu = true;
                        });
                      },
                      icon: Icon(Icons.search),
                    ),
            ),
            yemekler.isEmpty
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: yemekler.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final yemek = yemekler[index];
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YemekDetay(yemek: yemek),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Image.network(
                                "http://kasimadalan.pe.hu/yemekler/resimler/${yemek['yemek_resim_adi']}",
                                width: 150,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                              Text(yemek['yemek_adi'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("${yemek['yemek_fiyat']} TL",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
