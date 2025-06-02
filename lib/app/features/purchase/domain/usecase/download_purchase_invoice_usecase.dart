import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class DownloadPurchaseInvoiceUsecase
    extends UseCase<Either<Failure, String>, String> {
  final PurchaseRepository purchaseRepository;

  DownloadPurchaseInvoiceUsecase({required this.purchaseRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) {
    return purchaseRepository.downloadPurchaseInvoices(purchaseIDPK: params);
  }
}
