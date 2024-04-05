part of 'create_reserve_patient_bloc.dart';

@freezed
class CreateReservePatientEvent with _$CreateReservePatientEvent {
  const factory CreateReservePatientEvent.started() = _Started;
  const factory CreateReservePatientEvent.reserve(
      CreateReservePatientRequestModel reservePatient) = _Reserve;
}
