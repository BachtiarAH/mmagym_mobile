import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mmagym_mobile/clien/BaseClient.dart';
import 'package:mmagym_mobile/models/StatusMessage.dart';

class LoginClient extends BaseClient {
  Future<StatusMessage> login({
    required String email,
    required String password,
  }) async {
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({
      "email": email,
      "password": password
    });

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/auth/login';
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
