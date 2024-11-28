import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_exam/data/repo/yemek_repo.dart';
import 'package:final_exam/ui/cubit/states/yemek_state.dart';

class YemekCubit extends Cubit<YemekState> {
  final YemekRepo _yemekRepo;

  YemekCubit(this._yemekRepo) : super(const YemekInitial());

  Future<void> loadYemekler() async {
    try {
      emit(const YemekLoading());
      final yemekler = await _yemekRepo.fetchYemekler();
      emit(YemekLoaded(yemekler));
    } catch (e) {
      emit(YemekError(e.toString()));
    }
  }

  void searchYemekler(String query) {
    if (state is YemekLoaded) {
      final currentState = state as YemekLoaded;
      final filteredYemekler = currentState.yemekler
          .where((yemek) =>
              yemek.yemekAdi.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(YemekLoaded(currentState.yemekler, filteredYemekler));
    }
  }

  void clearSearch() {
    if (state is YemekLoaded) {
      final currentState = state as YemekLoaded;
      emit(YemekLoaded(currentState.yemekler));
    }
  }
}