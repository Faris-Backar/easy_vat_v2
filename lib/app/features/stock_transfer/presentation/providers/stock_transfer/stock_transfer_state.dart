import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_transfer_state.freezed.dart';

@freezed
class StockTransferState with _$StockTransferState {
  const factory StockTransferState(
      {String? stockTransferNo,
      String? refNo,
      required DateTime stockTransferDate,
      String? notes,
      required bool isForUpdate,
      required bool isTaxEnabled,
      StoreEntity? toStore,
      StoreEntity? fromStore}) = _StockTransferState;

  factory StockTransferState.initial() => StockTransferState(
      stockTransferDate: DateTime.now(),
      isForUpdate: false,
      refNo: "",
      notes: "",
      stockTransferNo: "",
      isTaxEnabled: false,
      toStore: null,
      fromStore: null);
}
