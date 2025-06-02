import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class CreatePurchaseInvoiceUsecase extends UseCase<
    Either<Failure, PurchaseInvoiceEntity>, PurchaseInvoiceModel> {
  final PurchaseRepository purchaseRepository;

  CreatePurchaseInvoiceUsecase({required this.purchaseRepository});
  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> call(
      {required PurchaseInvoiceModel params}) {
    return purchaseRepository.createPurchaseInvoices(params: params);
  }
}
