import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mmagym_mobile/clien/BaseClient.dart';
import 'package:mmagym_mobile/models/OtpModel.dart';
import 'package:mmagym_mobile/models/registeModel.dart';

class RegisterClient extends BaseClient {
  Future<RegisterModel> postRegister({
    required String nama,
    required String email,
    required String password,
    required String alamat,
  }) 
  async {
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({
      "nama": nama,
      "email": email,
      "password": password,
      "alamat": alamat
    });

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/auth/register';
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
      return RegisterModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }

  Future<OtpModel> postOtp(
    {
      required email,
      required otp
    }
  )async{
    //mempersiapkan header dan body
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({
      "email": email,
      "otp":otp
    });

    //mengirim request
    String enpoin = baseUrl + 'api/auth/register/verif';
    var response = await http.post(
      Uri.parse(enpoin),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(await response.body);
      return OtpModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }
}
