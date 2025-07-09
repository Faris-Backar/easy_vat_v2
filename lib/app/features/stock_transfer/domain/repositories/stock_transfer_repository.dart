import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/data/model/stock_transfer_request_model.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/params/stock_transfer_params.dart';

abstract class StockTransferRepository {
  Future<Either<Failure, StockTransferEntity>> getStockTransfer(
      {required StockTransferParams stockTransferParams});
  Future<Either<Failure, StockTransferEntity>> createStockTransfer(
      {required StockTransferRequestModel stockTransferRequestParams});
  Future<Either<Failure, StockTransferEntity>> updateStockTransfer(
      {required StockTransferRequestModel stockTransferRequestParams});
  Future<Either<Failure, StockTransferEntity>> deleteStockTransfer(
      {required StockTransferParams stockTransferParams});
  Future<Either<Failure, String>> downloadStockTransfer(
      {required String stockTransferIDPK});
}
