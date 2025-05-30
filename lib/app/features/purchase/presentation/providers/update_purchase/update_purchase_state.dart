import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_purchase_state.freezed.dart';

@freezed
class UpdatePurchaseState with _$UpdatePurchaseState {
  const factory UpdatePurchaseState.initial() = _Initial;

  const factory UpdatePurchaseState.loaded(
      {required PurchaseEntityModel purchaseRequestModel}) = _Loaded;

  const factory UpdatePurchaseState.loading() = _Loading;

  const factory UpdatePurchaseState.error({
    required String message,
  }) = _Error;
}
