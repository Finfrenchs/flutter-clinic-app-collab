import 'package:bloc/bloc.dart';
import 'package:flutter_clinic_app/data/datasources/master_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/response/master_data_layanan_response_model.dart';

part 'data_layanan_obat_event.dart';
part 'data_layanan_obat_state.dart';
part 'data_layanan_obat_bloc.freezed.dart';

class DataLayananObatBloc
    extends Bloc<DataLayananObatEvent, DataLayananObatState> {
  final MasterRemoteDatasource datasource;
  DataLayananObatBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_GetLayananObat>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.getLayananObat();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });

    on<_GetLayananObatByName>((event, emit) async {
      emit(const _Loading());

      final response = await datasource.getLayananObatByName(event.name);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
