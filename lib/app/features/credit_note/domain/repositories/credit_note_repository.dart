import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/credit_note/data/model/credit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/params/credit_note_params.dart';

abstract class CreditNoteRepository {
  Future<Either<Failure, CreditNoteEntryEntity>> getCreditNoteEntry(
      {required CreditNoteParams creditNoteRequestParams});
  Future<Either<Failure, CreditNoteEntryEntity>> createCreditNoteEntry(
      {required CreditNoteRequestModel creditNoteRequestParams});
  Future<Either<Failure, CreditNoteEntryEntity>> updateCreditNoteEntry(
      {required CreditNoteRequestModel creditNoteRequestParams});
  Future<Either<Failure, CreditNoteEntryEntity>> deleteCreditNoteEntry(
      {required CreditNoteParams creditNoteRequestParams});
  Future<Either<Failure, String>> downloadCreditNoteEntry(
      {required String creditNoteIDPK});
}
