import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_request_model.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';

class CreateLedgerUsecase
    extends UseCase<Either<Failure, LedgerAccountEntity>, LedgerRequestModel> {
  final LedgerRepository ledgerRepository;
  CreateLedgerUsecase({required this.ledgerRepository});

  @override
  Future<Either<Failure, LedgerAccountEntity>> call(
      {required LedgerRequestModel params}) async {
    return await ledgerRepository.createLedger(ledgerRequestParams: params);
  }
}
