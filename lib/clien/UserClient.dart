import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mmagym_mobile/clien/BaseClient.dart';
import 'package:mmagym_mobile/models/StatusMessage.dart';

class UserClient {
  Future<StatusMessage> EditDataUser({required int id,required String nama,required String email, required String password, required String alamat, int akses = 1}) async {
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({
      "id": id,
    "nama":nama,
    "password":password,
    "email":email,
    "alamat":alamat,
    "akses":akses
    });

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/user/edit';
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
      return StatusMessage.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }
}
