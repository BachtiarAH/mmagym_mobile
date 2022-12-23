// To parse this JSON data, do
//
//     final loginFailModel = loginFailModelFromJson(jsonString);

import 'dart:convert';

LoginFailModel loginFailModelFromJson(String str) => LoginFailModel.fromJson(json.decode(str));

String loginFailModelToJson(LoginFailModel data) => json.encode(data.toJson());

class LoginFailModel {
    LoginFailModel({
        required this.status,
        required this.message,
    });

    String status;
    String message;

    factory LoginFailModel.fromJson(Map<String, dynamic> json) => LoginFailModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
