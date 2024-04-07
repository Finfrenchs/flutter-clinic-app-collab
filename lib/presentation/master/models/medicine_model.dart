import '../../../core/core.dart';

class MedicineModel {
  final String imageUrl;
  final String name;
  final int price;
  int quantity;

  MedicineModel({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  String get priceFormatted => price.currencyFormatRp;
}

final medicines = [
  MedicineModel(
    imageUrl:
        'https://akcdn.detik.net.id/visual/2015/06/08/6bdf74ae-ea72-4fca-9862-194e55feedb3_169.jpg?w=650',
    name: 'Obat-obatan',
    price: 5500,
  ),
  MedicineModel(
    imageUrl:
        'https://akcdn.detik.net.id/visual/2015/06/08/6bdf74ae-ea72-4fca-9862-194e55feedb3_169.jpg?w=650',
    name: 'Obat-obatan',
    price: 5500,
  ),
  MedicineModel(
    imageUrl:
        'https://akcdn.detik.net.id/visual/2015/06/08/6bdf74ae-ea72-4fca-9862-194e55feedb3_169.jpg?w=650',
    name: 'Obat-obatan',
    price: 5500,
  ),
  MedicineModel(
    imageUrl:
        'https://akcdn.detik.net.id/visual/2015/06/08/6bdf74ae-ea72-4fca-9862-194e55feedb3_169.jpg?w=650',
    name: 'Obat-obatan',
    price: 5500,
  ),
];
