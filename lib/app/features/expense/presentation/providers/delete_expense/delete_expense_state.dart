import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_expense_state.freezed.dart';

@freezed
class DeleteExpenseState with _$DeleteExpenseState {
  const factory DeleteExpenseState.initial() = _Initial;
  const factory DeleteExpenseState.loading() = _Loading;
  const factory DeleteExpenseState.success() = _Success;
  const factory DeleteExpenseState.failure(String error) = _Failure;
}
