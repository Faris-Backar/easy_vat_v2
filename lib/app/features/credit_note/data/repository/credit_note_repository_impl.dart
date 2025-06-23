import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/credit_note/data/model/credit_note_model.dart';
import 'package:easy_vat_v2/app/features/credit_note/data/model/credit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/repositories/credit_note_repository.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/params/credit_note_params.dart';
import 'package:path_provider/path_provider.dart';

class CreditNoteRepositoryImpl extends CreditNoteRepository {
  CreditNoteRepositoryImpl();

  final client = DioService().dio;
  final dio = Dio();

  @override
  Future<Either<Failure, CreditNoteEntryEntity>> getCreditNoteEntry(
      {required CreditNoteParams creditNoteRequestParams}) async {
    try {
      final data = creditNoteRequestParams.toJson();
      final response =
          await client.post(UrlResources.getCreditNoteEntry, data: data);
      if (response.statusCode == 200) {
        final creditNoteEntryList =
            CreditNoteEntryModel.fromJson(response.data);
        return Right(creditNoteEntryList);
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
  Future<Either<Failure, CreditNoteEntryEntity>> createCreditNoteEntry(
      {required CreditNoteRequestModel creditNoteRequestParams}) async {
    try {
      final data = creditNoteRequestParams.toJson();
      final response =
          await client.post(UrlResources.createCreditNoteEntry, data: data);
      if (response.statusCode == 200) {
        final creditNoteEntryList =
            CreditNoteEntryModel.fromJson(response.data);
        return Right(creditNoteEntryList);
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
  Future<Either<Failure, CreditNoteEntryEntity>> updateCreditNoteEntry(
      {required CreditNoteRequestModel creditNoteRequestParams}) async {
    try {
      final data = creditNoteRequestParams.toJson();
      final response =
          await client.post(UrlResources.updateCreditNoteEntry, data: data);
      if (response.statusCode == 200) {
        final creditNoteEntryList =
            CreditNoteEntryModel.fromJson(response.data);
        return Right(creditNoteEntryList);
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
  Future<Either<Failure, CreditNoteEntryEntity>> deleteCreditNoteEntry(
      {required CreditNoteParams creditNoteRequestParams}) async {
    try {
      final data = creditNoteRequestParams.toJson();
      final response =
          await client.post(UrlResources.deleteCreditNoteEntry, data: data);
      if (response.statusCode == 200) {
        final creditNoteEntryList =
            CreditNoteEntryModel.fromJson(response.data);
        return Right(creditNoteEntryList);
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
  Future<Either<Failure, String>> downloadCreditNoteEntry(
      {required String creditNoteIDPK}) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/expense_$creditNoteIDPK.pdf";

      final response = await client.download(
          UrlResources.downloadCreditNoteEntry, filePath,
          queryParameters: {"CreditNoteIDPK": creditNoteIDPK});

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
