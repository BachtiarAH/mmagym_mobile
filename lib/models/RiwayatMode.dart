// To parse this JSON data, do
//
//     final riwayatModel = riwayatModelFromJson(jsonString);

import 'dart:convert';

RiwayatModel riwayatModelFromJson(String str) => RiwayatModel.fromJson(json.decode(str));

String riwayatModelToJson(RiwayatModel data) => json.encode(data.toJson());

class RiwayatModel {
    RiwayatModel({
        required this.status,
        this.body,
        required this.massage,
    });

    String status;
    List<Body>? body;
    String massage;

    factory RiwayatModel.fromJson(Map<String, dynamic> json) => RiwayatModel(
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        massage: json["massage"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body!.map((x) => x.toJson())),
        "massage": massage,
    };
}

class Body {
    Body({
        required this.tanggal,
        required this.gerakan,
    });

    DateTime tanggal;
    String gerakan;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        tanggal: DateTime.parse(json["tanggal"]),
        gerakan: json["gerakan"],
    );

    Map<String, dynamic> toJson() => {
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "gerakan": gerakan,
    };
}
