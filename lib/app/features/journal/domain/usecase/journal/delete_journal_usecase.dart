import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_entity.dart';
import 'package:easy_vat_v2/app/features/journal/domain/repositories/journal_repository.dart';
import 'package:easy_vat_v2/app/features/journal/domain/usecase/params/journal_params.dart';

class DeleteJournalUsecase
    extends UseCase<Either<Failure, JournalEntity>, JournalParams> {
  final JournalRepository journalRepository;
  DeleteJournalUsecase({required this.journalRepository});

  @override
  Future<Either<Failure, JournalEntity>> call(
      {required JournalParams params}) async {
    return await journalRepository.deleteJournal(journalRequestParams: params);
  }
}
