import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../../../core/core.dart';
import '../../home/widgets/build_app_bar.dart';
import '../../home/widgets/dialogs/create_medical_record_dialog.dart';
import '../models/medical_record_model.dart';

class MedicalRecordDetailPage extends StatefulWidget {
  final List<MedicalRecordDetail> items;
  const MedicalRecordDetailPage(this.items, {super.key});

  @override
  State<MedicalRecordDetailPage> createState() =>
      _MedicalRecordDetailPageState();
}

class _MedicalRecordDetailPageState extends State<MedicalRecordDetailPage> {
  final searchController = TextEditingController();
  late List<MedicalRecordDetail> searchResult;

  @override
  void initState() {
    searchResult = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: BuildAppBar(
            title: 'Rekam Medis',
            withSearchInput: true,
            searchController: searchController,
            // searchChanged: (value) {
            //   searchResult = widget.items
            //       .where((element) => element.namaPasien
            //           .toLowerCase()
            //           .contains(searchController.text.toLowerCase()))
            //       .toList();
            //   setState(() {});
            // },
            searchHint: 'Cari Data RM',
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.stroke),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button.filled(
                          onPressed: () {},
                          label: 'Nama Pasien',
                          width: null,
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button.filled(
                          onPressed: () {},
                          label: 'Diagnosa',
                          width: null,
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button.filled(
                          onPressed: () {},
                          label: 'Tindakan Medis',
                          width: null,
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button.filled(
                          onPressed: () {},
                          label: 'Riwayat Kunjungan',
                          width: null,
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button.filled(
                          onPressed: () {},
                          label: 'Catatan Dokter',
                          width: null,
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                  rows: searchResult.isEmpty
                      ? [
                          const DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  Icon(Icons.highlight_off),
                                  SpaceWidth(4.0),
                                  Text('Data tidak ditemukan..'),
                                ],
                              )),
                              DataCell.empty,
                              DataCell.empty,
                              DataCell.empty,
                              DataCell.empty,
                            ],
                          ),
                        ]
                      : searchResult
                          .map(
                            (medicalRecord) => DataRow(cells: [
                              DataCell(Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    medicalRecord.namaPasien,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(medicalRecord.kategoriUmur),
                                ],
                              )),
                              DataCell(Text(medicalRecord.diagnosa)),
                              DataCell(Text(medicalRecord.tindakanMedis)),
                              DataCell(Text(
                                  medicalRecord.riwayatKunjunganFormatted)),
                              DataCell(Text(medicalRecord.catatanDokter)),
                            ]),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
