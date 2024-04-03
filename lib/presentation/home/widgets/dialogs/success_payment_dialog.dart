import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/core.dart';

class SuccessPaymentDialog extends StatelessWidget {
  const SuccessPaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Assets.icons.success.svg()),
            const SpaceHeight(26.0),
            const Center(
              child: Text(
                'Pembayaran telah sukses dilakukan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SpaceHeight(80.0),
            const Text('METODE BAYAR'),
            const SpaceHeight(5.0),
            const Text(
              'Tunai',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(18.0),
            const Divider(),
            const SpaceHeight(18.0),
            const Text('TOTAL TAGIHAN'),
            const SpaceHeight(5.0),
            const Text(
              'Rp. 120.00',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(18.0),
            const Divider(),
            const SpaceHeight(18.0),
            const Text('NOMINAL BAYAR'),
            const SpaceHeight(5.0),
            const Text(
              'Rp. 120.00',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(18.0),
            const Divider(),
            const SpaceHeight(18.0),
            const Text('WAKTU PEMBAYARAN'),
            const SpaceHeight(5.0),
            const Text(
              '22 Januari, 11:17',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(50.0),
            Row(
              children: [
                Flexible(
                  child: Button.outlined(
                    onPressed: () {
                      context.pop();
                      context.pop();
                    },
                    label: 'Kembali',
                  ),
                ),
                const SpaceWidth(8.0),
                Flexible(
                  child: Button.filled(
                    onPressed: () {},
                    label: 'Print',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
