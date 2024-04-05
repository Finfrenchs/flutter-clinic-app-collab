import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/components/components.dart';
import '../../../core/core.dart';
import '../../home/widgets/dialogs/success_payment_dialog.dart';
import '../models/product_model.dart';

enum PaymentType { qris, cash }

class ConfirmPaymentPage extends StatefulWidget {
  const ConfirmPaymentPage({super.key});

  @override
  State<ConfirmPaymentPage> createState() => _ConfirmPaymentPageState();
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> {
  final noteController = TextEditingController();
  final totalPriceController = TextEditingController();
  PaymentType paymentType = PaymentType.qris;
  final products = [
    ProductModel(
      image: Assets.images.products.paracetamol.path,
      name: 'Obat Parasetamol',
      category: 'Obat - obatan',
      price: 5000,
      stock: 10,
    ),
    ProductModel(
      image: Assets.images.products.sarungTanganMedis.path,
      name: 'Sarung tangan medis',
      category: 'Alat sekali pakai',
      price: 12000,
      stock: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            // LEFT CONTENT
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Konfirmasi',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Orders #1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(8.0),
                      const Divider(),
                      const SpaceHeight(24.0),
                      const Row(
                        children: [
                          Text(
                            'Item',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 50.0,
                            child: Text(
                              'Qty',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80.0,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(8),
                      const Divider(),
                      const SpaceHeight(8),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return null;

                          //OrderMenu(data: products[index]),
                        },
                        separatorBuilder: (context, index) =>
                            const SpaceHeight(16.0),
                        itemCount: products.length,
                      ),
                      const SpaceHeight(8),
                      const Divider(),
                      const SpaceHeight(8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(color: AppColors.subtitle),
                          ),
                          Text(
                            'Rp. 120.000',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(24),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: noteController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                hintText: 'Catatan pesanan',
                              ),
                            ),
                          ),
                          const SpaceWidth(12),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              height: 60.0,
                              width: 60.0,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: Assets.icons.delete.svg(
                                colorFilter: const ColorFilter.mode(
                                    AppColors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SpaceHeight(20.0),
                      // Button.filled(
                      //   onPressed: () {},
                      //   label: 'Lanjutkan Pembayaran',
                      // ),
                    ],
                  ),
                ),
              ),
            ),

            // RIGHT CONTENT
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pembayaran',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            '2 opsi pembayaran tersedia',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SpaceHeight(8.0),
                          const Divider(),
                          const SpaceHeight(8.0),
                          const Text(
                            'Metode Bayar',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SpaceHeight(12.0),
                          Row(
                            children: [
                              paymentType == PaymentType.qris
                                  ? Button.filled(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.qris),
                                      label: 'QRIS',
                                    )
                                  : Button.outlined(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.qris),
                                      label: 'QRIS',
                                    ),
                              const SpaceWidth(16.0),
                              paymentType == PaymentType.cash
                                  ? Button.filled(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.cash),
                                      label: 'Cash',
                                      style: paymentType == PaymentType.cash
                                          ? ButtonStyleType.filled
                                          : ButtonStyleType.outlined,
                                    )
                                  : Button.outlined(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.cash),
                                      label: 'Cash',
                                      style: paymentType == PaymentType.cash
                                          ? ButtonStyleType.filled
                                          : ButtonStyleType.outlined,
                                    ),
                            ],
                          ),
                          const SpaceHeight(8.0),
                          const Divider(),
                          const SpaceHeight(8.0),
                          if (paymentType == PaymentType.qris) ...[
                            QrImageView(
                              data: '1234567890',
                              version: QrVersions.auto,
                              size: 300.0,
                            ),
                          ] else if (paymentType == PaymentType.cash) ...[
                            const Text(
                              'Total Bayar',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SpaceHeight(12.0),
                            TextFormField(
                              controller: totalPriceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                hintText: 'Total harga',
                              ),
                            ),
                          ],
                          const SpaceHeight(100.0),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ColoredBox(
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 16.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Button.outlined(
                                  onPressed: () => context.pop(),
                                  label: 'Batalkan',
                                ),
                              ),
                              const SpaceWidth(8.0),
                              Flexible(
                                child: Button.filled(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) =>
                                          const SuccessPaymentDialog(),
                                    );
                                  },
                                  label: 'Bayar',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
