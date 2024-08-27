import 'package:dart_derleri/nesne_tabanli_programlama/override_kullanimi/hayvan.dart';
import 'package:dart_derleri/nesne_tabanli_programlama/override_kullanimi/kedi.dart';
import 'package:dart_derleri/nesne_tabanli_programlama/override_kullanimi/kopek.dart';
import 'package:dart_derleri/nesne_tabanli_programlama/override_kullanimi/memeli.dart';

void main() {
  var hayvan = Hayvan();
  var memeli = Memeli();
  var kopek = Kopek();
  var kedi = Kedi();

  hayvan.sesCikar();//Kalıtım yok kendi metoduna eriştir.
  memeli.sesCikar();//Kalıtım var kendi üst sınıfın metoduna erişti
  kopek.sesCikar();//Kalıtım var kendi metoduna erişti.
  kedi.sesCikar();//Kalıtım var kendi metoduna erişti.
}
