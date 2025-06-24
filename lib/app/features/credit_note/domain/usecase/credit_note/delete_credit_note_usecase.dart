import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/repositories/credit_note_repository.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/params/credit_note_params.dart';

class DeleteCreditNoteUsecase
    extends UseCase<Either<Failure, CreditNoteEntity>, CreditNoteParams> {
  final CreditNoteRepository creditNoteRepository;
  DeleteCreditNoteUsecase({required this.creditNoteRepository});

  @override
  Future<Either<Failure, CreditNoteEntity>> call(
      {required CreditNoteParams params}) async {
    return await creditNoteRepository.deleteCreditNoteEntry(
        creditNoteRequestParams: params);
  }
}
