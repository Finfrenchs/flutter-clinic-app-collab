part of 'create_payment_detail_bloc.dart';

@freezed
class CreatePaymentDetailState with _$CreatePaymentDetailState {
  const factory CreatePaymentDetailState.initial() = _Initial;
  const factory CreatePaymentDetailState.loading() = _Loading;
  const factory CreatePaymentDetailState.loaded(
      CreatePaymentDetailResponseModel responseModel) = _Loaded;
  const factory CreatePaymentDetailState.error(String message) = _Error;
}
