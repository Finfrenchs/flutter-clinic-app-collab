import 'dart:convert';

class MasterDataLayananResponseModel {
  final List<ServiceAndMedicine>? data;
  final String? message;
  final String? status;

  MasterDataLayananResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory MasterDataLayananResponseModel.fromJson(String str) =>
      MasterDataLayananResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MasterDataLayananResponseModel.fromMap(Map<String, dynamic> json) =>
      MasterDataLayananResponseModel(
        data: json["data"] == null
            ? []
            : List<ServiceAndMedicine>.from(
                json["data"]!.map((x) => ServiceAndMedicine.fromMap(x))),
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

class ServiceAndMedicine {
  final int? id;
  final String? name;
  final String? category;
  final int? price;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ServiceAndMedicine({
    this.id,
    this.name,
    this.category,
    this.price,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceAndMedicine.fromJson(String str) =>
      ServiceAndMedicine.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceAndMedicine.fromMap(Map<String, dynamic> json) =>
      ServiceAndMedicine(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
