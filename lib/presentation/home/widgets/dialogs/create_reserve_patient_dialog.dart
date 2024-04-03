import 'package:flutter/material.dart';
import 'package:flutter_clinic_app/core/core.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/custom_date_picker.dart';
import '../../../../core/components/custom_dropdown.dart';
import '../../../master/models/doctor_model.dart';
import '../../../master/models/pasient_model.dart';
import '../doctor_dropdown.dart';
import 'create_patient_success_dialog.dart';

class CreateReservePatientDialog extends StatefulWidget {
  final PasientModel? patient;
  const CreateReservePatientDialog({super.key, this.patient});

  @override
  State<CreateReservePatientDialog> createState() => _CreateReservePatientDialogState();
}

class _CreateReservePatientDialogState extends State<CreateReservePatientDialog> {
  final genders = ['Laki-laki', 'Perempuan'];
  final doctors = [
    DoctorModel(
      imageUrl:
          'https://cdn.idntimes.com/content-images/duniaku/post/20191101/roronoa-zoro-smile-0078d7e8a33471cfbb5077358d7d21d5.jpg',
      name: 'Dr. John Doe',
      spesialis: 'Cardiologist',
      noReg: 'DOC12345',
      jadwalPraktikBuka: DateTime(2024, 2, 24, 9, 0),
      jadwalPraktikTutup: DateTime(2024, 2, 24, 17, 0),
      ruangan: 'Room 101',
    ),
    DoctorModel(
      imageUrl:
          'https://cdn.idntimes.com/content-images/duniaku/post/20191101/roronoa-zoro-smile-0078d7e8a33471cfbb5077358d7d21d5.jpg',
      name: 'Dr. Jane Smith',
      spesialis: 'Dermatologist',
      noReg: 'DOC54321',
      jadwalPraktikBuka: DateTime(2024, 2, 25, 10, 0),
      jadwalPraktikTutup: DateTime(2024, 2, 25, 18, 0),
      ruangan: 'Room 202',
    ),
    DoctorModel(
      imageUrl:
          'https://cdn.idntimes.com/content-images/duniaku/post/20191101/roronoa-zoro-smile-0078d7e8a33471cfbb5077358d7d21d5.jpg',
      name: 'Dr. Michael Johnson',
      spesialis: 'Pediatrician',
      noReg: 'DOC67890',
      jadwalPraktikBuka: DateTime(2024, 2, 26, 8, 0),
      jadwalPraktikTutup: DateTime(2024, 2, 26, 16, 0),
      ruangan: 'Room 303',
    ),
    DoctorModel(
      imageUrl:
          'https://cdn.idntimes.com/content-images/duniaku/post/20191101/roronoa-zoro-smile-0078d7e8a33471cfbb5077358d7d21d5.jpg',
      name: 'Dr. Emily Williams',
      spesialis: 'Neurologist',
      noReg: 'DOC13579',
      jadwalPraktikBuka: DateTime(2024, 2, 27, 11, 0),
      jadwalPraktikTutup: DateTime(2024, 2, 27, 19, 0),
      ruangan: 'Room 404',
    ),
    DoctorModel(
      imageUrl:
          'https://cdn.idntimes.com/content-images/duniaku/post/20191101/roronoa-zoro-smile-0078d7e8a33471cfbb5077358d7d21d5.jpg',
      name: 'Dr. David Brown',
      spesialis: 'Oncologist',
      noReg: 'DOC24680',
      jadwalPraktikBuka: DateTime(2024, 2, 28, 7, 30),
      jadwalPraktikTutup: DateTime(2024, 2, 28, 15, 30),
      ruangan: 'Room 505',
    ),
  ];

  late final ValueNotifier<bool> switchNotifier;
  late final ValueNotifier<String?> genderNotifier;
  late final TextEditingController patientNameController;
  late final TextEditingController nikController;
  late final TextEditingController complaintController;
  late DateTime? birthdate;
  late DateTime? outpatientDate;

  @override
  void initState() {
    switchNotifier = ValueNotifier(widget.patient == null);
    genderNotifier = ValueNotifier(widget.patient?.jenisKelamin);
    patientNameController = TextEditingController(text: widget.patient?.nama);
    nikController = TextEditingController(text: widget.patient?.nik);
    complaintController = TextEditingController(text: widget.patient?.kelugan);
    birthdate = widget.patient?.tanggalLahir;
    outpatientDate = widget.patient?.tanggalRawatJalan;
    super.initState();
  }

  @override
  void dispose() {
    switchNotifier.dispose();
    patientNameController.dispose();
    genderNotifier.dispose();
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
                    Row(
                      children: [
                        const Text(
                          'Detail Pasien',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Pasien Baru',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                          ),
                        ),
                        const SpaceWidth(20.0),
                        ValueListenableBuilder(
                          valueListenable: switchNotifier,
                          builder: (context, value, _) => Switch(
                            value: value,
                            onChanged: (value) {
                              switchNotifier.value = value;
                              if (value) {
                                genderNotifier.value = null;
                                patientNameController.clear();
                                nikController.clear();
                                complaintController.clear();
                                birthdate = null;
                                outpatientDate = null;
                                setState(() {});
                              }
                            },
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
                    ValueListenableBuilder(
                      valueListenable: genderNotifier,
                      builder: (context, value, _) => CustomDropdown(
                        value: value,
                        items: genders,
                        label: 'Jenis Kelamin',
                        onChanged: (value) => genderNotifier.value = value!,
                        showLabel: false,
                      ),
                    ),
                    const SpaceHeight(24.0),
                    CustomDatePicker(
                      initialDate: birthdate,
                      label: 'Tanggal Lahir',
                      showLabel: false,
                      onDateSelected: (selectedDate) =>
                          birthdate = selectedDate,
                    ),
                    const SpaceHeight(24.0),
                    CustomDatePicker(
                      initialDate: outpatientDate,
                      label: 'Tanggal Rawat Jalan',
                      showLabel: false,
                      onDateSelected: (selectedDate) =>
                          outpatientDate = selectedDate,
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
              child: SizedBox(
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
                      value: null,
                      items: doctors,
                      label: 'Pilih Dokter',
                      onChanged: (value) {},
                    ),
                    const SpaceHeight(20.0),
                    SizedBox(
                      height: 405.0,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.images.doctorPlaceholder.image(width: 140.0),
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
                              style: TextStyle(color: AppColors.darkGrey),
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
                          child: Button.filled(
                            onPressed: () {
                              context.pop();
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) =>
                                    const CreatePatientSuccessDialog(),
                              );
                            },
                            label: 'Create Patient',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
