import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/journal/domain/repositories/journal_repository.dart';

class DownloadJournalUsecase extends UseCase<Either<Failure, String>, String> {
  final JournalRepository journalRepository;
  DownloadJournalUsecase({required this.journalRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await journalRepository.downloadJournal(journalIDPK: params);
  }
}
