// To parse this JSON data, do
//
//     final gerakanModel = gerakanModelFromJson(jsonString);

import 'dart:convert';

GerakanModel gerakanModelFromJson(String str) =>
    GerakanModel.fromJson(json.decode(str));

String gerakanModelToJson(GerakanModel data) => json.encode(data.toJson());

class GerakanModel {
  GerakanModel({
    required this.status,
    this.body,
  });

  String status;
  List<Body>? body;

  factory GerakanModel.fromJson(Map<String, dynamic> json) => GerakanModel(
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
    required this.gerakan,
    required this.video,
    required this.gambar,
    required this.idAlat,
    required this.alat,
  });

  int id;
  String gerakan;
  String video;
  String gambar;
  int idAlat;
  String alat;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        gerakan: json["gerakan"],
        video: json["video"],
        gambar: json["gambar"],
        idAlat: json["id_alat"],
        alat: json["alat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gerakan": gerakan,
        "video": video,
        "gambar": gambar,
        "id_alat": idAlat,
        "alat": alat,
      };
}
