import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_app/data/models/request/create_payment_detail_request_model.dart';
import 'package:flutter_clinic_app/data/models/response/create_payment_detail_response_model.dart';
import 'package:flutter_clinic_app/data/models/response/payment_detail_list_response_model.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/variables.dart';
import 'auth_local_datasource.dart';

class PaymentDetailRemoteDatasource {
  Future<Either<String, CreatePaymentDetailResponseModel>> createPaymentDetail(
      CreatePaymentDetailRequestModel requestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/api-payment-details');

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
      return Right(CreatePaymentDetailResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal menambahkan detail pembayaran');
    }
  }

  Future<Either<String, PaymentDetailListResponseModel>>
      getPaymentDetail() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-payment-details');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(PaymentDetailListResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan detail pembayaran');
    }
  }
}
