part of 'get_medical_records_bloc.dart';

@freezed
class GetMedicalRecordsState with _$GetMedicalRecordsState {
  const factory GetMedicalRecordsState.initial() = _Initial;
  const factory GetMedicalRecordsState.loading() = _Loading;
  const factory GetMedicalRecordsState.loaded(
      GetMedicalRecordsResponseModel data) = _Loaded;
  const factory GetMedicalRecordsState.loadedByPatientScheduleId(
          GetMedicalRecordsByPatientScheduleIdResponseModel data) =
      _LoadedByPatientScheduleId;
  const factory GetMedicalRecordsState.error(String message) = _Error;
}
