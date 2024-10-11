import 'package:flutter/material.dart';

class SayfaY extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => route.isFirst);
        return false; // Geri tuşu işlemi iptal edilsin, manuel kontrol yapıldı.
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sayfa Y'),
        ),
        body: Center(
          child: Text(
              'Sayfa Y İçeriği'), // Butonu kaldırdık, sol üstteki geri tuşu çalışacak.
        ),
      ),
    );
  }
}
