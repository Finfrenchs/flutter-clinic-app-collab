part of 'get_medical_records_bloc.dart';

@freezed
class GetMedicalRecordsEvent with _$GetMedicalRecordsEvent {
  const factory GetMedicalRecordsEvent.started() = _Started;
  const factory GetMedicalRecordsEvent.fetchMedicalRecord() =
      _FetchMedicalRecord;
  const factory GetMedicalRecordsEvent.fetchByPatientName(String name) =
      _FetchByPatientName;
  const factory GetMedicalRecordsEvent.fetchByPatientScheduleId(int id) =
      _FetchByPatientScheduleId;
}
