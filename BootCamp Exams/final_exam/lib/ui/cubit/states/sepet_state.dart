import '../../../data/entity/sepet.dart';

abstract class SepetState {
  const SepetState();
}

class SepetInitial extends SepetState {
  const SepetInitial();
}

class SepetLoading extends SepetState {
  const SepetLoading();
}

class SepetLoaded extends SepetState {
  final List<Sepet> sepetItems;
  const SepetLoaded(this.sepetItems);
}

class SepetError extends SepetState {
  final String message;
  const SepetError(this.message);
}
