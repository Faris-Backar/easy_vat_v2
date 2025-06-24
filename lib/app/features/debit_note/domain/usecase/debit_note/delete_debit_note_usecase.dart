import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/repositories/debit_note_repository.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/params/debit_note_params.dart';

class DeleteDebitNoteUsecase
    extends UseCase<Either<Failure, DebitNoteEntity>, DebitNoteParams> {
  final DebitNoteRepository debitNoteRepository;
  DeleteDebitNoteUsecase({required this.debitNoteRepository});

  @override
  Future<Either<Failure, DebitNoteEntity>> call(
      {required DebitNoteParams params}) async {
    return await debitNoteRepository.deleteDebitNoteEntry(
        debitNoteRequestParams: params);
  }
}
