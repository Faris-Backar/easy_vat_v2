import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_purchase_state.freezed.dart';

@freezed
class DeletePurchaseState with _$DeletePurchaseState {
  const factory DeletePurchaseState.initial() = _Initial;

  const factory DeletePurchaseState.loaded(
      {required PurchaseEntityModel purchaseRequestModel}) = _Loaded;

  const factory DeletePurchaseState.loading() = _Loading;

  const factory DeletePurchaseState.error({
    required String message,
  }) = _Error;
}
