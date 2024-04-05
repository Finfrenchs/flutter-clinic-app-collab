import 'package:bloc/bloc.dart';
import 'package:flutter_clinic_app/data/datasources/schedule_patient_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/response/get_schedule_patient_response_Model.dart';

part 'get_schedule_patient_event.dart';
part 'get_schedule_patient_state.dart';
part 'get_schedule_patient_bloc.freezed.dart';

class GetSchedulePatientBloc
    extends Bloc<GetSchedulePatientEvent, GetSchedulePatientState> {
  final SchedulePatientRemoteDatasource datasource;
  GetSchedulePatientBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_FetchSchedule>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.getSchedulePatient();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });

    on<_FetchScheduleByNik>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.getSchedulePatientByNik(event.nik);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
