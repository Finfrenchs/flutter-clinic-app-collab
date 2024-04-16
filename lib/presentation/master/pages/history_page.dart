import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/get_payment_detail/get_payment_detail_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/components/components.dart';
import '../../../core/core.dart';
import '../../home/widgets/build_app_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context
        .read<GetPaymentDetailBloc>()
        .add(const GetPaymentDetailEvent.fetch());
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Riwayat Transaksi',
          withSearchInput: true,
          searchController: searchController,
          searchHint: 'Cari  Data',
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
              child: BlocBuilder<GetPaymentDetailBloc, GetPaymentDetailState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox(),
                    error: (message) {
                      return Center(
                        child: Text(message),
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (responseModel) {
                      return DataTable(
                        columns: [
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'No',
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
                                label: 'Metode Bayar',
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
                                label: 'Nominal',
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
                                label: 'Tanggal Transaksi',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          // DataColumn(
                          //   label: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Button.filled(
                          //       onPressed: () {},
                          //       label: 'Layanan',
                          //       width: null,
                          //       color: AppColors.title,
                          //       textColor: AppColors.black.withOpacity(0.5),
                          //       fontSize: 14.0,
                          //     ),
                          //   ),
                          // ),
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
                        ],
                        rows: responseModel.isEmpty
                            ? [
                                const DataRow(
                                  cells: [
                                    DataCell(
                                      Text('Data tidak ditemukan..'),
                                    ),
                                    DataCell(
                                      Text('Data tidak ditemukan..'),
                                    ),
                                    DataCell(
                                      Text('Data tidak ditemukan..'),
                                    ),
                                    DataCell(
                                      Text('Data tidak ditemukan..'),
                                    ),
                                    DataCell(
                                      Text('Data tidak ditemukan..'),
                                    ),
                                    DataCell(
                                      Text('Data tidak ditemukan..'),
                                    ),
                                  ],
                                ),
                              ]
                            : responseModel
                                .asMap()
                                .entries
                                .map(
                                  (entry) => DataRow(cells: [
                                    DataCell(Align(
                                        alignment: Alignment.center,
                                        child: Text('${entry.key + 1}'))),
                                    DataCell(
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          entry.value.patient!.name ?? 'Anonim',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    DataCell(Align(
                                      alignment: Alignment.center,
                                      child: Text(entry.value.patientSchedule!
                                              .paymentMethod ??
                                          ''),
                                    )),
                                    DataCell(Align(
                                      alignment: Alignment.center,
                                      child: Text(entry.value.patientSchedule!
                                          .totalPrice!.currencyFormatRp),
                                    )),
                                    DataCell(Align(
                                      alignment: Alignment.center,
                                      child: Text(formatDate(entry.value
                                          .patientSchedule!.scheduleTime!)),
                                    )),
                                    //DataCell(Text(entry.value.layanan)),
                                    DataCell(Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: ColoredBox(
                                          color: entry.value.patientSchedule!
                                                      .status ==
                                                  'completed'
                                              ? AppColors.green.withOpacity(0.5)
                                              : AppColors.red.withOpacity(0.5),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                                vertical: 8.0),
                                            child: Text(
                                              entry.value.patientSchedule!
                                                          .status ==
                                                      'completed'
                                                  ? 'Lunas'
                                                  : 'Gagal',
                                              style: TextStyle(
                                                color: entry
                                                            .value
                                                            .patientSchedule!
                                                            .status ==
                                                        'completed'
                                                    ? AppColors.green
                                                    : AppColors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                  ]),
                                )
                                .toList(),
                      );
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
