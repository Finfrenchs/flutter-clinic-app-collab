import 'package:bloc/bloc.dart';
import 'package:flutter_clinic_app/data/datasources/payment_detail_remote_datasource.dart';
import 'package:flutter_clinic_app/data/models/response/payment_detail_list_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_payment_detail_event.dart';
part 'get_payment_detail_state.dart';
part 'get_payment_detail_bloc.freezed.dart';

class GetPaymentDetailBloc
    extends Bloc<GetPaymentDetailEvent, GetPaymentDetailState> {
  final PaymentDetailRemoteDatasource datasource;
  GetPaymentDetailBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.getPaymentDetail();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
