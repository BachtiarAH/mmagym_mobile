import 'dart:convert';

import 'package:http/http.dart' as http;
import 'BaseClient.dart';
import 'package:mmagym_mobile/models/GerakanModel.dart';

class GerakanClient {
  Future<GerakanModel> getGerakan({idMenu = 1}) async {
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({"id_menu": idMenu});

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/alat/findAll';
    var response = await http.post(
      Uri.parse(enpoin),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // IsiMenu menu = await IsiMenu.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      print(await response.body);
      return GerakanModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }
}
