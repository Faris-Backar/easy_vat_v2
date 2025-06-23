import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/debit_note/data/model/debit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/repositories/debit_note_repository.dart';

class CreateDebitNoteUsecase extends UseCase<
    Either<Failure, DebitNoteEntryEntity>, DebitNoteRequestModel> {
  final DebitNoteRepository debitNoteRepository;
  CreateDebitNoteUsecase({required this.debitNoteRepository});

  @override
  Future<Either<Failure, DebitNoteEntryEntity>> call(
      {required DebitNoteRequestModel params}) async {
    return await debitNoteRepository.createDebitNoteEntry(
        debitNoteRequestParams: params);
  }
}
