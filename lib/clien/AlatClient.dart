import 'dart:convert';

import 'package:http/http.dart' as http;
import 'BaseClient.dart';
import 'package:mmagym_mobile/models/AlatModel.dart';

class AlatClient {
  Future<AlatModel> getAlat() async {
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = '';

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/alat/findAll';
    var response = await http.get(Uri.parse(enpoin));
    // IsiMenu menu = await IsiMenu.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      print(await response.body);
      return AlatModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }

  Future<AlatModel> getAlatAll() async {
    var response = await http.get(Uri.parse(baseUrl + "/api/menu/all"));
    AlatModel model = await AlatModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return model;
    } else {
      throw http.ClientException;
    }

    // MenuLatihanModel model = MenuLatihanModel(status: response., body: body)
  }
}
