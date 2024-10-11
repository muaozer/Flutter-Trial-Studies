import 'package:flutter/material.dart';
import 'sayfa_a.dart';
import 'sayfa_x.dart';

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SayfaA()),
                );
              },
              child: const Text('GİT > A'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SayfaX()),
                );
              },
              child: const Text('GİT > X'),
            ),
          ],
        ),
      ),
    );
  }
}
