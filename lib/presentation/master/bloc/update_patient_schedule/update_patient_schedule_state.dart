part of 'update_patient_schedule_bloc.dart';

@freezed
class UpdatePatientScheduleState with _$UpdatePatientScheduleState {
  const factory UpdatePatientScheduleState.initial() = _Initial;
  const factory UpdatePatientScheduleState.loading() = _Loading;
  const factory UpdatePatientScheduleState.loaded(
      UpdatePatientScheduleResponseModel responseModel) = _Loaded;
  const factory UpdatePatientScheduleState.error(String message) = _Error;
}
