import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
class ItemModel extends ItemEntity with _$ItemModel {
  const factory ItemModel({
    String? itemIdpk,
    String? barcode,
    String? itemCode,
    String? itemName,
    String? description,
    String? unit,
    String? category,
    String? subCategory,
    double? cost,
    double? averageCost,
    double? lastPurchaseCost,
    double? retailRate,
    double? retailPriceLock,
    double? wholeSaleRate,
    double? wholeSalePriceLock,
    double? taxPercentage,
    int? openingStock,
    double? openingCost,
    double? currentStock,
    String? itemNameArabic,
    String? make,
    String? brand,
    String? madeIn,
    String? itemType,
    String? shelfNo,
    String? rackNo,
    int? convention,
    bool? isMaster,
    String? accessLetter,
    bool? quickItem,
    double? maxDiscPerc,
    int? reorderLevel,
    int? reorderQty,
    String? supplierIdfk,
    int? kitchenNo,
    bool? isEditable,
    DateTime? createdDate,
    String? createdBy,
    String? modifiedBy,
    DateTime? updatedDate,
    String? updateGuid,
    bool? isActive,
    bool? enableSerial,
    bool? isScaleItem,
    List<StoreCurrentStock>? storeCurrentStock,
    List<SubItem>? subItems,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}

@freezed
class StoreCurrentStock extends StoreCurrentStockEntity
    with _$StoreCurrentStock {
  const factory StoreCurrentStock({
    String? storeIdpk,
    String? itemIdpk,
    int? currentStock,
    String? companyIdpk,
  }) = _StoreCurrentStock;

  factory StoreCurrentStock.fromJson(Map<String, dynamic> json) =>
      _$StoreCurrentStockFromJson(json);
}

@freezed
class SubItem extends SubItemEntity with _$SubItem {
  const factory SubItem({
    String? itemIdpk,
    String? barcode,
    String? itemName,
    String? description,
    int? convention,
    String? unit,
    double? cost,
    double? retailRate,
    double? retailRateWithTax,
    double? retailPriceLock,
    double? wholeSaleRate,
    double? wholeSalePriceLock,
    double? taxPercentage,
    double? currentStock,
    String? itemNameArabic,
    String? accessLetter,
    String? supplierIdfk,
    bool? isEditable,
  }) = _SubItem;

  factory SubItem.fromJson(Map<String, dynamic> json) =>
      _$SubItemFromJson(json);
}
