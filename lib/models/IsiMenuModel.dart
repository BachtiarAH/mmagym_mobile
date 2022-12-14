// To parse this JSON data, do
//
//     final isiMenu = isiMenuFromJson(jsonString);

import 'dart:convert';

IsiMenu isiMenuFromJson(String str) => IsiMenu.fromJson(json.decode(str));

String isiMenuToJson(IsiMenu data) => json.encode(data.toJson());

class IsiMenu {
    IsiMenu({
        this.status,
        required this.body,
    });

    String? status;
    Body body;

    factory IsiMenu.fromJson(Map<String, dynamic> json) => IsiMenu(
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
        required this.namaMenuLatihan,
        required this.headerPart,
        required this.level,
    });

    String namaMenuLatihan;
    String headerPart;
    String level;

    factory Header.fromJson(Map<String, dynamic> json) => Header(
        namaMenuLatihan: json["nama_menu_latihan"],
        headerPart: json["part"],
        level: json["level"],
    );

    Map<String, dynamic> toJson() => {
        "nama_menu_latihan": namaMenuLatihan,
        "part": headerPart,
        "level": level,
    };
}

class Isi {
    Isi({
        required  this.namaGerakan,
        required this.gambar,
        required this.repetisi,
        required this.setLatihan,
        required this.video,
        required this.note,
    });

    String namaGerakan;
    String gambar;
    int repetisi;
    int setLatihan;
    String video;
    String note;

    factory Isi.fromJson(Map<String, dynamic> json) => Isi(
        namaGerakan: json["nama_gerakan"],
        gambar: json["gambar"],
        repetisi: json["repetisi"],
        setLatihan: json["set_latihan"],
        video: json["video"],
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "nama_gerakan": namaGerakan,
        "gambar": gambar,
        "repetisi": repetisi,
        "set_latihan": setLatihan,
        "video": video,
        "note": note,
    };
}
