import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:mmagym_mobile/clien/BaseClient.dart';
import 'package:mmagym_mobile/models/RiwayatMode.dart';

class RiwayatCLient extends BaseClient {
  
Future<RiwayatModel> getRiwayat({required id}) 
  async {
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({
    "id_user":id
});

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/riwayat/user';
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
      return RiwayatModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }

  }
  
  }