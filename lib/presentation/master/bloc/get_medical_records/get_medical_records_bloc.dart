import 'package:bloc/bloc.dart';
import 'package:flutter_clinic_app/data/datasources/medical_records_remote_datasource.dart';
import 'package:flutter_clinic_app/data/models/response/get_medical_records_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_medical_records_event.dart';
part 'get_medical_records_state.dart';
part 'get_medical_records_bloc.freezed.dart';

class GetMedicalRecordsBloc
    extends Bloc<GetMedicalRecordsEvent, GetMedicalRecordsState> {
  final MedicalRecordsRemoteDatasource datasource;
  GetMedicalRecordsBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_FetchMedicalRecord>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.getMedicalRecords();

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });

    on<_FetchByPatientName>((event, emit) async {
      emit(const _Loading());

      final response =
          await datasource.getMedicalRecordsByPatientName(event.name);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
