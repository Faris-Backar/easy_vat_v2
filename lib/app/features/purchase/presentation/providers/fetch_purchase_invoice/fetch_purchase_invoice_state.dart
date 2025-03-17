import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_purchase_invoice_state.freezed.dart';

@freezed
class FetchPurchaseInvoiceState with _$FetchPurchaseInvoiceState {
  const factory FetchPurchaseInvoiceState.initial() = _Initial;

  const factory FetchPurchaseInvoiceState.loaded(
      {required List<PurchaseInvoiceEntity> purchaseInvoiceList}) = _Loaded;

  const factory FetchPurchaseInvoiceState.loading() = _Loading;

  const factory FetchPurchaseInvoiceState.error({
    required String message,
  }) = _Error;
}
