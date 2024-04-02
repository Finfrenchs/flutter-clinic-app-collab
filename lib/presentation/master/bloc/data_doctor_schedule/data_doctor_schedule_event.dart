part of 'data_doctor_schedule_bloc.dart';

@freezed
class DataDoctorScheduleEvent with _$DataDoctorScheduleEvent {
  const factory DataDoctorScheduleEvent.started() = _Started;
  const factory DataDoctorScheduleEvent.getScheduleDoctor() =
      _GetScheduleDoctor;
  const factory DataDoctorScheduleEvent.getScheduleDoctorByName(String name) =
      _GetScheduleDoctorByName;
}
