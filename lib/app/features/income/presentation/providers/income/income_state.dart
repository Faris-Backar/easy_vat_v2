import 'package:easy_vat_v2/app/features/income/domain/entities/income_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_state.freezed.dart';

@freezed
abstract class IncomeState with _$IncomeState {
  const factory IncomeState.initial() = _Initial;
  const factory IncomeState.loading() = _Loading;
  const factory IncomeState.success(
      {required List<IncomeListEntity> income, double? totalAmount}) = _Success;
  const factory IncomeState.failure(String error) = _Failure;
}
