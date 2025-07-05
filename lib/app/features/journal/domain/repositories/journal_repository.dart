import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/journal/data/model/journal_request_model.dart';
import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_entity.dart';
import 'package:easy_vat_v2/app/features/journal/domain/usecase/params/journal_params.dart';

abstract class JournalRepository {
  Future<Either<Failure, JournalEntity>> getJournal(
      {required JournalParams journalRequestParams});
  Future<Either<Failure, JournalEntity>> createJournal(
      {required JournalRequestModel journalRequestParams});
  Future<Either<Failure, JournalEntity>> updateJournal(
      {required JournalRequestModel journalRequestParams});
  Future<Either<Failure, JournalEntity>> deleteJournal(
      {required JournalParams journalRequestParams});
  Future<Either<Failure, String>> downloadJournal(
      {required String journalIDPK});
}
