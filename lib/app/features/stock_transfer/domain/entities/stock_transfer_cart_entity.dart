import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';

class StockTransferCartEntity {
  final int cartItemId;
  final ItemEntity item;
  final double transferQty;
  final double requestedQty;
  final double netCost;
  final double sellValue;
  final double retailRate;
  final double cost;
  final String unit;
  final String description;

  StockTransferCartEntity(
      {required this.cartItemId,
      required this.item,
      required this.transferQty,
      required this.netCost,
      required this.requestedQty,
      required this.cost,
      required this.unit,
      required this.description,
      required this.retailRate,
      required this.sellValue});

  StockTransferCartEntity copyWith(
      {int? cartItemId,
      ItemEntity? item,
      double? transferQty,
      double? netCost,
      double? retailRate,
      double? cost,
      String? unit,
      String? description,
      double? sellValue,
      double? requestedQty}) {
    return StockTransferCartEntity(
        cartItemId: cartItemId ?? this.cartItemId,
        item: item ?? this.item,
        transferQty: transferQty ?? this.transferQty,
        netCost: netCost ?? this.netCost,
        requestedQty: requestedQty ?? this.requestedQty,
        cost: cost ?? this.cost,
        unit: unit ?? this.unit,
        description: description ?? this.description,
        retailRate: retailRate ?? this.retailRate,
        sellValue: sellValue ?? this.sellValue);
  }

  @override
  String toString() {
    return "StockTransferCartEntity(cartItemId: $cartItemId, item: $item, transferQty: $transferQty, netCost: $netCost, retailRate: $retailRate, Netcost: $netCost, sellValue: $sellValue, unit: $unit, description: $description, requestedQty: $requestedQty)";
  }
}
