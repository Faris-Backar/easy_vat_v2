import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/income/data/model/income_model.dart';
import 'package:easy_vat_v2/app/features/income/data/model/income_request_model.dart';
import 'package:easy_vat_v2/app/features/income/domain/entities/income_entity.dart';
import 'package:easy_vat_v2/app/features/income/domain/repositories/income_repository.dart';
import 'package:easy_vat_v2/app/features/income/domain/usecase/params/income_params.dart';
import 'package:path_provider/path_provider.dart';

class IncomeRepositoryImpl extends IncomeRepository {
  IncomeRepositoryImpl();

  final client = DioService().dio;
  final dio = Dio();

  @override
  Future<Either<Failure, IncomeEntity>> getIncome(
      {required IncomeParams incomeRequestParams}) async {
    try {
      final data = incomeRequestParams.toJson();
      final response = await client.post(UrlResources.getIncome, data: data);
      if (response.statusCode == 200) {
        final incomeList = IncomeModel.fromJson(response.data);
        return Right(incomeList);
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
  Future<Either<Failure, IncomeEntity>> createIncome(
      {required IncomeRequestModel incomeRequestParams}) async {
    try {
      final data = incomeRequestParams.toJson();
      final response = await client.post(UrlResources.createIncome, data: data);
      if (response.statusCode == 200) {
        final incomeList = IncomeModel.fromJson(response.data);
        return Right(incomeList);
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
  Future<Either<Failure, IncomeEntity>> updateIncome(
      {required IncomeRequestModel incomeRequestParams}) async {
    try {
      final data = incomeRequestParams.toJson();
      final response = await client.post(UrlResources.updateIncome, data: data);
      if (response.statusCode == 200) {
        final incomeList = IncomeModel.fromJson(response.data);
        return Right(incomeList);
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
  Future<Either<Failure, IncomeEntity>> deleteIncome(
      {required IncomeParams incomeRequestParams}) async {
    try {
      final data = incomeRequestParams.toJson();
      final response = await client.post(UrlResources.deleteIncome, data: data);
      if (response.statusCode == 200) {
        final incomeList = IncomeModel.fromJson(response.data);
        return Right(incomeList);
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
  Future<Either<Failure, String>> downloadIncome(
      {required String incomeIDPK}) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/expense_$incomeIDPK.pdf";

      final response = await client.download(
          UrlResources.downloadIncome, filePath,
          queryParameters: {"IncomeIDPK": incomeIDPK});

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
