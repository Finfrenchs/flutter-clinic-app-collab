import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_app/core/constants/variables.dart';
import 'package:flutter_clinic_app/data/models/response/master_doctor_response_model.dart';
import 'package:flutter_clinic_app/data/models/response/master_patient_response.dart';

import 'auth_local_datasource.dart';
import 'package:http/http.dart' as http;

class MasterRemoteDatasource {
  Future<Either<String, MasterDoctorResponseModel>> getDoctors() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-doctors');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterDoctorResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data dokter');
    }
  }

  Future<Either<String, MasterDoctorResponseModel>> getDoctorsByName(
      String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-doctors?name=$name');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterDoctorResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data dokter');
    }
  }

  Future<Either<String, MasterPatientResponseModel>> getPatients() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-patients');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterPatientResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data patients');
    }
  }

  Future<Either<String, MasterPatientResponseModel>> getPatientsByNIK(
      String nik) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-patients?nik=$nik');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterPatientResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data patients');
    }
  }
}
