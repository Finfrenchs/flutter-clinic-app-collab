import 'dart:convert';

import 'master_patient_response.dart';

class PaymentDetailListResponseModel {
  final List<PaymentDetail>? data;
  final String? message;
  final String? status;

  PaymentDetailListResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory PaymentDetailListResponseModel.fromJson(String str) =>
      PaymentDetailListResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentDetailListResponseModel.fromMap(Map<String, dynamic> json) =>
      PaymentDetailListResponseModel(
        data: json["data"] == null
            ? []
            : List<PaymentDetail>.from(
                json["data"]!.map((x) => PaymentDetail.fromMap(x))),
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

class PaymentDetail {
  final int? id;
  final int? patientScheduleId;
  final int? medicalRecordId;
  final int? patientId;
  final DateTime? transactionTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final PatientSchedule? patientSchedule;
  final MasterPatient? patient;

  PaymentDetail({
    this.id,
    this.patientScheduleId,
    this.medicalRecordId,
    this.patientId,
    this.transactionTime,
    this.createdAt,
    this.updatedAt,
    this.patientSchedule,
    this.patient,
  });

  factory PaymentDetail.fromJson(String str) =>
      PaymentDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentDetail.fromMap(Map<String, dynamic> json) => PaymentDetail(
        id: json["id"],
        patientScheduleId: json["patient_schedule_id"],
        medicalRecordId: json["medical_record_id"],
        patientId: json["patient_id"],
        transactionTime: json["transaction_time"] == null
            ? null
            : DateTime.parse(json["transaction_time"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        patientSchedule: json["patient_schedule"] == null
            ? null
            : PatientSchedule.fromMap(json["patient_schedule"]),
        patient: json["patient"] == null
            ? null
            : MasterPatient.fromMap(json["patient"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "patient_schedule_id": patientScheduleId,
        "medical_record_id": medicalRecordId,
        "patient_id": patientId,
        "transaction_time": transactionTime?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "patient_schedule": patientSchedule?.toMap(),
        "patient": patient?.toMap(),
      };
}

class PatientSchedule {
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

  PatientSchedule({
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
  });

  factory PatientSchedule.fromJson(String str) =>
      PatientSchedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientSchedule.fromMap(Map<String, dynamic> json) => PatientSchedule(
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
      };
}
