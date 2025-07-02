import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/income/domain/repositories/income_repository.dart';

class DownloadIncomeUsecase extends UseCase<Either<Failure, String>, String> {
  final IncomeRepository incomeRepository;

  DownloadIncomeUsecase({required this.incomeRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await incomeRepository.downloadIncome(incomeIDPK: params);
  }
}
