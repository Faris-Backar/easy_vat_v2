import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';

class CartEntity {
  final ItemEntity item;
  final double qty;
  final double total;
  final double price;
  final double cost;
  final String unit;
  final String description;

  CartEntity({
    required this.item,
    required this.qty,
    required this.total,
    required this.price,
    required this.cost,
    required this.unit,
    required this.description,
  });
}
