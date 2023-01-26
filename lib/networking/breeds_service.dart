import '../breeds/breeds_model.dart';
import 'networkhelper.dart';

class BreedsService {

  Future<dynamic> getBreeds() async {
    NetworkHelper networkHelper = NetworkHelper('https://catfact.ninja/breeds');
    var catBreeds = await networkHelper.getData();
    if(catBreeds == null){
      return null;
    }
    DataModel factsModel = DataModel.fromJson(catBreeds);
    return factsModel;

  }
}