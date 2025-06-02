import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_purchase_state.freezed.dart';

@freezed
class DeletePurchaseState with _$DeletePurchaseState {
  const factory DeletePurchaseState.initial() = _Initial;

  const factory DeletePurchaseState.loaded() = _Loaded;

  const factory DeletePurchaseState.loading() = _Loading;

  const factory DeletePurchaseState.error({
    required String message,
  }) = _Error;
}
