// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.status,
    this.body,
  });

  String status;
  List<Body>? body;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body!.map((x) => x.toJson())),
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
