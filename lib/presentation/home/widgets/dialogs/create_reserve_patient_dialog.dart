import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/core/core.dart';
import 'package:flutter_clinic_app/data/models/request/create_reserve_patient_request_model.dart';
import 'package:flutter_clinic_app/data/models/response/create_reserve_patient_response_model.dart';
import 'package:flutter_clinic_app/data/models/response/master_patient_response.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/create_reserve_patient/create_reserve_patient_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_doctor/data_doctor_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/custom_date_picker.dart';
import '../../../../core/components/custom_dropdown.dart';
import '../../../../data/models/response/master_doctor_response_model.dart';
import '../doctor_dropdown.dart';
import 'create_patient_success_dialog.dart';

class CreateReservePatientDialog extends StatefulWidget {
  final MasterPatient? patient;
  const CreateReservePatientDialog({super.key, this.patient});

  @override
  State<CreateReservePatientDialog> createState() =>
      _CreateReservePatientDialogState();
}

class _CreateReservePatientDialogState
    extends State<CreateReservePatientDialog> {
  //final genders = ['Laki-laki', 'Perempuan'];

  MasterDoctor? selectedDoctor;

  // late final ValueNotifier<bool> switchNotifier;
  // late final ValueNotifier<String?> genderNotifier;
  late final TextEditingController patientNameController;
  late final TextEditingController nikController;
  late final TextEditingController complaintController;
  late final TextEditingController birthDateController;
  late final TextEditingController genderController;
  late DateTime? scheduleTime;
  late DateTime? birthDate;

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    final String formattedDate = formatter.format(date);

    return formattedDate;
  }

  @override
  void initState() {
    // switchNotifier = ValueNotifier(widget.patient == null);
    // genderNotifier = ValueNotifier(widget.patient?.gender);
    patientNameController = TextEditingController(text: widget.patient?.name);
    nikController = TextEditingController(text: widget.patient?.nik);
    complaintController = TextEditingController();
    scheduleTime = DateTime.now();
    birthDate = DateTime.parse('${widget.patient!.birthDate}');
    birthDateController =
        TextEditingController(text: widget.patient?.birthDate);
    genderController = TextEditingController(
      text: widget.patient!.gender,
    );

    context.read<DataDoctorBloc>().add(const DataDoctorEvent.getDoctors());
    super.initState();
  }

  @override
  void dispose() {
    patientNameController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    nikController.dispose();
    complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: context.deviceWidth / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Detail Pasien',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Pasien Baru',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: patientNameController,
                      label: 'Nama Pasien',
                      showLabel: false,
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: genderController,
                      label: 'Jenis Kelamin',
                      showLabel: false,
                    ),
                    const SpaceHeight(24.0),
                    CustomDatePicker(
                      initialDate: birthDate,
                      label: 'Tanggal Lahir',
                      showLabel: false,
                      onDateSelected: (selectedDate) =>
                          birthDate = selectedDate,
                    ),
                    const SpaceHeight(24.0),
                    CustomDatePicker(
                      initialDate: scheduleTime,
                      label: 'Tanggal Rawat Jalan',
                      showLabel: false,
                      onDateSelected: (selectedDate) =>
                          scheduleTime = selectedDate,
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: nikController,
                      label: 'NIK',
                      showLabel: false,
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: complaintController,
                      label: 'Keluhan',
                      showLabel: false,
                      isDescription: true,
                    ),
                  ],
                ),
              ),
            ),
            const SpaceWidth(50.0),
            SingleChildScrollView(
              child: BlocBuilder<DataDoctorBloc, DataDoctorState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox();
                    },
                    loaded: (doctors) {
                      return SizedBox(
                        width: context.deviceWidth / 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Detail Pasien',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                color: AppColors.darkGrey,
                              ),
                            ),
                            const SpaceHeight(40.0),
                            DoctorDropdown(
                              value: selectedDoctor,
                              items: doctors,
                              label: 'Pilih Dokter',
                              onChanged: (value) {
                                setState(() {
                                  selectedDoctor = value;
                                });
                              },
                            ),
                            const SpaceHeight(20.0),
                            SizedBox(
                              height: 405.0,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Assets.images.doctorPlaceholder
                                        .image(width: 140.0),
                                    const SpaceHeight(40.0),
                                    const Text(
                                      'Add Doctor to Patient',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    const SpaceHeight(20.0),
                                    const Text(
                                      'Search and add doctor to this patient.',
                                      style:
                                          TextStyle(color: AppColors.darkGrey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SpaceHeight(20.0),
                            Row(
                              children: [
                                Flexible(
                                  child: Button.outlined(
                                    onPressed: () => context.pop(),
                                    label: 'Cancel',
                                  ),
                                ),
                                const SpaceWidth(10.0),
                                Flexible(
                                  child: BlocConsumer<CreateReservePatientBloc,
                                      CreateReservePatientState>(
                                    listener: (context, state) {
                                      state.maybeWhen(
                                        orElse: () {
                                          return const SizedBox();
                                        },
                                        error: (message) {
                                          context.pop(true);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(message),
                                              backgroundColor: AppColors.red,
                                            ),
                                          );
                                        },
                                        loaded: (responseModel) {
                                          context.pop(true);
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) =>
                                                CreatePatientSuccessDialog(
                                              noAntrian:
                                                  '${responseModel.data!.noAntrian!}',
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () {
                                          return Button.filled(
                                            onPressed: () {
                                              final CreateReservePatientRequestModel
                                                  reservePatient =
                                                  CreateReservePatientRequestModel(
                                                patientId: widget.patient!.id,
                                                scheduleTime:
                                                    formatDate(scheduleTime!),
                                                complaint:
                                                    complaintController.text,
                                                doctorId: selectedDoctor!.id,
                                              );

                                              context
                                                  .read<
                                                      CreateReservePatientBloc>()
                                                  .add(
                                                    CreateReservePatientEvent
                                                        .reserve(
                                                            reservePatient),
                                                  );
                                            },
                                            label: 'Create Reserve',
                                          );
                                        },
                                        loading: () => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
