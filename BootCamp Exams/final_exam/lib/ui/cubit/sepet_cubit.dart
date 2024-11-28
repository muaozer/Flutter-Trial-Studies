import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/sepet_repo.dart';
import 'states/sepet_state.dart';

class SepetCubit extends Cubit<SepetState> {
  final SepetRepo _sepetRepo;

  SepetCubit(this._sepetRepo) : super(const SepetInitial());

  Future<void> loadSepet() async {
    try {
      emit(const SepetLoading());
      final sepetItems = await _sepetRepo.getSepetItems();
      emit(SepetLoaded(sepetItems));
    } catch (e) {
      emit(SepetError(e.toString()));
    }
  }

  Future<void> addToSepet(String yemekAdi, String yemekResimAdi, int yemekFiyat, int yemekSiparisAdet, String kullaniciAdi) async {
    try {
      emit(const SepetLoading());
      await _sepetRepo.addToSepet(yemekAdi, yemekResimAdi, yemekFiyat, yemekSiparisAdet, kullaniciAdi);
      await loadSepet(); // Sepeti yeniden yükle
    } catch (e) {
      emit(SepetError(e.toString()));
    }
  }

  Future<void> removeFromSepet(String sepetYemekId, String kullaniciAdi) async {
    try {
      emit(const SepetLoading());
      await _sepetRepo.removeFromSepet(sepetYemekId, kullaniciAdi);
      await loadSepet(); // Sepeti yeniden yükle
    } catch (e) {
      emit(SepetError(e.toString()));
    }
  }
}
