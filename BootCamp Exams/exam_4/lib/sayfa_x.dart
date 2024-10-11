import 'package:flutter/material.dart';
import 'sayfa_y.dart';

class SayfaX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayfa X'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SayfaY()),
            );
          },
          child: const Text('GİT > Y'),
        ),
      ),
    );
  }
}
