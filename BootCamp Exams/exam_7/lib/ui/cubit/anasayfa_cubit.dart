import 'package:exam_7/data/entity/kisiler.dart';
import 'package:exam_7/data/repo/kisilerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit() : super(<Kisiler>[]);

  final kisilerDaoRepository = KisilerDaoRepository();

  Future<void> kisileriYukle() async {
    var liste = await kisilerDaoRepository.kisileriYukle();
    emit(liste); // Durumu güncelle
  }

  Future<void> sil(int id) async {
    await kisilerDaoRepository.sil(id); // Veritabanından sil
    await kisileriYukle(); // Güncel listeyi yükle
  }

  Future<void> ara(String aramaKelimesi) async {
    var aramaSonucu = await kisilerDaoRepository.ara(aramaKelimesi);
    emit(aramaSonucu); // Arama sonuçlarını emit et
  }
}
