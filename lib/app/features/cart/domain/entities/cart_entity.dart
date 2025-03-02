import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';

class CartEntity {
  final ItemEntity item;
  final double qty;
  final double total;

  CartEntity({required this.item, required this.qty, required this.total});
}
