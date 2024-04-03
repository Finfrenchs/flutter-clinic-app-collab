import 'package:bloc/bloc.dart';
import 'package:flutter_clinic_app/data/datasources/master_remote_datasource.dart';
import 'package:flutter_clinic_app/data/models/request/create_patient_request_model.dart';
import 'package:flutter_clinic_app/data/models/response/create_patient_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_patient_event.dart';
part 'create_patient_state.dart';
part 'create_patient_bloc.freezed.dart';

class CreatePatientBloc extends Bloc<CreatePatientEvent, CreatePatientState> {
  final MasterRemoteDatasource datasource;
  CreatePatientBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_CreatePatient>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.createPatient(event.data);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
