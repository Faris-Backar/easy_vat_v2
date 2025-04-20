import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class CreatePurchaseInvoiceUsecase extends UseCase<
    Either<Failure, PurchaseEntityModel>, PurchaseRequestModel> {
  final PurchaseRepository purchaseRepository;

  CreatePurchaseInvoiceUsecase({required this.purchaseRepository});
  @override
  Future<Either<Failure, PurchaseEntityModel>> call(
      {required PurchaseRequestModel params}) {
    return purchaseRepository.createPurchaseInvoices(params: params);
  }
}
