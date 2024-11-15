import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SepetSayfasi extends StatefulWidget {
  @override
  _SepetSayfasiState createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  List<dynamic> sepetYemekler = [];
  double toplamFiyat = 0.0;

  @override
  void initState() {
    super.initState();
    sepettekiYemekleriGetir();
  }

  Future<void> sepettekiYemekleriGetir() async {
    final url = Uri.parse(
        "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    final response = await http.post(url, body: {
      "kullanici_adi": "ogrenci_adi",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        sepetYemekler = data["sepet_yemekler"] ?? [];
        toplamFiyat = sepetYemekler.fold(0.0, (sum, item) {
          double yemekFiyat = double.parse(item['yemek_fiyat']);
          int adet = int.parse(item['yemek_siparis_adet']);
          return sum + (yemekFiyat * adet);
        });
      });
    } else {
      throw Exception("Sepetteki yemekler alınamadı");
    }
  }

  Future<void> sepettenYemekSil(String sepetYemekId) async {
    final url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    final response = await http.post(url, body: {
      "sepet_yemek_id": sepetYemekId,
      "kullanici_adi": "ogrenci_adi", // Kullanıcı adı parametresi eklendi
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Yemek sepetten silindi")));
      sepettekiYemekleriGetir();
    } else {
      throw Exception("Yemek silinemedi");
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
          "Sepetim",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: sepetYemekler.isEmpty
                ? Center(
                    child:
                        Text("Sepetiniz boş", style: TextStyle(fontSize: 18)))
                : ListView.builder(
                    itemCount: sepetYemekler.length,
                    itemBuilder: (context, index) {
                      final yemek = sepetYemekler[index];
                      double yemekToplamFiyat =
                          double.parse(yemek['yemek_fiyat']) *
                              int.parse(yemek['yemek_siparis_adet']);
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          leading: Image.network(
                            "http://kasimadalan.pe.hu/yemekler/resimler/${yemek['yemek_resim_adi']}",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(yemek['yemek_adi'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${yemek['yemek_fiyat']} TL x ${yemek['yemek_siparis_adet']} = ${yemekToplamFiyat.toStringAsFixed(2)} TL"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                sepettenYemekSil(yemek['sepet_yemek_id']),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Toplam Fiyat:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${toplamFiyat.toStringAsFixed(2)} TL",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Center(
                    child: Text(
                      "Sepeti Onayla",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
