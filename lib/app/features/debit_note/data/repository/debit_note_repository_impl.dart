import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/debit_note/data/model/debit_note_model.dart';
import 'package:easy_vat_v2/app/features/debit_note/data/model/debit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/repositories/debit_note_repository.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/params/debit_note_params.dart';
import 'package:path_provider/path_provider.dart';

class DebitNoteRepositoryImpl extends DebitNoteRepository {
  DebitNoteRepositoryImpl();

  final client = DioService().dio;
  final dio = Dio();

  @override
  Future<Either<Failure, DebitNoteEntryEntity>> getDebitNoteEntry(
      {required DebitNoteParams debitNoteRequestParams}) async {
    try {
      final data = debitNoteRequestParams.toJson();
      final response =
          await client.post(UrlResources.getDebitNoteEntry, data: data);
      if (response.statusCode == 200) {
        final debitNoteList = DebitNoteEntryModel.fromJson(response.data);
        return Right(debitNoteList);
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
  Future<Either<Failure, DebitNoteEntryEntity>> createDebitNoteEntry(
      {required DebitNoteRequestModel debitNoteRequestParams}) async {
    try {
      final data = debitNoteRequestParams.toJson();
      final response =
          await client.post(UrlResources.createDebitNoteEntry, data: data);
      if (response.statusCode == 200) {
        final debitNoteList = DebitNoteEntryModel.fromJson(response.data);
        return Right(debitNoteList);
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
  Future<Either<Failure, DebitNoteEntryEntity>> updateDebitNoteEntry(
      {required DebitNoteRequestModel debitNoteRequestParams}) async {
    try {
      final data = debitNoteRequestParams.toJson();
      final response =
          await client.post(UrlResources.updateDebitNoteEntry, data: data);
      if (response.statusCode == 200) {
        final debitNoteList = DebitNoteEntryModel.fromJson(response.data);
        return Right(debitNoteList);
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
  Future<Either<Failure, DebitNoteEntryEntity>> deleteDebitNoteEntry(
      {required DebitNoteParams debitNoteRequestParams}) async {
    try {
      final data = debitNoteRequestParams.toJson();
      final response =
          await client.post(UrlResources.deleteDebitNoteEntry, data: data);
      if (response.statusCode == 200) {
        final debitNoteList = DebitNoteEntryModel.fromJson(response.data);
        return Right(debitNoteList);
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
  Future<Either<Failure, String>> downloadDebitNoteEntry(
      {required String debitNoteIDPK}) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/expense_$debitNoteIDPK.pdf";

      final response = await client.download(
          UrlResources.downloadDebitNoteEntry, filePath,
          queryParameters: {"DebitNoteIDPK": debitNoteIDPK});

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
