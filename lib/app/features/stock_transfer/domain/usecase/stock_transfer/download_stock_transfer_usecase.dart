import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/repositories/stock_transfer_repository.dart';

class DownloadStockTransferUsecase
    extends UseCase<Either<Failure, String>, String> {
  final StockTransferRepository stockTransferRepository;
  DownloadStockTransferUsecase({required this.stockTransferRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await stockTransferRepository.downloadStockTransfer(
        stockTransferIDPK: params);
  }
}
