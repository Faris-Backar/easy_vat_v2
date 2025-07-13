import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';

class GetCashBankLedgerUsecase
    extends UseCase<Either<Failure, List<LedgerAccountEntity>>, NoParams> {
  final LedgerRepository ledgerRepository;

  GetCashBankLedgerUsecase({required this.ledgerRepository});

  @override
  Future<Either<Failure, List<LedgerAccountEntity>>> call(
      {required NoParams params}) async {
    return await ledgerRepository.fetchCashBankLedger();
  }
}
