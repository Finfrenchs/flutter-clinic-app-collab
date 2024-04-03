import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../../master/models/doctor_model.dart';

class DoctorDropdown extends StatelessWidget {
  final DoctorModel? value;
  final List<DoctorModel> items;
  final String label;
  final Function(DoctorModel? value)? onChanged;

  const DoctorDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<DoctorModel>(
          value: value,
          onChanged: onChanged,
          selectedItemBuilder: (context) => items
              .map((DoctorModel item) => DropdownMenuItem<DoctorModel>(
                    value: item,
                    child: Text(
                      '${item.name} (${item.spesialis})',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ))
              .toList(),
          items: items
              .map((DoctorModel item) => DropdownMenuItem<DoctorModel>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              item.imageUrl,
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SpaceWidth(14.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Nama Dokter'),
                              Text(
                                '${item.name} (${item.spesialis})',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: value?.name ?? label,
          ),
        ),
      ],
    );
  }
}
