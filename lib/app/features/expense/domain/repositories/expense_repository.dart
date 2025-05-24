import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/expense/data/model/expense_request_model.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_params.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, ExpenseEntity>> getExpense(
      {required ExpenseParams expenseRequestParams});
  Future<Either<Failure, ExpenseEntity>> createExpense(
      {required ExpenseRequestModel expenseRequestParams});
  Future<Either<Failure, ExpenseEntity>> updateExpense(
      {required ExpenseRequestModel expenseRequestParams});
  Future<Either<Failure, ExpenseEntity>> deleteExpense(
      {required ExpenseRequestModel expenseRequestParams});
}
