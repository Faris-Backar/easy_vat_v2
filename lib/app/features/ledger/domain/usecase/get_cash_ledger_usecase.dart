import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/cash_ledger_enitiy.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';

class GetCashLedgerUsecase
    extends UseCase<Either<Failure, List<CashLedgerEntity>>, NoParams> {
  final LedgerRepository ledgerRepository;

  GetCashLedgerUsecase({required this.ledgerRepository});
  @override
  Future<Either<Failure, List<CashLedgerEntity>>> call(
      {required NoParams params}) async {
    return await ledgerRepository.fetchCashLedger();
  }
}
