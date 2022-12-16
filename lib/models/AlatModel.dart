// To parse this JSON data, do
//
//     final alatModel = alatModelFromJson(jsonString);

import 'dart:convert';

AlatModel alatModelFromJson(String str) => AlatModel.fromJson(json.decode(str));

String alatModelToJson(AlatModel data) => json.encode(data.toJson());

class AlatModel {
  AlatModel({
    this.body,
    required this.status,
  });

  List<Body>? body;
  String status;

  factory AlatModel.fromJson(Map<String, dynamic> json) => AlatModel(
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(body!.map((x) => x.toJson())),
        "status": status,
      };
}

class Body {
  Body({
    required this.id,
    required this.nama,
    required this.gambar,
  });

  int id;
  String nama;
  String gambar;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        nama: json["nama"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "gambar": gambar,
      };
}
