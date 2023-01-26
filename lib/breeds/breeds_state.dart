part of 'breeds_cubit.dart';

@immutable
abstract class BreedsState {}

class BreedsInitial extends BreedsState {}

class BreedsLoading extends BreedsState {}

class BreedsLoaded extends BreedsState {
  final BreedsModel? breeds;

  BreedsLoaded({required this.breeds});
}

class BreedsError extends BreedsState {
  final String errorMessage;

  BreedsError({required this.errorMessage});
}
