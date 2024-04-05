import 'package:bloc/bloc.dart';
import 'package:flutter_clinic_app/data/datasources/schedule_patient_remote_datasource.dart';
import 'package:flutter_clinic_app/data/models/request/create_reserve_patient_request_model.dart';
import 'package:flutter_clinic_app/data/models/response/create_reserve_patient_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_reserve_patient_event.dart';
part 'create_reserve_patient_state.dart';
part 'create_reserve_patient_bloc.freezed.dart';

class CreateReservePatientBloc
    extends Bloc<CreateReservePatientEvent, CreateReservePatientState> {
  final SchedulePatientRemoteDatasource datasource;
  CreateReservePatientBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Reserve>((event, emit) async {
      emit(const _Loading());

      final response =
          await datasource.createReservePatient(event.reservePatient);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(
          _Loaded(r),
        ),
      );
    });
  }
}
