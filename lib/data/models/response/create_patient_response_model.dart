import 'dart:convert';

import 'package:flutter_clinic_app/data/models/response/master_patient_response.dart';

class CreatePatientResponseModel {
  final MasterPatient? data;
  final String? message;
  final String? status;

  CreatePatientResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory CreatePatientResponseModel.fromJson(String str) =>
      CreatePatientResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePatientResponseModel.fromMap(Map<String, dynamic> json) =>
      CreatePatientResponseModel(
        data: json["data"] == null ? null : MasterPatient.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "message": message,
        "status": status,
      };
}
