import 'package:exam_7/data/repo/kisilerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit() : super(0);

  var krepo = KisilerDaoRepository();

  Future<void> guncelle(int id, String name) async {
    await krepo.guncelle(id, name);
  }
}
