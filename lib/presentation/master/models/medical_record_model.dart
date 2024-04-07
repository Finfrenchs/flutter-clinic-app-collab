import '../../../core/core.dart';

class MedicalRecord {
  final String namaPasien;
  final String kategoriUmur;
  final String keluhan;
  final String tindakanMedis;
  final DateTime jadwalPeriksa;
  final List<MedicalRecordDetail> details;

  MedicalRecord({
    required this.namaPasien,
    required this.kategoriUmur,
    required this.keluhan,
    required this.tindakanMedis,
    required this.jadwalPeriksa,
    required this.details,
  });

  String get jadwalPeriksaFormatted => jadwalPeriksa.toFormattedDate();
}

class MedicalRecordDetail {
  final String namaPasien;
  final String kategoriUmur;
  final String diagnosa;
  final String tindakanMedis;
  final DateTime riwayatKunjungan;
  final String catatanDokter;

  MedicalRecordDetail({
    required this.namaPasien,
    required this.kategoriUmur,
    required this.diagnosa,
    required this.tindakanMedis,
    required this.riwayatKunjungan,
    required this.catatanDokter,
  });

  String get riwayatKunjunganFormatted => riwayatKunjungan.toFormattedDate();
}

final medicalRecordDetails = MedicalRecordDetail(
  namaPasien: 'Bahri',
  kategoriUmur: 'Dewasa',
  diagnosa: 'Diagnosa',
  tindakanMedis: 'Kasih Obat',
  riwayatKunjungan: DateTime(2024, 6, 24),
  catatanDokter: 'Lorem Ipsum',
);
final medicalRecords = [
  MedicalRecord(
    namaPasien: 'Bahri',
    kategoriUmur: 'Dewasa',
    keluhan: 'Meriang',
    tindakanMedis: 'Kasih Obat',
    jadwalPeriksa: DateTime(2024, 6, 12),
    details: [medicalRecordDetails],
  ),
  MedicalRecord(
    namaPasien: 'Fua',
    kategoriUmur: 'Anak-anak',
    keluhan: 'Meriang',
    tindakanMedis: 'Kasih Obat',
    jadwalPeriksa: DateTime(2024, 6, 12),
    details: [medicalRecordDetails, medicalRecordDetails],
  ),
];
