import 'package:calisma_yapisi/buttom_nav_kullanimi/sayfa_bir.dart';
import 'package:calisma_yapisi/buttom_nav_kullanimi/sayfa_iki.dart';
import 'package:calisma_yapisi/buttom_nav_kullanimi/sayfa_uc.dart';
import 'package:flutter/material.dart';

class BottomNavigationSayfa extends StatefulWidget {
  const BottomNavigationSayfa({super.key});

  @override
  State<BottomNavigationSayfa> createState() => _BottomNavigationSayfaState();
}

class _BottomNavigationSayfaState extends State<BottomNavigationSayfa> {
  int secilenIndeks = 0;
  var sayfalar = [const SayfaBir(), const SayfaIki(), const SayfaUc()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation",), backgroundColor: Colors.deepPurple,
      ),
      body: sayfalar[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.looks_one_outlined), label: "Bir"),
            BottomNavigationBarItem(
                icon: Icon(Icons.looks_two_outlined), label: "İki"),
            BottomNavigationBarItem(
                icon: Icon(Icons.looks_3_outlined), label: "Üç"),
          ],
          currentIndex: secilenIndeks,
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors. white38,
          onTap: (indeks) {
            setState(() {
              secilenIndeks = indeks;
            });
          }),
    );
  }
}
