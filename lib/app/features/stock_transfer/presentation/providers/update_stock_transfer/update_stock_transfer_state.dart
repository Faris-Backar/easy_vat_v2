import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_stock_transfer_state.freezed.dart';

@freezed
class UpdateStockTransferState with _$UpdateStockTransferState {
  const factory UpdateStockTransferState.initial() = _Initial;
  const factory UpdateStockTransferState.loading() = _Loading;
  const factory UpdateStockTransferState.success() = _Success;
  const factory UpdateStockTransferState.failure(String error) = _Failure;
}
