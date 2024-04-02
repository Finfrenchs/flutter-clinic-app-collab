import 'package:bloc/bloc.dart';
import 'package:flutter_clinic_app/data/datasources/master_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/response/master_doctor_schedule_response_model.dart';

part 'data_doctor_schedule_event.dart';
part 'data_doctor_schedule_state.dart';
part 'data_doctor_schedule_bloc.freezed.dart';

class DataDoctorScheduleBloc
    extends Bloc<DataDoctorScheduleEvent, DataDoctorScheduleState> {
  final MasterRemoteDatasource datasource;
  DataDoctorScheduleBloc(this.datasource) : super(const _Initial()) {
    on<_GetScheduleDoctor>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.getDoctorSchedule();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });

    on<_GetScheduleDoctorByName>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.getDoctorScheduleByName(event.name);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
