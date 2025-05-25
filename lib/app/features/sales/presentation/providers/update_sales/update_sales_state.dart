import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_sales_state.freezed.dart';

@freezed
class UpdateSalesState with _$UpdateSalesState {
  const factory UpdateSalesState.initial() = _Initial;
  const factory UpdateSalesState.loading() = _Loading;
  const factory UpdateSalesState.success() = _Success;
  const factory UpdateSalesState.failure(String error) = _Failure;
}
