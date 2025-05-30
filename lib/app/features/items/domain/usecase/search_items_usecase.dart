import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/items/domain/respository/item_repository.dart';

class SearchItemsUsecase
    extends UseCase<Either<Failure, List<ItemEntity>>, String> {
  final ItemRepository itemRepository;

  SearchItemsUsecase({required this.itemRepository});
  @override
  Future<Either<Failure, List<ItemEntity>>> call(
      {required String params}) async {
    return await itemRepository.searchItems(query: params);
  }
}
