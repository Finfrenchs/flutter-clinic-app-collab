import 'dart:convert';

import 'package:flutter_clinic_app/data/models/response/master_doctor_response_model.dart';

class MasterDoctorScheduleResponseModel {
  final List<DoctorSchedule>? data;
  final String? message;
  final String? status;

  MasterDoctorScheduleResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory MasterDoctorScheduleResponseModel.fromJson(String str) =>
      MasterDoctorScheduleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MasterDoctorScheduleResponseModel.fromMap(
          Map<String, dynamic> json) =>
      MasterDoctorScheduleResponseModel(
        data: json["data"] == null
            ? []
            : List<DoctorSchedule>.from(
                json["data"]!.map((x) => DoctorSchedule.fromMap(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "status": status,
      };
}

class DoctorSchedule {
  final int? id;
  final int? doctorId;
  final String? day;
  final String? time;
  final String? status;
  final String? note;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final MasterDoctor? doctor;

  DoctorSchedule({
    this.id,
    this.doctorId,
    this.day,
    this.time,
    this.status,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.doctor,
  });

  factory DoctorSchedule.fromJson(String str) =>
      DoctorSchedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorSchedule.fromMap(Map<String, dynamic> json) => DoctorSchedule(
        id: json["id"],
        doctorId: json["doctor_id"],
        day: json["day"],
        time: json["time"],
        status: json["status"],
        note: json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        doctor: json["doctor"] == null
            ? null
            : MasterDoctor.fromMap(json["doctor"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "doctor_id": doctorId,
        "day": day,
        "time": time,
        "status": status,
        "note": note,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor": doctor?.toMap(),
      };
}
