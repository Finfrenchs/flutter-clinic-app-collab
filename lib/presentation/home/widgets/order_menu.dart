import 'package:flutter/material.dart';
import 'package:flutter_clinic_app/data/models/response/get_medical_records_by_patient_schedule_id_response_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';
import '../../../core/components/components.dart';

class OrderMenu extends StatelessWidget {
  final ServiceAndMedicineItem data;
  const OrderMenu({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final qtyController = TextEditingController(text: '${data.quantity}');
    var formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0,
    );
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: Image.asset(
                    Assets.images.medicine.path,
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  data.serviceName!,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(data.price!.currencyFormatRp),
              ),
            ),
            const SpaceWidth(8),
            SizedBox(
              width: 125.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Remove',
                      style: TextStyle(color: AppColors.red),
                    ),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: ColoredBox(
                          color: AppColors.grey,
                          child: InkWell(
                            // onTap: () {
                            //   final qty = int.parse(qtyController.text) - 1;
                            //   if (qty > 0) {
                            //     qtyController.text = qty.toString();
                            //   }
                            // },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.remove,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SpaceWidth(8.0),
                      Flexible(
                        child: TextFormField(
                          controller: qtyController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SpaceWidth(8.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: ColoredBox(
                          color: AppColors.grey,
                          child: InkWell(
                            // onTap: () {
                            //   final qty = int.parse(qtyController.text) + 1;
                            //   qtyController.text = qty.toString();
                            // },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.add,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    formatter.format(data.price! * data.quantity!),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
