import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_app/data/models/request/create_medical_records_request_model.dart';
import 'package:flutter_clinic_app/data/models/response/create_medical_records_response_model.dart';
import 'package:flutter_clinic_app/data/models/response/get_medical_records_response_model.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/variables.dart';
import 'auth_local_datasource.dart';

class MedicalRecordsRemoteDatasource {
  Future<Either<String, GetMedicalRecordsResponseModel>>
      getMedicalRecords() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-medical-records');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(GetMedicalRecordsResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data rekam medis pasien');
    }
  }

  Future<Either<String, GetMedicalRecordsResponseModel>>
      getMedicalRecordsByPatientName(String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/api-medical-records?nik=$name');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(GetMedicalRecordsResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data rekam medis pasien');
    }
  }

  Future<Either<String, CreateMedicalRecordsResponseModel>>
      createMedicalRecordPatient(
          CreateMedicalRecordsRequestModel requestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/api-medical-records');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: requestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return Right(CreateMedicalRecordsResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal menambahkan rekam medis patient');
    }
  }
}
