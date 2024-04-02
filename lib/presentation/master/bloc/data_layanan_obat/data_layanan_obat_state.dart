part of 'data_layanan_obat_bloc.dart';

@freezed
class DataLayananObatState with _$DataLayananObatState {
  const factory DataLayananObatState.initial() = _Initial;
  const factory DataLayananObatState.loading() = _Loading;
  const factory DataLayananObatState.loaded(
      List<ServiceAndMedicine> serviceMedicine) = _Loaded;
  const factory DataLayananObatState.error(String error) = _Error;
}
