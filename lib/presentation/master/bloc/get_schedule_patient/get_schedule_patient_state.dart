part of 'get_schedule_patient_bloc.dart';

@freezed
class GetSchedulePatientState with _$GetSchedulePatientState {
  const factory GetSchedulePatientState.initial() = _Initial;
  const factory GetSchedulePatientState.loading() = _Loading;
  const factory GetSchedulePatientState.loaded(
      List<SchedulePatient> schedulePatient) = _Loaded;
  const factory GetSchedulePatientState.error(String message) = _Error;
}
