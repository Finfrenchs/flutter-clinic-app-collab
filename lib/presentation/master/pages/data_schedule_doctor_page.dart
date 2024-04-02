import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_doctor_schedule/data_doctor_schedule_bloc.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../home/widgets/build_app_bar.dart';

class DataScheduleDoctorPage extends StatefulWidget {
  const DataScheduleDoctorPage({super.key});

  @override
  State<DataScheduleDoctorPage> createState() => _DataScheduleDoctorPageState();
}

class _DataScheduleDoctorPageState extends State<DataScheduleDoctorPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context
        .read<DataDoctorScheduleBloc>()
        .add(const DataDoctorScheduleEvent.getScheduleDoctor());
    super.initState();
  }

  int _sortDays(String a, String b) {
    // Mendefinisikan urutan hari yang diinginkan
    Map<String, int> dayOrder = {
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      'Sunday': 7,
    };
    // Mendapatkan indeks masing-masing hari dalam daftar yang diinginkan
    int indexA = dayOrder[a]!;
    int indexB = dayOrder[b]!;
    // Mengembalikan perbandingan berdasarkan indeks
    return indexA.compareTo(indexB);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Master Jadwal Dokter',
          withSearchInput: true,
          searchController: searchController,
          onChanged: (value) {
            if (value.length >= 2) {
              context
                  .read<DataDoctorScheduleBloc>()
                  .add(DataDoctorScheduleEvent.getScheduleDoctorByName(value));
            }
            if (value.isEmpty) {
              context
                  .read<DataDoctorScheduleBloc>()
                  .add(const DataDoctorScheduleEvent.getScheduleDoctor());
            }
          },
          searchTap: () {
            if (searchController.text.isNotEmpty &&
                searchController.text.length >= 2) {
              context.read<DataDoctorScheduleBloc>().add(
                  DataDoctorScheduleEvent.getScheduleDoctorByName(
                      searchController.text));
            } else {
              context
                  .read<DataDoctorScheduleBloc>()
                  .add(const DataDoctorScheduleEvent.getScheduleDoctor());
            }
          },
          searchHint: 'Cari Dokter',
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
              child:
                  BlocBuilder<DataDoctorScheduleBloc, DataDoctorScheduleState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (doctorSchedule) {
                      // Menentukan daftar hari yang akan ditampilkan dalam tabel
                      List<String> days = doctorSchedule
                          .map((schedule) => schedule.day!)
                          .toList();
                      // Menghilangkan duplikat dari daftar hari
                      days = days.toSet().toList();
                      // Mengurutkan daftar hari
                      days.sort((a, b) => _sortDays(a, b));

                      // Mengelompokkan jadwal dokter berdasarkan nama dokter dan hari
                      Map<String, Map<String, String>> groupedSchedules = {};
                      for (var schedule in doctorSchedule) {
                        // Mengecek apakah nama dokter sudah ada dalam map
                        if (!groupedSchedules
                            .containsKey(schedule.doctor!.doctorName)) {
                          // Jika belum, tambahkan nama dokter ke dalam map
                          groupedSchedules[schedule.doctor!.doctorName!] = {
                            for (var day in days)
                              day: '-', // Inisialisasi jadwal dengan '-'
                          };
                        }
                        // Memperbarui jadwal dokter berdasarkan hari
                        groupedSchedules[schedule.doctor!.doctorName]![
                            schedule.day!] = schedule.time ?? '-';
                      }

                      // Membuat DataRow untuk setiap dokter
                      List<DataRow> doctorRows =
                          groupedSchedules.entries.map((entry) {
                        List<DataCell> cells = [
                          // Nama dokter
                          DataCell(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(entry.key), // Nama dokter
                                Text(
                                  'Spesialis: ${doctorSchedule.firstWhere((schedule) => schedule.doctor!.doctorName == entry.key).doctor!.doctorSpecialist}',
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: AppColors.subtitle,
                                  ),
                                ), // Spesialis
                              ],
                            ),
                          ),
                          // Menampilkan jadwal sesuai dengan hari yang tersedia
                          for (String day in days)
                            DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                  groupedSchedules[entry.key]![day] ?? '-'),
                            )),
                        ];
                        return DataRow(cells: cells);
                      }).toList();

                      return DataTable(
                        dataRowMinHeight: 30.0,
                        dataRowMaxHeight: 60.0,
                        columns: [
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Nama Dokter',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          // Menambahkan DataColumn untuk setiap hari
                          for (String day in days)
                            DataColumn(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button.filled(
                                  onPressed: () {},
                                  label: day,
                                  width: null,
                                  color: AppColors.title,
                                  textColor: AppColors.black.withOpacity(0.5),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                        ],
                        rows: doctorRows.isEmpty
                            ? [
                                const DataRow(
                                  cells: [
                                    DataCell(
                                      Row(
                                        children: [
                                          Icon(Icons.highlight_off),
                                          SpaceWidth(4.0),
                                          Text('Data tidak ditemukan..'),
                                        ],
                                      ),
                                    ),
                                    // Empty cells for other columns...
                                  ],
                                ),
                              ]
                            : doctorRows,
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
