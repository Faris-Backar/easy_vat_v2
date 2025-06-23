import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/journal/data/model/journal_request_model.dart';
import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_entity.dart';
import 'package:easy_vat_v2/app/features/journal/domain/repositories/journal_repository.dart';

class UpdateJournalUsecase
    extends UseCase<Either<Failure, JournalEntity>, JournalRequestModel> {
  final JournalRepository journalRepository;
  UpdateJournalUsecase({required this.journalRepository});

  @override
  Future<Either<Failure, JournalEntity>> call(
      {required JournalRequestModel params}) async {
    return await journalRepository.updateJournal(journalRequestParams: params);
  }
}
