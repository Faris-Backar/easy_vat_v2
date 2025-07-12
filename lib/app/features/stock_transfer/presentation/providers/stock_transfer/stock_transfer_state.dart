import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_cart_entity.dart';
import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_transfer_state.freezed.dart';

@freezed
class StockTransferState with _$StockTransferState {
  const factory StockTransferState(
      {List<StockTransferCartEntity>? itemList,
      required double totalNetCost,
      required double totalSellValue,
      String? stockTransferNo,
      String? refNo,
      DateTime? stockTransferDate,
      String? notes,
      bool? isForUpdate,
      required bool isTaxEnabled,
      StoreEntity? toStore,
      StoreEntity? fromStore}) = _StockTransferState;

  factory StockTransferState.initial() => StockTransferState(
      itemList: null,
      totalNetCost: 0.0,
      totalSellValue: 0.0,
      stockTransferDate: DateTime.now(),
      isForUpdate: false,
      refNo: "",
      notes: "",
      stockTransferNo: "",
      isTaxEnabled: false,
      toStore: null,
      fromStore: null);
}
