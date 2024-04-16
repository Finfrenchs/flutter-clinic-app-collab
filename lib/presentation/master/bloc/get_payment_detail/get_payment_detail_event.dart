part of 'get_payment_detail_bloc.dart';

@freezed
class GetPaymentDetailEvent with _$GetPaymentDetailEvent {
  const factory GetPaymentDetailEvent.started() = _Started;
  const factory GetPaymentDetailEvent.fetch() = _Fetch;
}
