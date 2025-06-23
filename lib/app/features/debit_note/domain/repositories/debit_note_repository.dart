import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/debit_note/data/model/debit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/params/debit_note_params.dart';

abstract class DebitNoteRepository {
  Future<Either<Failure, DebitNoteEntryEntity>> getDebitNoteEntry(
      {required DebitNoteParams debitNoteRequestParams});
  Future<Either<Failure, DebitNoteEntryEntity>> createDebitNoteEntry(
      {required DebitNoteRequestModel debitNoteRequestParams});
  Future<Either<Failure, DebitNoteEntryEntity>> updateDebitNoteEntry(
      {required DebitNoteRequestModel debitNoteRequestParams});
  Future<Either<Failure, DebitNoteEntryEntity>> deleteDebitNoteEntry(
      {required DebitNoteParams debitNoteRequestParams});
  Future<Either<Failure, String>> downloadDebitNoteEntry(
      {required String debitNoteIDPK});
}
