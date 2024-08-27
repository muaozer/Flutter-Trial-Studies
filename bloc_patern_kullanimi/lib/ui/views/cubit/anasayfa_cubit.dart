import 'package:block_patern_kullanimi/data/repo/matematik_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int> {
  AnasayfaCubit() : super(0);

  var mrepo = MatematikRepository();

  void toplamaYap(String alinanSayi1, String alinanSayi2) {
    emit(mrepo.toplamaYap(alinanSayi1, alinanSayi2)); //emit tetikleme ve veri gönderme işlemi yapar
  }

  void carmaYap(String alinanSayi1, String alinanSayi2) {
    emit(mrepo.carmaYap(alinanSayi1, alinanSayi2)); //emit tetikleme ve veri gönderme işlemi yapar
  }
}
