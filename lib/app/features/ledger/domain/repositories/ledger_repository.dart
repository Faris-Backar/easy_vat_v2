import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/cash_ledger_enitiy.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/sales_ledger_entity.dart';

abstract class LedgerRepository {
  Future<Either<Failure, List<SalesLedgerEntity>>> fetchSalesLedger();
  Future<Either<Failure, List<CashLedgerEntity>>> fetchCashLedger();
}
