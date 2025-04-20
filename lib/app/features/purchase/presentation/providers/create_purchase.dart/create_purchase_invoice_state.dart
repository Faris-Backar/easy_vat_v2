import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_purchase_invoice_state.freezed.dart';

@freezed
class CreatePurchaseState with _$CreatePurchaseState {
  const factory CreatePurchaseState.initial() = _Initial;

  const factory CreatePurchaseState.loaded(
      {required PurchaseEntityModel purchaseRequestModel}) = _Loaded;

  const factory CreatePurchaseState.loading() = _Loading;

  const factory CreatePurchaseState.error({
    required String message,
  }) = _Error;
}
