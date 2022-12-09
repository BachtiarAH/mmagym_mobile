import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mmagym_mobile/clien/BaseClient.dart';
import 'package:mmagym_mobile/models/MenuLatihanModel.dart';
import 'package:mmagym_mobile/models/menulatihan_model.dart';

class MenuLatihanClien extends BaseClient {
  Future<MenuLatihanModel> getMenuLatihan() async {
    var response = await http.get(Uri.parse(baseUrl + "/api/menu/all"));
    MenuLatihanModel menu =
        await MenuLatihanModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return menu;
    } else {
      throw http.ClientException;
    }

    // MenuLatihanModel model = MenuLatihanModel(status: response., body: body)
  }
}
