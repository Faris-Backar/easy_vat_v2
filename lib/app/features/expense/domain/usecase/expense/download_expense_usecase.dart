import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/expense/domain/repositories/expense_repository.dart';

class DownloadExpenseUsecase extends UseCase<Either<Failure, String>, String> {
  final ExpenseRepository expenseRepository;

  DownloadExpenseUsecase({required this.expenseRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await expenseRepository.downloadExpense(expenseIDPK: params);
  }
}
