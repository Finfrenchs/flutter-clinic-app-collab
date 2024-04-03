import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/core.dart';


class CreatePatientSuccessDialog extends StatelessWidget {
  const CreatePatientSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Align(
        alignment: Alignment.topRight,
        child: CloseButton(),
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 10, 40.0, 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(50.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: const Text(
                '19',
                style: TextStyle(
                  fontSize: 120.0,
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SpaceHeight(30.0),
            const Text(
              'Berikut adalah Nomor antrian Anda\nMohon di simpan !',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SpaceHeight(40.0),
            Button.filled(
              width: 120.0,
              onPressed: () {},
              label: 'Print',
            ),
          ],
        ),
      ),
    );
  }
}
