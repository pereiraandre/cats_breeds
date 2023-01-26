import 'package:bloc/bloc.dart';
import 'package:cats_breeds/networking/breeds_service.dart';
import 'package:meta/meta.dart';

import 'breeds_model.dart';

part 'breeds_state.dart';

class BreedsCubit extends Cubit<BreedsState> {
  BreedsCubit() : super(BreedsInitial());

  void getBreeds() async {
    emit(BreedsLoading());
    try {
      final BreedModel breeds = await BreedsService().getBreeds();
      emit(BreedsLoaded(breeds: breeds));
    } catch (e) {
      emit(BreedsError(errorMessage: e.toString()));
    }
  }
}
