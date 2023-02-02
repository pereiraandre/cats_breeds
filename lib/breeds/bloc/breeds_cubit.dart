import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/breeds_service.dart';
import '../models/breeds_model.dart';

part 'breeds_state.dart';

class BreedsCubit extends Cubit<BreedsState> {
  BreedsCubit() : super(BreedsInitial());

  int page = 1;

  void getBreeds() async {
    if (state is BreedsLoading) return;

    List<Breed> oldBreeds = [];

    emit(BreedsLoading(oldBreeds, firstPage: page == 1));

    try {
      BreedModel breeds = await BreedsService().getBreeds(page);
      oldBreeds.addAll(breeds.dataList);
      page++;



      emit(BreedsLoaded(breeds: oldBreeds));
    } catch (e) {
      emit(BreedsError(errorMessage: e.toString()));
    }
  }
}
