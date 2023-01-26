import '../breeds/breeds_model.dart';
import 'networkhelper.dart';

class BreedsService {

  Future<dynamic> getBreeds() async {
    NetworkHelper networkHelper = NetworkHelper('https://catfact.ninja/breeds');
    var catBreeds = await networkHelper.getData();
    if(catBreeds == null){
      return null;
    }
    BreedsModel factsModel = BreedsModel.fromJson(catBreeds);
    return factsModel;

  }
}