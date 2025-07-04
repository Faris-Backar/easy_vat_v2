import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/dividend/data/model/dividend_request_model.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/repositories/dividend_repository.dart';

class CreateDividendUsecase
    extends UseCase<Either<Failure, DividendEntity>, DividendRequestModel> {
  final DividendRepository dividendRepository;
  CreateDividendUsecase({required this.dividendRepository});

  @override
  Future<Either<Failure, DividendEntity>> call(
      {required DividendRequestModel params}) async {
    return await dividendRepository.createDividend(
        dividendRequestParams: params);
  }
}
