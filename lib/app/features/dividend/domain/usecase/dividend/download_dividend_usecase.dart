import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/repositories/dividend_repository.dart';

class DownloadDividendUsecase extends UseCase<Either<Failure, String>, String> {
  final DividendRepository dividendRepository;

  DownloadDividendUsecase({required this.dividendRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await dividendRepository.downloadDividend(dividendIDPK: params);
  }
}
