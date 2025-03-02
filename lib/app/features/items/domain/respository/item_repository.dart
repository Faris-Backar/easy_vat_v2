import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';

abstract class ItemRepository {
  Future<Either<Failure, List<ItemEntity>>> getItems();
  Future<Either<Failure, List<ItemEntity>>> searchItems(
      {required String query});
}
