import 'dart:convert';

import 'package:mmagym_mobile/clien/BaseClient.dart';
import 'package:mmagym_mobile/models/MenuLatihanModel.dart';
import 'package:mmagym_mobile/models/menulatihan_model.dart';
import 'package:http/http.dart' as http;

class menulatihan_client {
  Future<MenulatihanModelMenu> getIsiMenu({idMenu = 1}) async {
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({"id_menu": idMenu});

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/menu/rincian';
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
      return MenulatihanModelMenu.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }
}
