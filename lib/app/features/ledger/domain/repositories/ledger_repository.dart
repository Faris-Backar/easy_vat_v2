import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

abstract class LedgerRepository {
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchSalesLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchCashLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchBankLedger();
}
