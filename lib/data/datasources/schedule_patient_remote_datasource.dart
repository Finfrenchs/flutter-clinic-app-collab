import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_app/data/models/response/create_reserve_patient_response_model.dart';
import 'package:flutter_clinic_app/data/models/response/get_schedule_patient_response_Model.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/variables.dart';
import '../models/request/create_reserve_patient_request_model.dart';
import 'auth_local_datasource.dart';

class SchedulePatientRemoteDatasource {
  Future<Either<String, CreateReservePatientResponseModel>>
      createReservePatient(
          CreateReservePatientRequestModel requestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/api-patient-schedules');

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
      return Right(CreateReservePatientResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal reservasi patient');
    }
  }

  Future<Either<String, GetSchedulePatientResponseModel>>
      getSchedulePatient() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-patient-schedules');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(GetSchedulePatientResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data jadwal pasien');
    }
  }

  Future<Either<String, GetSchedulePatientResponseModel>>
      getSchedulePatientByNik(String nik) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/api-patient-schedules?nik=$nik');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(GetSchedulePatientResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data pasien');
    }
  }
}
