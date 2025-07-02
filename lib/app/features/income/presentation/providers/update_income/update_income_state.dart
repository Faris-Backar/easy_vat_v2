import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_income_state.freezed.dart';

@freezed
class UpdateIncomeState with _$UpdateIncomeState {
  const factory UpdateIncomeState.initial() = _Initial;
  const factory UpdateIncomeState.loading() = _Loading;
  const factory UpdateIncomeState.success() = _Success;
  const factory UpdateIncomeState.failure(String error) = _Failure;
}
