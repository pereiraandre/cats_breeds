class DataModel{
  final List<Data> dataList;
  
  DataModel(this.dataList);

  DataModel.fromJson(Map<String, dynamic> json)
  : dataList = List<dynamic>.from(json['data'])
      .map((i) => Data.fromJson(i))
      .toList();


}
class Data{
  final String? breed;
  final String? country;
  final String? coat;
  final String? pattern;


  Data(this.breed, this.country, this.coat, this.pattern);

  Data.fromJson(Map<String, dynamic> json)
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