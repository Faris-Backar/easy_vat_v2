import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class FetchPurchaseUsecase
    extends UseCase<Either<Failure, List<PurchaseEntity>>, NoParams> {
  final PurchaseRepository purchaseRepository;
  FetchPurchaseUsecase({required this.purchaseRepository});

  @override
  Future<Either<Failure, List<PurchaseEntity>>> call(
      {required NoParams params}) async {
    return await purchaseRepository.fetchPurchaseInvoices();
  }
}
