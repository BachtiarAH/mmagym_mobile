// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

OtpModel registerModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String registerModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    OtpModel({
        required this.status,
        required this.message,
    });

    String status;
    String message;

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
