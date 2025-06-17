import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/income/data/model/income_request_model.dart';
import 'package:easy_vat_v2/app/features/income/domain/entities/income_entity.dart';
import 'package:easy_vat_v2/app/features/income/domain/usecase/params/income_params.dart';

abstract class IncomeRepository {
  Future<Either<Failure, IncomeEntity>> getIncome(
      {required IncomeParams incomeRequestParams});
  Future<Either<Failure, IncomeEntity>> createIncome(
      {required IncomeRequestModel incomeRequestParams});
  Future<Either<Failure, IncomeEntity>> updateIncome(
      {required IncomeRequestModel incomeRequestParams});
  Future<Either<Failure, IncomeEntity>> deleteIncome(
      {required IncomeParams incomeRequestParams});
  Future<Either<Failure, String>> downloadIncome({required String incomeIDPK});
}
