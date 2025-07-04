import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/dividend/data/model/dividend_model.dart';
import 'package:easy_vat_v2/app/features/dividend/data/model/dividend_request_model.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/repositories/dividend_repository.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/usecase/params/dividend_params.dart';
import 'package:path_provider/path_provider.dart';

class DividendRepositoryImpl extends DividendRepository {
  DividendRepositoryImpl();

  final client = DioService().dio;
  final dio = Dio();

  @override
  Future<Either<Failure, DividendEntity>> getDividend(
      {required DividendParams dividendRequestParams}) async {
    try {
      final data = dividendRequestParams.toJson();
      final response = await client.post(UrlResources.getDividend, data: data);

      if (response.statusCode == 200) {
        final dividendList = DividendModel.fromJson(response.data);
        return Right(dividendList);
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
  Future<Either<Failure, DividendEntity>> createDividend(
      {required DividendRequestModel dividendRequestParams}) async {
    try {
      final data = dividendRequestParams.toJson();

      final response =
          await client.post(UrlResources.createDividend, data: data);
      if (response.statusCode == 200) {
        final expense = DividendModel.fromJson(response.data);
        return Right(expense);
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
  Future<Either<Failure, DividendEntity>> updateDividend(
      {required DividendRequestModel dividendRequestParams}) async {
    try {
      final data = dividendRequestParams.toJson();

      final response =
          await client.post(UrlResources.updateDividend, data: data);
      if (response.statusCode == 200) {
        final expense = DividendModel.fromJson(response.data);
        return Right(expense);
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
  Future<Either<Failure, DividendEntity>> deleteDividend(
      {required DividendParams dividendParams}) async {
    try {
      final data = dividendParams.toJson();

      final response =
          await client.post(UrlResources.deleteDividend, data: data);
      if (response.statusCode == 200) {
        final expense = DividendModel.fromJson(response.data);
        return Right(expense);
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
  Future<Either<Failure, String>> downloadDividend(
      {required String dividendIDPK}) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/expense_$dividendIDPK.pdf";

      final response = await client.download(
          UrlResources.downloadDividend, filePath,
          queryParameters: {"DividendIDPK": dividendIDPK});

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
