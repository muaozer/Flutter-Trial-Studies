import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class YemekDetay extends StatefulWidget {
  final Map<String, dynamic> yemek;
  YemekDetay({required this.yemek});

  @override
  _YemekDetayState createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  int adet = 1;
  bool favori = false;

  Future<void> sepeteEkle() async {
    final url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    final response = await http.post(url, body: {
      "yemek_adi": widget.yemek["yemek_adi"],
      "yemek_resim_adi": widget.yemek["yemek_resim_adi"],
      "yemek_fiyat": widget.yemek["yemek_fiyat"].toString(),
      "yemek_siparis_adet": adet.toString(),
      "kullanici_adi": "ogrenci_adi"
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Yemek sepete eklendi")));
    } else {
      throw Exception("Sepete eklenemedi");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.yemek["yemek_adi"],
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              favori ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                favori = !favori;
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(favori
                      ? "Favorilere Eklendi"
                      : "Favorilerden Çıkarıldı")));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Yıldızlar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: index < 4
                          ? Colors.yellow
                          : Colors.white.withOpacity(0.5),
                      size: 30,
                    ),
                  );
                }),
              ),
              SizedBox(height: 10),

              // Yemek Resmi
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek['yemek_resim_adi']}",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              // Yemek Adı ve Fiyatı
              Text(widget.yemek["yemek_adi"],
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              SizedBox(height: 8),

              // Fiyat ve Teslimat Süresi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.yemek['yemek_fiyat']} ₺",
                      style: TextStyle(fontSize: 22, color: Colors.black)),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Icon(Icons.directions_bike, color: Colors.green),
                      ),
                      SizedBox(width: 4),
                      Text("30-45 dk",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Adet arttırma ve azaltma butonları
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.remove, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          if (adet > 1) adet--;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(adet.toString(),
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          adet++;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Sepete Ekle butonu
              ElevatedButton(
                onPressed: sepeteEkle,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                child: Text("Sepete Ekle",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
