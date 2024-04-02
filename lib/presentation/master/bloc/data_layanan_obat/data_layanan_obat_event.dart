part of 'data_layanan_obat_bloc.dart';

@freezed
class DataLayananObatEvent with _$DataLayananObatEvent {
  const factory DataLayananObatEvent.started() = _Started;
  const factory DataLayananObatEvent.getLayananObat() = _GetLayananObat;
  const factory DataLayananObatEvent.getLayananObatByName(String name) =
      _GetLayananObatByName;
}
