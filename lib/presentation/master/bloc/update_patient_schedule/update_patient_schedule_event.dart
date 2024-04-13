part of 'update_patient_schedule_bloc.dart';

@freezed
class UpdatePatientScheduleEvent with _$UpdatePatientScheduleEvent {
  const factory UpdatePatientScheduleEvent.started() = _Started;
  const factory UpdatePatientScheduleEvent.update(
      UpdatePatientScheduleRequestModel requestModel, int id) = _Update;
}
