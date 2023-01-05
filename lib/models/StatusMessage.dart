// To parse this JSON data, do
//
//     final statusMessage = statusMessageFromJson(jsonString);

import 'dart:convert';

StatusMessage statusMessageFromJson(String str) => StatusMessage.fromJson(json.decode(str));

String statusMessageToJson(StatusMessage data) => json.encode(data.toJson());

class StatusMessage {
    StatusMessage({
        required this.status,
        this.message,
    });

    String status;
    String? message = "";

    factory StatusMessage.fromJson(Map<String, dynamic> json) => StatusMessage(
        status: json["status"],
        message: json["message"],
    );

    
    factory StatusMessage.fromJsonstOnly(Map<String, dynamic> json) => StatusMessage(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
