import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/core/core.dart';
import 'package:flutter_clinic_app/presentation/home/widgets/dialogs/create_reserve_patient_dialog.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/get_schedule_patient/get_schedule_patient_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/components/components.dart';
import '../../home/widgets/build_app_bar.dart';
import '../../home/widgets/dialogs/create_patient_dialog.dart';
import '../models/pasient_model.dart';
import '../models/pasient_status.dart';
import 'confirm_payment_page.dart';

class SchedulePasientPage extends StatefulWidget {
  const SchedulePasientPage({super.key});

  @override
  State<SchedulePasientPage> createState() => _SchedulePasientPageState();
}

class _SchedulePasientPageState extends State<SchedulePasientPage> {
  final searchController = TextEditingController();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context
        .read<GetSchedulePatientBloc>()
        .add(const GetSchedulePatientEvent.fetchSchedule());
    super.initState();
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy MM dd HH:mm:ss');

    final String formattedDate = formatter.format(date);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Jadwal Pasien',
          withSearchInput: true,
          searchController: searchController,
          onChanged: (value) {
            if (value.length >= 2) {
              context
                  .read<GetSchedulePatientBloc>()
                  .add(GetSchedulePatientEvent.fetchScheduleByNik(value));
            }
            if (value.isEmpty) {
              context
                  .read<GetSchedulePatientBloc>()
                  .add(const GetSchedulePatientEvent.fetchSchedule());
            }
          },
          searchHint: 'Cari Pasien',
        ),
      ),
      endDrawer: Drawer(
        width: context.deviceWidth / 1.25,
        child: const ConfirmPaymentPage(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Row(
            children: [
              Badge(
                backgroundColor: PasientStatus.waiting.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.waiting.value),
              const SpaceWidth(40.0),
              Badge(
                backgroundColor: PasientStatus.processing.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.processing.value),
              const SpaceWidth(40.0),
              Badge(
                backgroundColor: PasientStatus.onHold.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.onHold.value),
              const SpaceWidth(40.0),
              Badge(
                backgroundColor: PasientStatus.completed.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.completed.value),
            ],
          ),
          const SpaceHeight(40.0),
          BlocBuilder<GetSchedulePatientBloc, GetSchedulePatientState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const SizedBox();
                },
                error: (message) {
                  return Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(message),
                    ),
                  );
                },
                loading: () {
                  return const Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                loaded: (schedulePatient) {
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
                                label: 'Tanggal Periksa',
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
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Status',
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
                        rows: schedulePatient.isEmpty
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
                                  ],
                                ),
                              ]
                            : schedulePatient
                                .map(
                                  (patient) => DataRow(cells: [
                                    DataCell(Text(patient.patient!.name!)),
                                    DataCell(Text(patient.complaint ?? '')),
                                    DataCell(Text(patient.patient!.gender!)),
                                    DataCell(Text(patient.patient!.birthDate!)),
                                    DataCell(Text(
                                        formatDate(patient.scheduleTime!))),
                                    DataCell(Text(patient.patient!.nik!)),
                                    DataCell(
                                      _buildStatusBadgeCell(
                                          PasientStatus.fromValue(
                                              patient.status!)),
                                    ),
                                    DataCell(
                                      PopupMenuButton<String>(
                                        offset: const Offset(0, 50),
                                        icon: const Icon(Icons.more_horiz),
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[
                                          for (var status
                                              in PasientStatus.values)
                                            PopupMenuItem<String>(
                                              value: status
                                                  .value, // Gunakan nilai status dari PasientStatus
                                              child:
                                                  _PopupMenuItemValue(status),
                                            ),
                                        ],
                                        onSelected: (String value) {
                                          // Konversi nilai string ke PasientStatus
                                          final selectedStatus =
                                              PasientStatus.fromValue(value);
                                          // Lakukan tindakan sesuai dengan status yang dipilih
                                          // Contoh:
                                          // if (selectedStatus == PasientStatus.waiting) {
                                          //   createPatientTap(patient);
                                          // } else {
                                          //   scaffoldkey.currentState!.openEndDrawer();
                                          // }
                                        },
                                      ),
                                    )
                                  ]),
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

Widget _buildStatusBadge(PasientStatus status) {
  return Row(
    children: [
      Badge(
        backgroundColor: status.color,
        smallSize: 18.0,
      ),
      const SpaceWidth(4.0),
      Text(status.value),
    ],
  );
}

Widget _buildStatusBadgeCell(PasientStatus status) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12.0),
    child: ColoredBox(
      color: status.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Text(
          status.value,
          style: TextStyle(
            color: status.color,
          ),
        ),
      ),
    ),
  );
}

class _PopupMenuItemValue extends StatelessWidget {
  final PasientStatus item;
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
              color: item.color,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
        ),
        const SpaceWidth(4.0),
        Text(item.value),
      ],
    );
  }
}
