import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/data/datasources/medical_records_remote_datasource.dart';
import 'package:flutter_clinic_app/data/models/request/create_medical_records_request_model.dart';
import 'package:flutter_clinic_app/data/models/response/create_medical_records_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_medical_record_event.dart';
part 'create_medical_record_state.dart';
part 'create_medical_record_bloc.freezed.dart';

class CreateMedicalRecordBloc
    extends Bloc<CreateMedicalRecordEvent, CreateMedicalRecordState> {
  final MedicalRecordsRemoteDatasource datasource;
  CreateMedicalRecordBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_CreateMedicalRecord>((event, emit) async {
      emit(const _Loading());

      final response = await datasource
          .createMedicalRecordPatient(event.createMedicalRecord);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
