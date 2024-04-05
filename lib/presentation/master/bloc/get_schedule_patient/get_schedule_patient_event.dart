part of 'get_schedule_patient_bloc.dart';

@freezed
class GetSchedulePatientEvent with _$GetSchedulePatientEvent {
  const factory GetSchedulePatientEvent.started() = _Started;
  const factory GetSchedulePatientEvent.fetchSchedule() = _FetchSchedule;
  const factory GetSchedulePatientEvent.fetchScheduleByNik(String nik) =
      _FetchScheduleByNik;
}
