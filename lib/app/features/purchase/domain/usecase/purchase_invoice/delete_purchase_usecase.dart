import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';

class DeletePurchaseInvoiceUsecase
    extends UseCase<Either<Failure, PurchaseInvoiceEntity>, PurchaseParams> {
  final PurchaseRepository purchaseRepository;
  DeletePurchaseInvoiceUsecase({required this.purchaseRepository});

  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> call(
      {required PurchaseParams params}) async {
    return await purchaseRepository.deletePurchaseInvoices(params: params);
  }
}
