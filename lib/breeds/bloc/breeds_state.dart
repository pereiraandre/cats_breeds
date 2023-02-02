part of 'breeds_cubit.dart';

@immutable
abstract class BreedsState {}

class BreedsInitial extends BreedsState {}

class BreedsLoading extends BreedsState {
  final List<Breed> oldBreeds;
  final bool firstPage;

  BreedsLoading(this.oldBreeds, {this.firstPage=false});
}

class BreedsLoaded extends BreedsState {
  final List<Breed> breeds;

  BreedsLoaded({required this.breeds});
}

class BreedsError extends BreedsState {
  final String errorMessage;

  BreedsError({required this.errorMessage});
}
