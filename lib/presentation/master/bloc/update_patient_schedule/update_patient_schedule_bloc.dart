import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/data/datasources/schedule_patient_remote_datasource.dart';
import 'package:flutter_clinic_app/data/models/request/update_patien_schedule_request_model.dart';
import 'package:flutter_clinic_app/data/models/response/update_patien_schedule_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_patient_schedule_event.dart';
part 'update_patient_schedule_state.dart';
part 'update_patient_schedule_bloc.freezed.dart';

class UpdatePatientScheduleBloc
    extends Bloc<UpdatePatientScheduleEvent, UpdatePatientScheduleState> {
  final SchedulePatientRemoteDatasource datasource;
  UpdatePatientScheduleBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Update>((event, emit) async {
      emit(const _Loading());

      final response =
          await datasource.updatePatientSchedule(event.requestModel, event.id);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
