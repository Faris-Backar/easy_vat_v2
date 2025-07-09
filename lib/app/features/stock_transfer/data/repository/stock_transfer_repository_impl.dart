import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/data/model/stock_transfer_model.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/data/model/stock_transfer_request_model.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/repositories/stock_transfer_repository.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/params/stock_transfer_params.dart';
import 'package:path_provider/path_provider.dart';

class StockTransferRepositoryImpl extends StockTransferRepository {
  StockTransferRepositoryImpl();

  final client = DioService().dio;
  final dio = Dio();

  @override
  Future<Either<Failure, StockTransferEntity>> getStockTransfer(
      {required StockTransferParams stockTransferParams}) async {
    try {
      final data = stockTransferParams.toJson();
      final response =
          await client.post(UrlResources.getStockTransfer, data: data);
      log("Error: $response");
      if (response.statusCode == 200) {
        final stockTransferList = StockTransferModel.fromJson(response.data);
        return Right(stockTransferList);
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
  Future<Either<Failure, StockTransferEntity>> createStockTransfer(
      {required StockTransferRequestModel stockTransferRequestParams}) async {
    try {
      final data = stockTransferRequestParams.toJson();
      final response =
          await client.post(UrlResources.createStockTransfer, data: data);
      log("Error: $response");
      if (response.statusCode == 200) {
        final stockTransferList = StockTransferModel.fromJson(response.data);
        return Right(stockTransferList);
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
  Future<Either<Failure, StockTransferEntity>> updateStockTransfer(
      {required StockTransferRequestModel stockTransferRequestParams}) async {
    try {
      final data = stockTransferRequestParams.toJson();
      final response =
          await client.post(UrlResources.updateStockTransfer, data: data);
      log("Error: $response");
      if (response.statusCode == 200) {
        final stockTransferList = StockTransferModel.fromJson(response.data);
        return Right(stockTransferList);
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
  Future<Either<Failure, StockTransferEntity>> deleteStockTransfer(
      {required StockTransferParams stockTransferParams}) async {
    try {
      final data = stockTransferParams.toJson();
      final response =
          await client.post(UrlResources.deleteStockTransfer, data: data);
      log("Error: $response");
      if (response.statusCode == 200) {
        final stockTransferList = StockTransferModel.fromJson(response.data);
        return Right(stockTransferList);
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
  Future<Either<Failure, String>> downloadStockTransfer(
      {required String stockTransferIDPK}) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/stockTransfer_$stockTransferIDPK.pdf";

      final response = await client.download(
          UrlResources.downloadStockTransfer, filePath,
          queryParameters: {"StockTransferIDPK": stockTransferIDPK});

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
