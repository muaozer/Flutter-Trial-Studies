import 'package:final_exam/data/entity/yemek.dart';

abstract class YemekState {
  const YemekState();
}

class YemekInitial extends YemekState {
  const YemekInitial();
}

class YemekLoading extends YemekState {
  const YemekLoading();
}

class YemekLoaded extends YemekState {
  final List<Yemek> yemekler;
  final List<Yemek>? filtrelenmisYemekler;

  const YemekLoaded(this.yemekler, [this.filtrelenmisYemekler]);
}

class YemekError extends YemekState {
  final String message;

  const YemekError(this.message);
}
