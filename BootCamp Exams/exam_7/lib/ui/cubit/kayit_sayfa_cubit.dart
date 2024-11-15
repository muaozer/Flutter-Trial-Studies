import 'package:exam_7/data/repo/kisilerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit() : super(0);

  var krepo = KisilerDaoRepository();

  Future<void> kaydet(String name) async {
    await krepo.kaydet(name);
  }
}
