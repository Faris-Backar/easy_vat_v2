import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/items/domain/respository/item_repository.dart';

class GetItemsUsecase
    extends UseCase<Either<Failure, List<ItemEntity>>, NoParams> {
  final ItemRepository itemRepository;

  GetItemsUsecase({required this.itemRepository});
  @override
  Future<Either<Failure, List<ItemEntity>>> call(
      {required NoParams params}) async {
    return await itemRepository.getItems();
  }
}
