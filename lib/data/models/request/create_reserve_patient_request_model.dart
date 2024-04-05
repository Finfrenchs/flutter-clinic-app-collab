import 'dart:convert';

class CreateReservePatientRequestModel {
  final int? patientId;
  final String? scheduleTime;
  final String? complaint;
  final int? doctorId;

  CreateReservePatientRequestModel({
    this.patientId,
    this.scheduleTime,
    this.complaint,
    this.doctorId,
  });

  factory CreateReservePatientRequestModel.fromJson(String str) =>
      CreateReservePatientRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateReservePatientRequestModel.fromMap(Map<String, dynamic> json) =>
      CreateReservePatientRequestModel(
        patientId: json["patient_id"],
        scheduleTime: json["schedule_time"],
        complaint: json["complaint"],
        doctorId: json["doctor_id"],
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "schedule_time": scheduleTime,
        "complaint": complaint,
        "doctor_id": doctorId,
      };
}
