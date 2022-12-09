// ignore_for_file: avoid_print

import "package:http/http.dart" as http;

var baseUrl = "http://10.10.174.49/mmagym/src/public/";

class BaseClient{
  var client = http.Client();

  dynamic get(String api)async{
    var url = baseUrl + api;
    var uri = Uri.parse(url);

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return response;
    } else {
      print("sumting wrong${response.statusCode}");
    }
  }
  Future<dynamic> post()async{}
  Future<dynamic> put()async{}
  Future<dynamic> delete()async{}
}