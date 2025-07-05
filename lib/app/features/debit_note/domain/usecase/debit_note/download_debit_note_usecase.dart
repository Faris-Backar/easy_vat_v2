import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/repositories/debit_note_repository.dart';

class DownloadDebitNoteUsecase
    extends UseCase<Either<Failure, String>, String> {
  final DebitNoteRepository debitNoteRepository;
  DownloadDebitNoteUsecase({required this.debitNoteRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await debitNoteRepository.downloadDebitNoteEntry(
        debitNoteIDPK: params);
  }
}
