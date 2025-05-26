import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_sales_state.freezed.dart';

@freezed
class DeleteSalesState with _$DeleteSalesState {
  const factory DeleteSalesState.initial() = _Initial;
  const factory DeleteSalesState.loading() = _Loading;
  const factory DeleteSalesState.success() = _Success;
  const factory DeleteSalesState.failure(String error) = _Failure;
}
