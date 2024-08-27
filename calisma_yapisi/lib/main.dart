import 'package:calisma_yapisi/anasayfa.dart';
import 'package:calisma_yapisi/buttom_nav_kullanimi/buttom_navigation_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:calisma_yapisi/kullanici_etkilesimi/kullanici_etkilesimi_sayfa.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigationSayfa(),
    );
  }
}

