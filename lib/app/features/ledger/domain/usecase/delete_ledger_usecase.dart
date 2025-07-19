import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/params/ledger_params.dart';

class DeleteLedgerUsecase
    extends UseCase<Either<Failure, LedgerAccountEntity>, LedgerParams> {
  final LedgerRepository ledgerRepository;
  DeleteLedgerUsecase({required this.ledgerRepository});

  @override
  Future<Either<Failure, LedgerAccountEntity>> call(
      {required LedgerParams params}) async {
    return await ledgerRepository.deleteLedger(ledgerParams: params);
  }
}
