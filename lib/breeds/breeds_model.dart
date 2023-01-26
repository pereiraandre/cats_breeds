class BreedModel{
  final List<Breed> dataList;
  
  BreedModel(this.dataList);

  BreedModel.fromJson(Map<String, dynamic> json)
  : dataList = List<dynamic>.from(json['data'])
      .map((i) => Breed.fromJson(i))
      .toList();


}
class Breed{
  final String? breed;
  final String? country;
  final String? coat;
  final String? pattern;


  Breed(this.breed, this.country, this.coat, this.pattern);

  Breed.fromJson(Map<String, dynamic> json)
      : breed = json['breed'],
        country = json['country'],
        coat = json['coat'],
        pattern = json['pattern'];

  Map<String, dynamic> toJson() => {
      'breed': breed,
      'country': country,
      'coat': coat,
      'pattern': pattern

  };
}