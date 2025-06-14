import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_expense_state.freezed.dart';

@freezed
class CreateExpenseState with _$CreateExpenseState {
  const factory CreateExpenseState.initial() = _Initial;
  const factory CreateExpenseState.loading() = _Loading;
  const factory CreateExpenseState.success(String expenseIDPK) = _Success;
  const factory CreateExpenseState.failure(String error) = _Failure;
}
