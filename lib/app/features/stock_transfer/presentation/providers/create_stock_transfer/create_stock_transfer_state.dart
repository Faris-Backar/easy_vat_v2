import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_stock_transfer_state.freezed.dart';

@freezed
class CreateStockTransferState with _$CreateStockTransferState {
  const factory CreateStockTransferState.initial() = _Initial;
  const factory CreateStockTransferState.loading() = _Loading;
  const factory CreateStockTransferState.success(String stockTransferIDPK) =
      _Success;
  const factory CreateStockTransferState.failure(String error) = _Failure;
}
