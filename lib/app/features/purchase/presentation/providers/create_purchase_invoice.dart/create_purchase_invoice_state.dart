import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_purchase_invoice_state.freezed.dart';

@freezed
class CreatePurchaseInvoiceState with _$CreatePurchaseInvoiceState {
  const factory CreatePurchaseInvoiceState.initial() = _Initial;

  const factory CreatePurchaseInvoiceState.loaded(
      {required PurchaseResponseModel purchaseInvoiceList}) = _Loaded;

  const factory CreatePurchaseInvoiceState.loading() = _Loading;

  const factory CreatePurchaseInvoiceState.error({
    required String message,
  }) = _Error;
}
