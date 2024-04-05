import 'dart:convert';

class CreateReservePatientResponseModel {
  final ReservePatient? data;
  final String? message;
  final String? status;

  CreateReservePatientResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory CreateReservePatientResponseModel.fromJson(String str) =>
      CreateReservePatientResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateReservePatientResponseModel.fromMap(
          Map<String, dynamic> json) =>
      CreateReservePatientResponseModel(
        data:
            json["data"] == null ? null : ReservePatient.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "message": message,
        "status": status,
      };
}

class ReservePatient {
  final int? patientId;
  final String? scheduleTime;
  final String? complaint;
  final int? doctorId;
  final String? status;
  final int? noAntrian;
  final String? paymentMethod;
  final int? totalPrice;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  ReservePatient({
    this.patientId,
    this.scheduleTime,
    this.complaint,
    this.doctorId,
    this.status,
    this.noAntrian,
    this.paymentMethod,
    this.totalPrice,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory ReservePatient.fromJson(String str) =>
      ReservePatient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservePatient.fromMap(Map<String, dynamic> json) => ReservePatient(
        patientId: json["patient_id"],
        scheduleTime: json["schedule_time"],
        complaint: json["complaint"],
        doctorId: json["doctor_id"],
        status: json["status"],
        noAntrian: json["no_antrian"],
        paymentMethod: json["payment_method"],
        totalPrice: json["total_price"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "schedule_time": scheduleTime,
        "complaint": complaint,
        "doctor_id": doctorId,
        "status": status,
        "no_antrian": noAntrian,
        "payment_method": paymentMethod,
        "total_price": totalPrice,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
