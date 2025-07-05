import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/journal/data/model/journal_model.dart';
import 'package:easy_vat_v2/app/features/journal/data/model/journal_request_model.dart';
import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_entity.dart';
import 'package:easy_vat_v2/app/features/journal/domain/repositories/journal_repository.dart';
import 'package:easy_vat_v2/app/features/journal/domain/usecase/params/journal_params.dart';
import 'package:path_provider/path_provider.dart';

class JournalRepositoryImpl extends JournalRepository {
  JournalRepositoryImpl();

  final client = DioService().dio;
  final dio = Dio();

  @override
  Future<Either<Failure, JournalEntity>> getJournal(
      {required JournalParams journalRequestParams}) async {
    try {
      final data = journalRequestParams.toJson();
      final responese = await client.post(UrlResources.getJournal, data: data);
      if (responese.statusCode == 200) {
        final journalList = JournalModel.fromJson(responese.data);
        return Right(journalList);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, JournalEntity>> createJournal(
      {required JournalRequestModel journalRequestParams}) async {
    try {
      final data = journalRequestParams.toJson();
      final responese =
          await client.post(UrlResources.createJournal, data: data);
      if (responese.statusCode == 200) {
        final journalList = JournalModel.fromJson(responese.data);
        return Right(journalList);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, JournalEntity>> updateJournal(
      {required JournalRequestModel journalRequestParams}) async {
    try {
      final data = journalRequestParams.toJson();
      final responese =
          await client.post(UrlResources.updateJournal, data: data);
      if (responese.statusCode == 200) {
        final journalList = JournalModel.fromJson(responese.data);
        return Right(journalList);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, JournalEntity>> deleteJournal(
      {required JournalParams journalRequestParams}) async {
    try {
      final data = journalRequestParams.toJson();
      final responese =
          await client.post(UrlResources.deleteJournal, data: data);
      if (responese.statusCode == 200) {
        final journalList = JournalModel.fromJson(responese.data);
        return Right(journalList);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> downloadJournal(
      {required String journalIDPK}) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/expense_$journalIDPK.pdf";

      final response = await client.download(
          UrlResources.downloadJournal, filePath,
          queryParameters: {"JournalIDPK": journalIDPK});

      if (response.statusCode == 200) {
        return right(filePath);
      } else {
        return left(ServerFailure(
            message:
                "Download failed with status code ${response.statusCode}"));
      }
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.message ??
              "Dio error"));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
