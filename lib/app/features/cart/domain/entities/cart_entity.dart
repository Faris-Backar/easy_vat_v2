import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';

class CartEntity {
  final int cartItemId;
  final ItemEntity item;
  final double qty;
  final double netTotal;
  final double rate;
  final double cost;
  final double priceBeforeTax;
  final String unit;
  final String description;
  final double discount;
  final double tax;
  final double gross;

  CartEntity(
      {required this.cartItemId,
      required this.item,
      required this.qty,
      required this.netTotal,
      required this.rate,
      required this.cost,
      required this.unit,
      required this.description,
      required this.discount,
      required this.tax,
      required this.gross,
      required this.priceBeforeTax});

  CartEntity copyWith(
      {int? cartItemId,
      ItemEntity? item,
      double? qty,
      double? netTotal,
      double? rate,
      double? cost,
      String? unit,
      String? description,
      double? discount,
      double? tax,
      double? gross,
      double? priceBeforeTax}) {
    return CartEntity(
        cartItemId: cartItemId ?? this.cartItemId,
        item: item ?? this.item,
        qty: qty ?? this.qty,
        netTotal: netTotal ?? this.netTotal,
        rate: rate ?? this.rate,
        cost: cost ?? this.cost,
        unit: unit ?? this.unit,
        description: description ?? this.description,
        discount: discount ?? this.discount,
        tax: tax ?? this.tax,
        gross: gross ?? this.gross,
        priceBeforeTax: priceBeforeTax ?? this.priceBeforeTax);
  }

  @override
  String toString() {
    return 'CartEntity(cartItemId: $cartItemId, item: $item, qty: $qty, netTotal: $netTotal, rate: $rate, cost: $cost, priceBeforeTax: $priceBeforeTax, unit: $unit, description: $description, discount: $discount, tax: $tax, gross: $gross)';
  }
}
