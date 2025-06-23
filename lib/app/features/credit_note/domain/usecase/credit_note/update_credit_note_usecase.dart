import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/credit_note/data/model/credit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/repositories/credit_note_repository.dart';

class UpdateCreditNoteUsecase extends UseCase<
    Either<Failure, CreditNoteEntryEntity>, CreditNoteRequestModel> {
  final CreditNoteRepository creditNoteRepository;
  UpdateCreditNoteUsecase({required this.creditNoteRepository});

  @override
  Future<Either<Failure, CreditNoteEntryEntity>> call(
      {required CreditNoteRequestModel params}) async {
    return await creditNoteRepository.updateCreditNoteEntry(
        creditNoteRequestParams: params);
  }
}
