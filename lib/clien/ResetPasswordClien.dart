import 'dart:convert';

import 'package:mmagym_mobile/clien/BaseClient.dart';
import 'package:mmagym_mobile/models/ResetPasswordModel.dart';
import 'package:http/http.dart' as http;

class ResetPasswordClien {
  Future<ResetPasswordModel> resetPassword({required email})async{
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({
    "email":"${email}",
});

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/auth/resetpassword/sendOtp';
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
      return ResetPasswordModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }


  Future<ResetPasswordModel> cekOtp({required email, required otp})async{
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({
    "email":"${email}",
    "otp":"${otp}"
});

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/auth/cekotp';
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
      return ResetPasswordModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }


  Future<ResetPasswordModel> submitPassword({required email, required otp, required newPassword })async{
    print(baseUrl);
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = json.encode({
    "email":"${email}",
    "otp":"${otp}",
    "newpassword":"${newPassword}"
});

    // http.StreamedResponse response = await request.send();
    String enpoin = baseUrl + 'api/auth/resetpassword/setpassword';
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
      return ResetPasswordModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
      throw http.ClientException;
    }
  }
}