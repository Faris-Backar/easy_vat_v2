import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/income/data/model/income_request_model.dart';
import 'package:easy_vat_v2/app/features/income/domain/entities/income_entity.dart';
import 'package:easy_vat_v2/app/features/income/domain/repositories/income_repository.dart';

class CreateIncomeUsecase
    extends UseCase<Either<Failure, IncomeEntity>, IncomeRequestModel> {
  final IncomeRepository incomeRepository;
  CreateIncomeUsecase({required this.incomeRepository});

  @override
  Future<Either<Failure, IncomeEntity>> call(
      {required IncomeRequestModel params}) async {
    return await incomeRepository.createIncome(incomeRequestParams: params);
  }
}
