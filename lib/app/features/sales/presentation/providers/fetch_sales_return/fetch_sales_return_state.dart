import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_sales_return_state.freezed.dart';

@freezed
class FetchSalesReturnState with _$FetchSalesReturnState {
  const factory FetchSalesReturnState.initial() = _Initial;
  const factory FetchSalesReturnState.loading() = _Loading;
  const factory FetchSalesReturnState.success(
      {required List<SalesReturnEntity> salesReturnList,
      double? totalAmount}) = _Success;
  const factory FetchSalesReturnState.failure(String message) = _Failure;
}
