// To parse this JSON data, do
//
//     final jadwalModel = jadwalModelFromJson(jsonString);

import 'dart:convert';

JadwalModel jadwalModelFromJson(String str) => JadwalModel.fromJson(json.decode(str));

String jadwalModelToJson(JadwalModel data) => json.encode(data.toJson());

class JadwalModel {
    JadwalModel({
        required this.status,
        required this.message,
        required this.jadwal,
    });

    String status;
    String message;
    Jadwal jadwal;

    factory JadwalModel.fromJson(Map<String, dynamic> json) => JadwalModel(
        status: json["status"],
        message: json["message"],
        jadwal: Jadwal.fromJson(json["jadwal"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "jadwal": jadwal.toJson(),
    };
}

class Jadwal {
    Jadwal({
      required  this.minggu,
      required  this.senin,
      required  this.selasa,
      required  this.rabu,
      required  this.kamis,
      required  this.jumat,
      required  this.sabtu,
    });

    var minggu;
    var senin;
    var selasa;
    var rabu;
    var kamis;
    var jumat;
    var sabtu;

    factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        minggu: json["minggu"],
        senin: json["senin"],
        selasa: json["selasa"],
        rabu: json["rabu"],
        kamis: json["kamis"],
        jumat: json["jumat"],
        sabtu: json["sabtu"],
    );

    Map<String, dynamic> toJson() => {
        "minggu": minggu,
        "senin": senin,
        "selasa": selasa,
        "rabu": rabu,
        "kamis": kamis,
        "jumat": jumat,
        "sabtu": sabtu,
    };
}
