import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future? getData() async {
    try{
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final breedData = jsonDecode(response.body) as Map<String, dynamic>;
        return breedData;
      }  }
    catch (e){
      rethrow;
    }
  }
}
