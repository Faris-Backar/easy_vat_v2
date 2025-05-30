import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_expense_state.freezed.dart';

@freezed
class UpdateExpenseState with _$UpdateExpenseState {
  const factory UpdateExpenseState.initial() = _Initial;
  const factory UpdateExpenseState.loading() = _Loading;
  const factory UpdateExpenseState.success() = _Success;
  const factory UpdateExpenseState.failure(String error) = _Failure;
}
