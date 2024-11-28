import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_exam/ui/cubit/sepet_cubit.dart';
import 'package:final_exam/data/entity/yemek.dart';

class YemekDetay extends StatefulWidget {
  final Yemek yemek;

  YemekDetay({required this.yemek});

  @override
  _YemekDetayState createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  int adet = 1;
  bool favori = false;
  bool yorumlarGoster = false;
  late int toplamFiyat;

  @override
  void initState() {
    super.initState();
    toplamFiyat = widget.yemek.yemekFiyat;
  }

  void _updateToplamFiyat() {
    setState(() {
      toplamFiyat = widget.yemek.yemekFiyat * adet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.yemek.yemekAdi,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              favori ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                favori = !favori;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Yemek Görseli
                Hero(
                  tag: 'yemek${widget.yemek.yemekId}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemekResimAdi}",
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            "Görsel yüklenemedi",
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Yemek Detayları
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.yemek.yemekAdi,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Bu yemek, en taze malzemelerle hazırlanmıştır. Şefin özel tarifiyle damak zevkinize hitap eder.",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 16),
                      // Adet artırma ve azaltma
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Adet:",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (adet > 1) {
                                    setState(() {
                                      adet--;
                                      _updateToplamFiyat();
                                    });
                                  }
                                },
                                icon: Icon(Icons.remove),
                                color: Colors.red,
                              ),
                              Text(
                                "$adet",
                                style: TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    adet++;
                                    _updateToplamFiyat();
                                  });
                                },
                                icon: Icon(Icons.add),
                                color: Colors.green,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Yorumlar
          if (yorumlarGoster)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    )
                  ],
                ),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                          "Servis: ${index + 3}, Lezzet: ${index + 2}, Teslimat: ${index + 3}"),
                      subtitle: Text("Yemek: ${widget.yemek.yemekAdi}"),
                    );
                  },
                ),
              ),
            )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Toplam",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  "${toplamFiyat} ₺",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        yorumlarGoster = !yorumlarGoster;
                      });
                    },
                    icon: Icon(Icons.comment_outlined, color: Colors.deepOrange),
                    label: Text(
                      "Yorumlar",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<SepetCubit>().addToSepet(
                            widget.yemek.yemekAdi,
                            widget.yemek.yemekResimAdi,
                            widget.yemek.yemekFiyat,
                            adet,
                            "ogrenci_adi",
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${widget.yemek.yemekAdi} sepete eklendi'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart, color: Colors.deepOrange),
                    label: Text(
                      "Sepete Ekle",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
