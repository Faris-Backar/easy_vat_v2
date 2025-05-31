import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_sales_state.freezed.dart';

@freezed
class CreateSalesState with _$CreateSalesState {
  const factory CreateSalesState.initial() = _Initial;
  const factory CreateSalesState.loading() = _Loading;
  const factory CreateSalesState.success(String salesIDPK) = _Success;
  const factory CreateSalesState.failure(String error) = _Failure;
}
