import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';

class CartEntity {
  final int cartItemId;
  final ItemEntity item;
  final double qty;
  final double total;
  final double price;
  final double cost;
  final String unit;
  final String description;
  final double discount;
  final double tax;

  CartEntity(
      {required this.cartItemId,
      required this.item,
      required this.qty,
      required this.total,
      required this.price,
      required this.cost,
      required this.unit,
      required this.description,
      required this.discount,
      required this.tax});

  CartEntity copyWith({
    int? cartItemId,
    ItemEntity? item,
    double? qty,
    double? total,
    double? price,
    double? cost,
    String? unit,
    String? description,
    double? discount,
    double? tax,
  }) {
    return CartEntity(
        cartItemId: cartItemId ?? this.cartItemId,
        item: item ?? this.item,
        qty: qty ?? this.qty,
        total: total ?? this.total,
        price: price ?? this.price,
        cost: cost ?? this.cost,
        unit: unit ?? this.unit,
        description: description ?? this.description,
        discount: discount ?? this.discount,
        tax: tax ?? this.tax);
  }
}
