import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/core/components/buttons.dart';
import 'package:flutter_clinic_app/core/components/spaces.dart';
import 'package:flutter_clinic_app/core/constants/colors.dart';
import 'package:flutter_clinic_app/core/core.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_patients/data_patients_bloc.dart';

import '../../home/widgets/build_app_bar.dart';
import '../models/pasient_model.dart';
import '../models/pasient_status.dart';

class DataPatientPage extends StatefulWidget {
  const DataPatientPage({super.key});

  @override
  State<DataPatientPage> createState() => _DataPatientPageState();
}

class _DataPatientPageState extends State<DataPatientPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<DataPatientsBloc>().add(const DataPatientsEvent.getPatients());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Master Pasien',
          withSearchInput: true,
          searchController: searchController,
          searchHint: 'Cari Pasien',
          searchTap: () {
            if (searchController.text.isNotEmpty &&
                searchController.text.length > 1) {
              context.read<DataPatientsBloc>().add(
                  DataPatientsEvent.getPatientByNIK(searchController.text));
            } else {
              context
                  .read<DataPatientsBloc>()
                  .add(const DataPatientsEvent.getPatients());
            }
          },
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
              child: BlocBuilder<DataPatientsBloc, DataPatientsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    loaded: (patients) {
                      return DataTable(
                        dataRowMinHeight: 30.0,
                        dataRowMaxHeight: 60.0,
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
                                label: 'Jenis Kelamnin',
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
                                label: 'Tanggal Lahir',
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
                                label: 'NIK',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                        rows: patients.isEmpty
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
                                  ],
                                ),
                              ]
                            : patients
                                .map(
                                  (patient) => DataRow(cells: [
                                    DataCell(Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          patient.name ?? 'No Name',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(patient.gender ?? 'Male'),
                                      ],
                                    )),
                                    DataCell(Center(
                                        child: Text(patient.gender ?? '-'))),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          patient.birthDate!.toFormattedDate(),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                        child: Text(patient.nik ?? '-'))),
                                  ]),
                                )
                                .toList(),
                      );
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
