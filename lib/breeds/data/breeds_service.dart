import '../../networking/networkhelper.dart';
import '../models/breeds_model.dart';


class BreedsService {

  Future<dynamic> getBreeds(int page) async {
    NetworkHelper networkHelper = NetworkHelper('https://catfact.ninja/breeds?page=$page');
    var catBreeds = await networkHelper.getData();
    if(catBreeds == null){
      return null;
    }
    BreedModel factsModel = BreedModel.fromJson(catBreeds);
    return factsModel;

  }
}