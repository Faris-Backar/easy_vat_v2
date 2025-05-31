import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_state.freezed.dart';

@freezed
abstract class ExpenseState with _$ExpenseState {
  const factory ExpenseState.initial() = _Initial;
  const factory ExpenseState.loading() = _Loading;
  const factory ExpenseState.success(List<ExpenseListEntity> expenses) =
      _Success;
  const factory ExpenseState.failure(String error) = _Failure;
}
