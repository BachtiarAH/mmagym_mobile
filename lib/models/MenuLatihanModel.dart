// To parse this JSON data, do
//
//     final menuLatihanModel = menuLatihanModelFromJson(jsonString);

import 'dart:convert';

MenuLatihanModel menuLatihanModelFromJson(String str) =>
    MenuLatihanModel.fromJson(json.decode(str));

String menuLatihanModelToJson(MenuLatihanModel data) =>
    json.encode(data.toJson());

class MenuLatihanModel {
  MenuLatihanModel({
    required this.status,
    required this.body,
  });

  String status;
  List<Body> body;

  factory MenuLatihanModel.fromJson(Map<String, dynamic> json) =>
      MenuLatihanModel(
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    required this.id,
    required this.nama,
    required this.bodyPart,
    required this.level,
    required this.gambar,
  });

  int id;
  String nama;
  String bodyPart;
  String level;
  String gambar;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        nama: json["nama"],
        bodyPart: json["part"],
        level: json["level"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "part": bodyPart,
        "level": level,
        "gambar": gambar,
      };
}
