import 'dart:convert';

class GetMedicalRecordsByPatientScheduleIdResponseModel {
  final String? message;
  final String? status;
  final List<ServiceAndMedicineItem>? data;

  GetMedicalRecordsByPatientScheduleIdResponseModel({
    this.message,
    this.status,
    this.data,
  });

  factory GetMedicalRecordsByPatientScheduleIdResponseModel.fromJson(
          String str) =>
      GetMedicalRecordsByPatientScheduleIdResponseModel.fromMap(
          json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMedicalRecordsByPatientScheduleIdResponseModel.fromMap(
          Map<String, dynamic> json) =>
      GetMedicalRecordsByPatientScheduleIdResponseModel(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<ServiceAndMedicineItem>.from(
                json["data"]!.map((x) => ServiceAndMedicineItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ServiceAndMedicineItem {
  final String? serviceName;
  final int? quantity;
  final int? price;

  ServiceAndMedicineItem({
    this.serviceName,
    this.quantity,
    this.price,
  });

  factory ServiceAndMedicineItem.fromJson(String str) =>
      ServiceAndMedicineItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceAndMedicineItem.fromMap(Map<String, dynamic> json) =>
      ServiceAndMedicineItem(
        serviceName: json["service_name"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "service_name": serviceName,
        "quantity": quantity,
        "price": price,
      };
}
