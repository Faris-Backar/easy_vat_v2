import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/data/model/stock_transfer_request_model.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/repositories/stock_transfer_repository.dart';

class CreateStockTransferUsecase extends UseCase<
    Either<Failure, StockTransferEntity>, StockTransferRequestModel> {
  final StockTransferRepository stockTransferRepository;
  CreateStockTransferUsecase({required this.stockTransferRepository});

  @override
  Future<Either<Failure, StockTransferEntity>> call(
      {required StockTransferRequestModel params}) async {
    return await stockTransferRepository.createStockTransfer(
        stockTransferRequestParams: params);
  }
}
