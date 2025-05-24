import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/expense/data/model/expense_request_model.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';
import 'package:easy_vat_v2/app/features/expense/domain/repositories/expense_repository.dart';
import 'package:dartz/dartz.dart';

class FetchExpenseUsecase
    extends UseCase<Either<Failure, ExpenseEntity>, ExpenseRequestModel> {
  final ExpenseRepository expenseRepository;
  FetchExpenseUsecase({required this.expenseRepository});

  @override
  Future<Either<Failure, ExpenseEntity>> call(
      {required ExpenseRequestModel params}) async {
    return await expenseRepository.updateExpense(expenseRequestParams: params);
  }
}
