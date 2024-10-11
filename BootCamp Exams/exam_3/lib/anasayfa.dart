import 'package:exam_3/renkler.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String selectedSize = 'M'; // Varsayılan olarak seçili boyut
  bool isAddedToCart = false; // Sepette olup olmadığını takip et

  // Malzeme seçim durumu
  List<bool> selectedIngredients = [
    false,
    false,
    false
  ]; // Mozzarella, Domates Sosu, Taze Fesleğen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pizza Hot",
          style: TextStyle(color: yaziRenk1, fontSize: 22),
        ),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "resimler/pizza_resim.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Margarita",
                style: TextStyle(
                  fontSize: 30,
                  color: anaRenk,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Yıldız ve puanı sağa hizala
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Sağa hizaladık
                children: [
                  Icon(
                    Icons.star,
                    color: const Color.fromARGB(255, 233, 210, 3),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // İçindekiler yazısı kaldırıldı
            // Malzemeleri seçme alanı
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Malzemeleri Seçin:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: anaRenk,
                ),
              ),
            ),
            // Checkbox aralıklarını kısalttık
            Column(
              children: [
                CheckboxListTile(
                  title: Text("Mozzarella Peyniri"),
                  value: selectedIngredients[0],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedIngredients[0] = value ?? false;
                    });
                  },
                  dense: true, // Satırları daha dar yapar
                  contentPadding: EdgeInsets.zero, // Boşluğu sıfırladık
                ),
                CheckboxListTile(
                  title: Text("Domates Sosu"),
                  value: selectedIngredients[1],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedIngredients[1] = value ?? false;
                    });
                  },
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                CheckboxListTile(
                  title: Text("Taze Fesleğen"),
                  value: selectedIngredients[2],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedIngredients[2] = value ?? false;
                    });
                  },
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      buildSizeButton('S'),
                      buildSizeButton('M'),
                      buildSizeButton('L'),
                    ],
                  ),
                  Text(
                    "\$6.30",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nutritional value per 100gr",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildNutritionalInfo("266", "kCal"),
                      buildNutritionalInfo("10", "Fats"),
                      buildNutritionalInfo("11", "Protein"),
                      buildNutritionalInfo("33", "Carbohydrates"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Düğmeyi en alta yerleştirir
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAddedToCart = !isAddedToCart; // Sepet durumu değiştirilir
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isAddedToCart
                          ? 'Added to Cart.'
                          : 'Removed from Cart'),
                    ),
                  );
                },
                child: Text(
                  isAddedToCart ? 'Remove from Basket' : 'Add to Cart',
                  style: TextStyle(color: Colors.white), // Yazıyı beyaz yaptık
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: anaRenk, // Doğru parametre ismi
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Boyut butonlarını oluşturma
  Widget buildSizeButton(String size) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedSize = size; // Seçili boyutu ayarla
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: anaRenk),
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
        backgroundColor: selectedSize == size ? anaRenk : Colors.transparent,
      ),
      child: Text(
        size,
        style: TextStyle(
          color: selectedSize == size ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  // Besin değerlerini oluşturma
  Widget buildNutritionalInfo(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
