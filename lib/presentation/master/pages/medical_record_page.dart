import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/get_medical_records/get_medical_records_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/components/components.dart';
import '../../../core/core.dart';
import '../../home/widgets/build_app_bar.dart';
import '../models/medical_record_model.dart';

class MedicalRecordPage extends StatefulWidget {
  const MedicalRecordPage({super.key});

  @override
  State<MedicalRecordPage> createState() => _MedicalRecordPageState();
}

class _MedicalRecordPageState extends State<MedicalRecordPage> {
  final searchController = TextEditingController();
  late List<MedicalRecord> searchResult;

  @override
  void initState() {
    searchResult = medicalRecords;
    context
        .read<GetMedicalRecordsBloc>()
        .add(const GetMedicalRecordsEvent.fetchMedicalRecord());
    super.initState();
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy');

    final String formattedDate = formatter.format(date);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Rekam Medis',
          withSearchInput: true,
          searchController: searchController,
          onChanged: (value) {
            if (value.length >= 2) {
              context
                  .read<GetMedicalRecordsBloc>()
                  .add(GetMedicalRecordsEvent.fetchByPatientName(value));
            }
            if (value.isEmpty) {
              context
                  .read<GetMedicalRecordsBloc>()
                  .add(const GetMedicalRecordsEvent.fetchMedicalRecord());
            }
          },
          searchHint: 'Cari Data RM',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          BlocBuilder<GetMedicalRecordsBloc, GetMedicalRecordsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const SizedBox();
                },
                loading: () => const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
                error: (message) {
                  return Align(
                    alignment: Alignment.center,
                    child: Text(message),
                  );
                },
                loaded: (data) {
                  return Container(
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
                                label: 'Keluhan',
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
                                label: 'Jadwal Periksa',
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
                                label: 'Dokter Pemeriksa',
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
                                label: 'Action',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                        rows: data.data!.isEmpty
                            ? [
                                const DataRow(
                                  cells: [
                                    DataCell(Row(
                                      children: [
                                        Icon(Icons.highlight_off),
                                        SpaceWidth(4.0),
                                        Text('Data tidak ditemukan...'),
                                      ],
                                    )),
                                  ],
                                ),
                              ]
                            : data.data!
                                .map(
                                  (medicalRecord) => DataRow(
                                    cells: [
                                      DataCell(
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              medicalRecord.patient!.name!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(medicalRecord.status!)
                                          ],
                                        ),
                                      ),
                                      DataCell(
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                medicalRecord.patientSchedule!
                                                    .complaint!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: medicalRecord
                                                            .patientSchedule!
                                                            .complaint!
                                                            .split(' ')
                                                            .length >
                                                        8
                                                    ? 3
                                                    : 1,
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                medicalRecord
                                                        .medicalTreatments ??
                                                    '',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: medicalRecord
                                                            .medicalTreatments!
                                                            .split(' ')
                                                            .length >
                                                        8
                                                    ? 3
                                                    : 1,
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            formatDate(
                                              medicalRecord.patientSchedule!
                                                  .scheduleTime!,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            medicalRecord.doctor!.doctorName!,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        PopupMenuButton<String>(
                                          offset: const Offset(0, 50),
                                          icon: const Icon(Icons.more_horiz),
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry<String>>[
                                            const PopupMenuItem<String>(
                                              value: 'Detail',
                                              child:
                                                  _PopupMenuItemValue('Detail'),
                                            ),
                                          ],
                                          onSelected: (value) {
                                            // context.push(MedicalRecordDetailPage(
                                            //     medicalRecord.details),);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PopupMenuItemValue extends StatelessWidget {
  final String item;
  const _PopupMenuItemValue(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 18.0,
          height: 18.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.orderIsProcessing,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
        ),
        const SpaceWidth(4.0),
        Text(item),
      ],
    );
  }
}
