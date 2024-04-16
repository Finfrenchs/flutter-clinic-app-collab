import 'package:bloc/bloc.dart';
import 'package:flutter_clinic_app/data/datasources/payment_detail_remote_datasource.dart';
import 'package:flutter_clinic_app/data/models/request/create_payment_detail_request_model.dart';
import 'package:flutter_clinic_app/data/models/response/create_payment_detail_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_payment_detail_event.dart';
part 'create_payment_detail_state.dart';
part 'create_payment_detail_bloc.freezed.dart';

class CreatePaymentDetailBloc
    extends Bloc<CreatePaymentDetailEvent, CreatePaymentDetailState> {
  final PaymentDetailRemoteDatasource datasource;
  CreatePaymentDetailBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Create>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.createPaymentDetail(event.requestModel);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
