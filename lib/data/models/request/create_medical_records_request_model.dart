import 'dart:convert';

class CreateMedicalRecordsRequestModel {
  final int? patientId;
  final int? doctorId;
  final int? patientScheduleId;
  final List<int>? services;
  final String? status;
  final String? diagnosis;
  final String? medicalTreatments;
  final String? doctorNotes;

  CreateMedicalRecordsRequestModel({
    this.patientId,
    this.doctorId,
    this.patientScheduleId,
    this.status,
    this.services,
    this.diagnosis,
    this.medicalTreatments,
    this.doctorNotes,
  });

  factory CreateMedicalRecordsRequestModel.fromJson(String str) =>
      CreateMedicalRecordsRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateMedicalRecordsRequestModel.fromMap(Map<String, dynamic> json) =>
      CreateMedicalRecordsRequestModel(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        patientScheduleId: json["patient_schedule_id"],
        status: json["status"],
        services: json["services"] == null
            ? []
            : List<int>.from(json["services"]!.map((x) => x)),
        diagnosis: json["diagnosis"],
        medicalTreatments: json["medical_treatments"],
        doctorNotes: json["doctor_notes"],
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "patient_schedule_id": patientScheduleId,
        "status": status,
        "services":
            services == null ? [] : List<dynamic>.from(services!.map((x) => x)),
        "diagnosis": diagnosis,
        "medical_treatments": medicalTreatments,
        "doctor_notes": doctorNotes,
      };
}
