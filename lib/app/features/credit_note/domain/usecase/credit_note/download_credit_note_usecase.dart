import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/repositories/credit_note_repository.dart';

class DownloadCreditNoteUsecase
    extends UseCase<Either<Failure, String>, String> {
  final CreditNoteRepository creditNoteRepository;
  DownloadCreditNoteUsecase({required this.creditNoteRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await creditNoteRepository.downloadCreditNoteEntry(
        creditNoteIDPK: params);
  }
}
