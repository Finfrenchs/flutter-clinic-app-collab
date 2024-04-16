part of 'get_payment_detail_bloc.dart';

@freezed
class GetPaymentDetailState with _$GetPaymentDetailState {
  const factory GetPaymentDetailState.initial() = _Initial;
  const factory GetPaymentDetailState.loading() = _Loading;
  const factory GetPaymentDetailState.loaded(
      List<PaymentDetail> responseModel) = _Loaded;
  const factory GetPaymentDetailState.error(String message) = _Error;
}
