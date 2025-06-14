import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_purchase_state.freezed.dart';

@freezed
class UpdatePurchaseState with _$UpdatePurchaseState {
  const factory UpdatePurchaseState.initial() = _Initial;

  const factory UpdatePurchaseState.loaded(
      {required String purchaseIDPK, String? supplierName}) = _Loaded;

  const factory UpdatePurchaseState.loading() = _Loading;

  const factory UpdatePurchaseState.error({
    required String message,
  }) = _Error;
}
