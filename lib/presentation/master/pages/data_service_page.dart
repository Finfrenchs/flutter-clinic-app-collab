import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/presentation/master/bloc/data_layanan_obat/data_layanan_obat_bloc.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/search_input.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../home/widgets/build_app_bar.dart';

class DataServicePage extends StatefulWidget {
  const DataServicePage({super.key});

  @override
  State<DataServicePage> createState() => _DataServicePageState();
}

class _DataServicePageState extends State<DataServicePage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<DataLayananObatBloc>()
        .add(const DataLayananObatEvent.getLayananObat());
  }
  // final products = [
  //   ProductModel(
  //     image: Assets.images.products.paracetamol.path,
  //     name: 'Obat Parasetamol',
  //     category: 'Obat - obatan',
  //     price: 5000,
  //     stock: 10,
  //   ),
  //   ProductModel(
  //     image: Assets.images.products.sarungTanganMedis.path,
  //     name: 'Sarung tangan medis',
  //     category: 'Alat sekali pakai',
  //     price: 12000,
  //     stock: 10,
  //   ),
  // ];
  // late List<ProductModel> searchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Master Layanan & Obat',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Padding(
            padding: EdgeInsets.only(right: context.deviceWidth / 2),
            child: SearchInput(
              controller: searchController,
              onChanged: (value) {
                if (value.length >= 2) {
                  context
                      .read<DataLayananObatBloc>()
                      .add(DataLayananObatEvent.getLayananObatByName(value));
                }
                if (value.isEmpty) {
                  context
                      .read<DataLayananObatBloc>()
                      .add(const DataLayananObatEvent.getLayananObat());
                }
              },
              onTap: () {
                if (searchController.text.isNotEmpty &&
                    searchController.text.length >= 2) {
                  context.read<DataLayananObatBloc>().add(
                      DataLayananObatEvent.getLayananObatByName(
                          searchController.text));
                } else {
                  context
                      .read<DataLayananObatBloc>()
                      .add(const DataLayananObatEvent.getLayananObat());
                }
              },
              hintText: 'Cari Data Item',
            ),
          ),
          const SpaceHeight(40.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.stroke),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<DataLayananObatBloc, DataLayananObatState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox();
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    error: (error) {
                      return Center(
                        child: Text(error),
                      );
                    },
                    loaded: (serviceMedicine) {
                      return DataTable(
                        dataRowMinHeight: 30.0,
                        dataRowMaxHeight: 60.0,
                        columns: [
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Nama Item',
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
                                label: 'Kategori',
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
                                label: 'Harga',
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
                                label: 'Qty',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                        rows: serviceMedicine.isEmpty
                            ? [
                                const DataRow(
                                  cells: [
                                    DataCell(Row(
                                      children: [
                                        Icon(Icons.highlight_off),
                                        SpaceWidth(4.0),
                                        Text('Data tidak ditemukan..'),
                                      ],
                                    )),
                                    DataCell.empty,
                                    DataCell.empty,
                                    DataCell.empty,
                                  ],
                                ),
                              ]
                            : serviceMedicine
                                .map(
                                  (product) => DataRow(cells: [
                                    DataCell(Text(
                                      product.name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataCell(
                                        Center(child: Text(product.category!))),
                                    DataCell(Center(
                                        child: Text('${product.price}'))),
                                    DataCell(
                                      Center(
                                        child: product.quantity == null
                                            ? const Text('-')
                                            : Text('${product.quantity}'),
                                      ),
                                    ),
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
