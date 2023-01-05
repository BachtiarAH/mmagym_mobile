import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mmagym_mobile/clien/BaseClient.dart';
import 'package:mmagym_mobile/models/JadwalModel.dart';

class JadwalClient extends BaseClient{
  Future<JadwalModel> getJadwal({required id}) 
  async {
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + "/api/jadwal/user?id=$id";
    var response = await http.get(Uri.parse(enpoin),headers: headers);
    // IsiMenu menu = await IsiMenu.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      print(await response.body);
      return JadwalModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }

  }
}