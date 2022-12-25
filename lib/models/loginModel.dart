// To parse this JSON data, do
//
//     final statusMessage = statusMessageFromJson(jsonString);

import 'dart:convert';

StatusMessage statusMessageFromJson(String str) => StatusMessage.fromJson(json.decode(str));

String statusMessageToJson(StatusMessage data) => json.encode(data.toJson());

class StatusMessage {
    StatusMessage({
        required this.status,
        this.body,
        this.message
    });

    String status;
    List<Body>? body;
    String? message;

    factory StatusMessage.fromJson(Map<String, dynamic> json) => StatusMessage(
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        message: json['message']
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": List<dynamic>.from(body!.map((x) => x.toJson())),
        "messsage": message
    };
}

class Body {
    Body({
        required this.id,
        required this.nama,
        required this.password,
        required this.email,
        required this.alamat,
        required this.akses,
    });

    int id;
    String nama;
    String password;
    String email;
    String alamat;
    int akses;

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
