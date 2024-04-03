part of 'create_patient_bloc.dart';

@freezed
class CreatePatientEvent with _$CreatePatientEvent {
  const factory CreatePatientEvent.started() = _Started;
  const factory CreatePatientEvent.createPatient(
      CreatePatientRequestModel data) = _CreatePatient;
}
