import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_request_model.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/params/ledger_params.dart';

abstract class LedgerRepository {
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchSalesLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchCashLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchBankLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchExpenseLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchIncomeLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchCapitalLedger();
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchCashBankLedger();
  Future<Either<Failure, LedgerAccountEntity>> createLedger(
      {required LedgerRequestModel ledgerRequestParams});
  Future<Either<Failure, LedgerAccountEntity>> updateLedger(
      {required LedgerRequestModel ledgerRequestParams});
  Future<Either<Failure, LedgerAccountEntity>> deleteLedger(
      {required LedgerParams ledgerParams});
}
