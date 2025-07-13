import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_stock_transfer_state.freezed.dart';

@freezed
abstract class FetchStockTransferState with _$FetchStockTransferState {
  const factory FetchStockTransferState.initial() = _Initial;
  const factory FetchStockTransferState.loading() = _Loading;
  const factory FetchStockTransferState.success(
      {required List<StockTransferListEntity> stockTransfer,
      double? totalAmount}) = _Success;
  const factory FetchStockTransferState.error({required String message}) =
      _Error;
}
