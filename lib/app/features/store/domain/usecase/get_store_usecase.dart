import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';
import 'package:easy_vat_v2/app/features/store/domain/repositories/store_repository.dart';

class GetStoreUsecase
    extends UseCase<Either<Failure, List<StoreEntity>>, NoParams> {
  final StoreRepository storeRepository;

  GetStoreUsecase({required this.storeRepository});

  @override
  Future<Either<Failure, List<StoreEntity>>> call(
      {required NoParams params}) async {
    return await storeRepository.getStore();
  }
}
