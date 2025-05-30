import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_return_state.freezed.dart';

@freezed
class SalesReturnState with _$SalesReturnState {
  const factory SalesReturnState.initial() = _Initial;
  const factory SalesReturnState.loading() = _Loading;
  const factory SalesReturnState.success(List<SalesReturnEntity> salesInvoice) =
      _Success;
  const factory SalesReturnState.failure(String message) = _Failure;
}
