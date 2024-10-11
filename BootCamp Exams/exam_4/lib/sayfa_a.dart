import 'package:flutter/material.dart';
import 'sayfa_b.dart';

class SayfaA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sayfa A'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SayfaB()),
            );
          },
          child: Text('GİT > B'),
        ),
      ),
    );
  }
}
