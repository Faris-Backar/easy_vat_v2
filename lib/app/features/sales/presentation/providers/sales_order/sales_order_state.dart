import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_order_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_state.freezed.dart';

@freezed
class SalesOrderState with _$SalesOrderState {
  const factory SalesOrderState.initial() = _Initial;
  const factory SalesOrderState.loading() = _Loading;
  const factory SalesOrderState.success(
      {required List<SalesOrderEntity> salesOrderList,
      double? totalAmount}) = _Success;
  const factory SalesOrderState.failure(String message) = _Failure;
}
