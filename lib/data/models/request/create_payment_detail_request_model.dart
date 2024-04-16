import 'dart:convert';

class CreatePaymentDetailRequestModel {
  final int? patientScheduleId;
  final int? patientId;
  final DateTime? transactionTime;

  CreatePaymentDetailRequestModel({
    this.patientScheduleId,
    this.transactionTime,
    this.patientId,
  });

  factory CreatePaymentDetailRequestModel.fromJson(String str) =>
      CreatePaymentDetailRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePaymentDetailRequestModel.fromMap(Map<String, dynamic> json) =>
      CreatePaymentDetailRequestModel(
        patientScheduleId: json["patient_schedule_id"],
        patientId: json["patient_id"],
        transactionTime: json["transaction_time"] == null
            ? null
            : DateTime.parse(json["transaction_time"]),
      );

  Map<String, dynamic> toMap() => {
        "patient_schedule_id": patientScheduleId,
        "patient_id": patientId,
        "transaction_time": transactionTime?.toIso8601String(),
      };
}
