// import 'package:dartz/dartz.dart';
// import 'package:easy_vat_v2/app/core/app_core.dart';
// import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
// import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
// import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';

// class SearchExpenseLedgerUsecase
//     extends UseCase<Either<Failure, List<LedgerAccountEntity>>, String> {
//   final LedgerRepository ledgerRepository;

//   SearchExpenseLedgerUsecase({required this.ledgerRepository});
//   @override
//   Future<Either<Failure, List<LedgerAccountEntity>>> call(
//       {required String params}) async {
//     return await ledgerRepository.searchExpenseLedger(query: params);
//   }
// }
