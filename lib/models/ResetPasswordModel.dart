// To parse this JSON data, do
//
//     final resetPassword = resetPasswordFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
    ResetPasswordModel({
       required this.status,
       required this.message,
    });

    String status;
    String message;

    factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
