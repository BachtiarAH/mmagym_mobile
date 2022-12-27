// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str=""));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  static const Body defaultBody = Body();

    LoginModel({
      required this.status,
      this.body = const [defaultBody],
      required this.message,
    });

    String status;
    List<Body> body ;
    String message;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "message": message,
    };
}

class Body {
    const Body({
      this.id = 0,
      this.nama = "",
      this.password = "",
      this.email = "",
      this.alamat = "",
      this.akses = 0,
    });

    final int id;
    final String nama;
    final String password;
    final String email;
    final String alamat;
    final int akses;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        nama: json["nama"],
        password: json["password"],
        email: json["email"],
        alamat: json["alamat"],
        akses: json["akses"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "password": password,
        "email": email,
        "alamat": alamat,
        "akses": akses,
    };
}
