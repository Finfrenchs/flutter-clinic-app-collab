import 'dart:convert';

class CreatePaymentDetailResponseModel {
  final Data? data;
  final String? message;
  final String? status;

  CreatePaymentDetailResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory CreatePaymentDetailResponseModel.fromJson(String str) =>
      CreatePaymentDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePaymentDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      CreatePaymentDetailResponseModel(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "message": message,
        "status": status,
      };
}

class Data {
  final int? patientScheduleId;
  final int? patientId;
  final DateTime? transactionTime;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.patientScheduleId,
    this.patientId,
    this.transactionTime,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        patientScheduleId: json["patient_schedule_id"],
        patientId: json["patient_id"],
        transactionTime: json["transaction_time"] == null
            ? null
            : DateTime.parse(json["transaction_time"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "patient_schedule_id": patientScheduleId,
        "patient_id": patientId,
        "transaction_time": transactionTime?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
