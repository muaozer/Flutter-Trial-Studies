import 'package:dart_derleri/nesne_tabanli_programlama/interface_kullanimi/my_interface.dart';

class ClassA implements MyInterface {
  @override
  int degisken = 10;

  @override
  void metod1() {
    print("Metod 1 Çalıştı");
  }

  @override
  String metod2() {
    return "Metod 2 Çalıştı";
  }
}
