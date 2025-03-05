import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/sales_ledger_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';

class GetSalesLedgerUsecase
    extends UseCase<Either<Failure, List<SalesLedgerEntity>>, NoParams> {
  final LedgerRepository ledgerRepository;

  GetSalesLedgerUsecase({required this.ledgerRepository});
  @override
  Future<Either<Failure, List<SalesLedgerEntity>>> call(
      {required NoParams params}) async {
    return await ledgerRepository.fetchSalesLedger();
  }
}
