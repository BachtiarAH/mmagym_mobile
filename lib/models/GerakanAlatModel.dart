// To parse this JSON data, do
//
//     final gerakanAlatModel = gerakanAlatModelFromJson(jsonString);

import 'dart:convert';

GerakanAlatModel gerakanAlatModelFromJson(String str) => GerakanAlatModel.fromJson(json.decode(str));

String gerakanAlatModelToJson(GerakanAlatModel data) => json.encode(data.toJson());

class GerakanAlatModel {
    GerakanAlatModel({
        required this.status,
        this.body,
        this.massage
    });

    String status;
    List<Body>? body;
    String? massage;

    factory GerakanAlatModel.fromJson(Map<String, dynamic> json) => GerakanAlatModel(
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        massage: json["massage"],
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
        required this.video,
        required this.gambar,
        required this.idAlat,
    });

    int id;
    String nama;
    String video;
    String gambar;
    int idAlat;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        nama: json["nama"],
        video: json["video"],
        gambar: json["gambar"],
        idAlat: json["id_alat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "video": video,
        "gambar": gambar,
        "id_alat": idAlat,
    };
}
