import 'dart:convert';

class UpdatePatientScheduleRequestModel {
  final String? scheduleTime;
  final String? complaint;
  final int? doctorId;
  final String? status;
  final String? paymentMethod;
  final int? totalPrice;
  final int? noAntrian;

  UpdatePatientScheduleRequestModel({
    this.scheduleTime,
    this.complaint,
    this.doctorId,
    this.status,
    this.paymentMethod,
    this.totalPrice,
    this.noAntrian,
  });

  factory UpdatePatientScheduleRequestModel.fromJson(String str) =>
      UpdatePatientScheduleRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePatientScheduleRequestModel.fromMap(
          Map<String, dynamic> json) =>
      UpdatePatientScheduleRequestModel(
        scheduleTime: json["schedule_time"],
        complaint: json["complaint"],
        doctorId: json["doctor_id"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        totalPrice: json["total_price"],
        noAntrian: json["no_antrian"],
      );

  Map<String, dynamic> toMap() {
    // Buat map kosong
    final Map<String, dynamic> map = {};
    // Tambahkan bidang-bidang yang memiliki nilai yang tidak null ke dalam map
    if (scheduleTime != null) map["schedule_time"] = scheduleTime;
    if (complaint != null) map["complaint"] = complaint;
    if (doctorId != null) map["doctor_id"] = doctorId;
    if (status != null) map["status"] = status;
    if (paymentMethod != null) map["payment_method"] = paymentMethod;
    if (totalPrice != null) map["total_price"] = totalPrice;
    if (noAntrian != null) map["no_antrian"] = noAntrian;
    // Kembalikan map yang telah dibuat
    return map;
  }
}
