import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetayCubit extends Cubit<int> {
  YemekDetayCubit() : super(1);

  void adetArtir() => emit(state + 1);

  void adetAzalt() {
    if (state > 1) emit(state - 1);
  }
}
