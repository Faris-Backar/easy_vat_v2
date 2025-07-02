import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_income_state.freezed.dart';

@freezed
class DeleteIncomeState with _$DeleteIncomeState {
  const factory DeleteIncomeState.initial() = _Initial;
  const factory DeleteIncomeState.loading() = _Loading;
  const factory DeleteIncomeState.success() = _Success;
  const factory DeleteIncomeState.failure(String error) = _Failure;
}
