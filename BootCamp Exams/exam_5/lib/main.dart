import 'package:flutter/material.dart';

void main() {
  runApp(ToplamaHesapMakinesi());
}

class ToplamaHesapMakinesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toplama Hesap Makinesi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HesapMakinesi(),
    );
  }
}

class HesapMakinesi extends StatefulWidget {
  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  String _ekranGoruntusu = '0';
  double _sonuc = 0;
  double _guncelGirdi = 0;

  void _sayiTusuBasilma(String sayi) {
    setState(() {
      if (_ekranGoruntusu == '0') {
        _ekranGoruntusu = sayi;
      } else {
        _ekranGoruntusu += sayi;
      }
      _guncelGirdi = double.parse(_ekranGoruntusu);
    });
  }

  void _toplaTusuBasilma() {
    setState(() {
      _sonuc += _guncelGirdi;
      _ekranGoruntusu = '0';
      _guncelGirdi = 0;
    });
  }

  void _temizleTusuBasilma() {
    setState(() {
      _ekranGoruntusu = '0';
      _sonuc = 0;
      _guncelGirdi = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toplama Hesap Makinesi'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(32.0),
              child: Text(
                'Sonuç: $_sonuc',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _sayiTusuOlustur('1'),
              _sayiTusuOlustur('2'),
              _sayiTusuOlustur('3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _sayiTusuOlustur('4'),
              _sayiTusuOlustur('5'),
              _sayiTusuOlustur('6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _sayiTusuOlustur('7'),
              _sayiTusuOlustur('8'),
              _sayiTusuOlustur('9'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _sayiTusuOlustur('0'),
              _islemTusuOlustur('+', _toplaTusuBasilma),
              _islemTusuOlustur('C', _temizleTusuBasilma),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sayiTusuOlustur(String sayi) {
    return ElevatedButton(
      onPressed: () => _sayiTusuBasilma(sayi),
      child: Text(
        sayi,
        style: TextStyle(fontSize: 24),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20.0),
      ),
    );
  }

  Widget _islemTusuOlustur(String etiket, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        etiket,
        style: TextStyle(fontSize: 24),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}
