import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_income_state.freezed.dart';

@freezed
class CreateIncomeState with _$CreateIncomeState {
  const factory CreateIncomeState.initial() = _Initial;
  const factory CreateIncomeState.loading() = _Loading;
  const factory CreateIncomeState.success(String incomeIDPK) = _Success;
  const factory CreateIncomeState.failure(String error) = _Failure;
}
