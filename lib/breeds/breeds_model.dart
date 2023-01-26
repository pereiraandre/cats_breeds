class BreedsModel{
  final List<Breeds> dataList;
  
  BreedsModel(this.dataList);

  BreedsModel.fromJson(Map<String, dynamic> json)
  : dataList = List<dynamic>.from(json['data'])
      .map((i) => Breeds.fromJson(i))
      .toList();


}
class Breeds{
  final String? breed;
  final String? country;
  final String? coat;
  final String? pattern;


  Breeds(this.breed, this.country, this.coat, this.pattern);

  Breeds.fromJson(Map<String, dynamic> json)
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