import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_return_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_purchase_return_state.freezed.dart';

@freezed
class FetchPurchaseReturnState with _$FetchPurchaseReturnState {
  const factory FetchPurchaseReturnState.initial() = _Initial;

  const factory FetchPurchaseReturnState.success(
      {required List<PurchaseReturnEntity> purchaseReturnList,
      required double? total}) = _Success;

  const factory FetchPurchaseReturnState.loading() = _Loading;

  const factory FetchPurchaseReturnState.error({
    required String message,
  }) = _Error;
}
