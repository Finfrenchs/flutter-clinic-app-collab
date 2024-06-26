import 'package:flutter/material.dart';

import 'package:flutter_clinic_app/core/components/spaces.dart';
import 'package:flutter_clinic_app/core/core.dart';
import 'package:flutter_clinic_app/presentation/master/pages/data_doctor_page.dart';
import 'package:flutter_clinic_app/presentation/master/pages/data_service_page.dart';

import '../../../core/components/button_menu.dart';
import '../../home/widgets/build_app_bar.dart';
import 'data_patient_page.dart';
import 'data_schedule_doctor_page.dart';

class MasterPage extends StatefulWidget {
  final void Function(int index) onTap;
  const MasterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Master',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 110.0),
        child: Wrap(
          runSpacing: 16,
          children: [
            ButtonMenu(
              label: 'Data Dokter',
              iconPath: Assets.images.menu.data.path,
              onPressed: () {
                widget.onTap(1);
              },
            ),
            const SpaceWidth(45.0),
            ButtonMenu(
              label: 'Data Pasien',
              iconPath: Assets.images.menu.data.path,
              onPressed: () {
                widget.onTap(2);
              },
            ),
            const SpaceWidth(45.0),
            ButtonMenu(
              label: 'Jadwal Dokter',
              iconPath: Assets.images.menu.jadwal.path,
              onPressed: () {
                widget.onTap(3);
              },
            ),
            const SpaceWidth(45.0),
            ButtonMenu(
              label: 'Layanan',
              iconPath: Assets.images.menu.layanan.path,
              onPressed: () {
                widget.onTap(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
