import 'dart:convert';

import 'package:flutter_clinic_app/data/models/response/master_doctor_response_model.dart';
import 'package:flutter_clinic_app/data/models/response/master_patient_response.dart';

class GetSchedulePatientResponseModel {
  final List<SchedulePatient>? data;
  final String? message;
  final String? status;

  GetSchedulePatientResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory GetSchedulePatientResponseModel.fromJson(String str) =>
      GetSchedulePatientResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetSchedulePatientResponseModel.fromMap(Map<String, dynamic> json) =>
      GetSchedulePatientResponseModel(
        data: json["data"] == null
            ? []
            : List<SchedulePatient>.from(
                json["data"]!.map((x) => SchedulePatient.fromMap(x))),
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

class SchedulePatient {
  final int? id;
  final int? patientId;
  final int? doctorId;
  final DateTime? scheduleTime;
  final String? complaint;
  final String? status;
  final int? noAntrian;
  final String? paymentMethod;
  final int? totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final MasterDoctor? doctor;
  final MasterPatient? patient;

  SchedulePatient({
    this.id,
    this.patientId,
    this.doctorId,
    this.scheduleTime,
    this.complaint,
    this.status,
    this.noAntrian,
    this.paymentMethod,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.doctor,
    this.patient,
  });

  factory SchedulePatient.fromJson(String str) =>
      SchedulePatient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SchedulePatient.fromMap(Map<String, dynamic> json) => SchedulePatient(
        id: json["id"],
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        scheduleTime: json["schedule_time"] == null
            ? null
            : DateTime.parse(json["schedule_time"]),
        complaint: json["complaint"],
        status: json["status"],
        noAntrian: json["no_antrian"],
        paymentMethod: json["payment_method"],
        totalPrice: json["total_price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        doctor: json["doctor"] == null
            ? null
            : MasterDoctor.fromMap(json["doctor"]),
        patient: json["patient"] == null
            ? null
            : MasterPatient.fromMap(json["patient"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "patient_id": patientId,
        "doctor_id": doctorId,
        "schedule_time": scheduleTime?.toIso8601String(),
        "complaint": complaint,
        "status": status,
        "no_antrian": noAntrian,
        "payment_method": paymentMethod,
        "total_price": totalPrice,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor": doctor?.toMap(),
        "patient": patient?.toMap(),
      };
}
