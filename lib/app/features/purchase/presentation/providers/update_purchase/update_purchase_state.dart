import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_purchase_state.freezed.dart';

@freezed
class UpdatePurchaseState with _$UpdatePurchaseState {
  const factory UpdatePurchaseState.initial() = _Initial;

  const factory UpdatePurchaseState.loaded(
      {required PurchaseInvoiceEntity purchaseInvoiceModel}) = _Loaded;

  const factory UpdatePurchaseState.loading() = _Loading;

  const factory UpdatePurchaseState.error({
    required String message,
  }) = _Error;
}
