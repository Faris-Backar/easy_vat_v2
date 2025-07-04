import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/repositories/dividend_repository.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/usecase/params/dividend_params.dart';

class DeleteDividendUsecase
    extends UseCase<Either<Failure, DividendEntity>, DividendParams> {
  final DividendRepository dividendRepository;
  DeleteDividendUsecase({required this.dividendRepository});

  @override
  Future<Either<Failure, DividendEntity>> call(
      {required DividendParams params}) async {
    return await dividendRepository.deleteDividend(dividendParams: params);
  }
}
