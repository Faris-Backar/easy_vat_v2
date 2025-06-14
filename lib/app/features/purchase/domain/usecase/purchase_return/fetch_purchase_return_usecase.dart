import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_return_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';

class FetchPurchaseReturnUsecase extends UseCase<
    Either<Failure, List<PurchaseReturnEntity>>, PurchaseParams> {
  final PurchaseRepository purchaseRepository;
  FetchPurchaseReturnUsecase({required this.purchaseRepository});

  @override
  Future<Either<Failure, List<PurchaseReturnEntity>>> call(
      {required PurchaseParams params}) async {
    return await purchaseRepository.fetchPurchaseReturns(params: params);
  }
}
