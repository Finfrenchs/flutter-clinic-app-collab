import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/core/components/buttons.dart';
import 'package:flutter_clinic_app/core/components/spaces.dart';
import 'package:flutter_clinic_app/core/core.dart';
import 'package:flutter_clinic_app/data/models/response/master_patient_response.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_patients/data_patients_bloc.dart';
import 'package:intl/intl.dart';

import '../../home/widgets/build_app_bar.dart';
import '../../home/widgets/dialogs/create_patient_dialog.dart';

class DataPatientPage extends StatefulWidget {
  const DataPatientPage({super.key});

  @override
  State<DataPatientPage> createState() => _DataPatientPageState();
}

class _DataPatientPageState extends State<DataPatientPage> {
  final searchController = TextEditingController();

  bool isPatientFound = false;
  bool isSearching = false;

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
          searchHint: 'Cari Nik Pasien',
          keyBoardType: TextInputType.number,
          onChanged: (value) {
            if (value.length >= 2) {
              setState(() {
                isSearching = true;
              });
              context
                  .read<DataPatientsBloc>()
                  .add(DataPatientsEvent.getPatientByNIK(value));
            }
            if (value.isEmpty) {
              setState(() {
                isSearching = false;
              });
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
          BlocBuilder<DataPatientsBloc, DataPatientsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Center(child: CircularProgressIndicator()),
                loaded: (patients) {
                  isPatientFound = patients.isNotEmpty;

                  return patients.isEmpty
                      ? _buildEmptyResult()
                      : _buildDataTableWithPatients(patients);
                },
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyResult() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Data tidak ditemukan..'),
          const SpaceHeight(20.0),
          if (!isPatientFound)
            Button.filled(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const CreatePatientDialog(),
                );
              },
              label: 'Tambahkan Pasien Baru',
              width: 250,
            ),
        ],
      ),
    );
  }

  Widget _buildDataTableWithPatients(List<MasterPatient> patients) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        scrollDirection: Axis.horizontal,
        child: DataTable(
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
            if (isPatientFound && isSearching)
              const DataColumn(
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(), // Ruang kosong untuk tombol "Reserve"
                ),
              ),
          ],
          rows: patients.map((patient) {
            final formattedBirthDate = DateFormat('dd/MM/yyyy')
                .format(DateTime.parse(patient.birthDate!));
            return DataRow(cells: [
              DataCell(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(patient.name ?? 'No Name',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(patient.gender ?? 'Male'),
                ],
              )),
              DataCell(Center(child: Text(patient.gender ?? '-'))),
              DataCell(
                Center(
                  child: Text(
                    formattedBirthDate,
                  ),
                ),
              ),
              DataCell(Center(child: Text(patient.nik ?? '-'))),
              if (isSearching && isPatientFound)
                DataCell(
                  Button.filled(
                    onPressed: () {
                      //dialog reservasi create
                    },
                    label: 'Reserve',
                    width: null,
                    height: 30,
                  ),
                ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
