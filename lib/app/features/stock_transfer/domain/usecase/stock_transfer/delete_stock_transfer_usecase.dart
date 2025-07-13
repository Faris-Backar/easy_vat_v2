import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/repositories/stock_transfer_repository.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/params/stock_transfer_params.dart';

class DeleteStockTransferUsecase
    extends UseCase<Either<Failure, StockTransferEntity>, StockTransferParams> {
  final StockTransferRepository stockTransferRepository;
  DeleteStockTransferUsecase({required this.stockTransferRepository});

  @override
  Future<Either<Failure, StockTransferEntity>> call(
      {required StockTransferParams params}) async {
    return await stockTransferRepository.deleteStockTransfer(
        stockTransferParams: params);
  }
}
