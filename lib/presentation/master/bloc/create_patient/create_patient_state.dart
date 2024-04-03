part of 'create_patient_bloc.dart';

@freezed
class CreatePatientState with _$CreatePatientState {
  const factory CreatePatientState.initial() = _Initial;
  const factory CreatePatientState.loading() = _Loading;
  const factory CreatePatientState.loaded(
      CreatePatientResponseModel responseModel) = _Loaded;
  const factory CreatePatientState.error(String message) = _Error;
}
