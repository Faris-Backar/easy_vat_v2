import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_stock_transfer_state.freezed.dart';

@freezed
class DeleteStockTransferState with _$DeleteStockTransferState {
  const factory DeleteStockTransferState.initial() = _Initial;
  const factory DeleteStockTransferState.loading() = _Loading;
  const factory DeleteStockTransferState.success() = _Success;
  const factory DeleteStockTransferState.failure(String error) = _Failure;
}
