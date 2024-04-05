part of 'create_reserve_patient_bloc.dart';

@freezed
class CreateReservePatientState with _$CreateReservePatientState {
  const factory CreateReservePatientState.initial() = _Initial;
  const factory CreateReservePatientState.loading() = _Loading;
  const factory CreateReservePatientState.loaded(
      CreateReservePatientResponseModel responseModel) = _Loaded;
  const factory CreateReservePatientState.error(String message) = _Error;
}
