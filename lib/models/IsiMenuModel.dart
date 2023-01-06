// To parse this JSON data, do
//
//     final rincianMenuModel = rincianMenuModelFromJson(jsonString);

import 'dart:convert';

RincianMenuModel rincianMenuModelFromJson(String str) => RincianMenuModel.fromJson(json.decode(str));

String rincianMenuModelToJson(RincianMenuModel data) => json.encode(data.toJson());

class RincianMenuModel {
    RincianMenuModel({
        required this.status,
        required this.body,
    });

    String status;
    Body body;

    factory RincianMenuModel.fromJson(Map<String, dynamic> json) => RincianMenuModel(
        status: json["status"],
        body: Body.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": body.toJson(),
    };
}

class Body {
    Body({
        required this.header,
        required this.isi,
    });

    List<Header> header;
    List<Isi> isi;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        header: List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        isi: List<Isi>.from(json["isi"].map((x) => Isi.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "header": List<dynamic>.from(header.map((x) => x.toJson())),
        "isi": List<dynamic>.from(isi.map((x) => x.toJson())),
    };
}

class Header {
    Header({
        required this.id,
        required this.namaMenuLatihan,
        required this.headerPart,
        required this.level,
        required this.gambar,
    });

    int id;
    String namaMenuLatihan;
    String headerPart;
    String level;
    String gambar;

    factory Header.fromJson(Map<String, dynamic> json) => Header(
        id: json["id"],
        namaMenuLatihan: json["nama_menu_latihan"],
        headerPart: json["part"],
        level: json["level"],
        gambar: json["gambar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_menu_latihan": namaMenuLatihan,
        "part": headerPart,
        "level": level,
        "gambar": gambar,
    };
}

class Isi {
    Isi({
        required this.id,
        required this.idGerakan,
        required this.namaGerakan,
        required this.gambar,
        required this.repetisi,
        required this.setLatihan,
        required this.video,
        required this.note,
    });

    int id;
    int idGerakan;
    String namaGerakan;
    String gambar;
    int repetisi;
    int setLatihan;
    String video;
    String note;

    factory Isi.fromJson(Map<String, dynamic> json) => Isi(
        id: json["id"],
        idGerakan: json["id_gerakan"],
        namaGerakan: json["nama_gerakan"],
        gambar: json["gambar"],
        repetisi: json["repetisi"],
        setLatihan: json["set_latihan"],
        video: json["video"],
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_gerakan": idGerakan,
        "nama_gerakan": namaGerakan,
        "gambar": gambar,
        "repetisi": repetisi,
        "set_latihan": setLatihan,
        "video": video,
        "note": note,
    };
}
