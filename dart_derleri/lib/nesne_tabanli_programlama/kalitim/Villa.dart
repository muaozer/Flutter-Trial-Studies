import 'package:dart_derleri/nesne_tabanli_programlama/kalitim/Ev.dart';

class Villa extends Ev {
  bool garajVarmi;

  Villa({required this.garajVarmi,required int pencereSayisi}) : super(pencereSayisi: pencereSayisi);
}
