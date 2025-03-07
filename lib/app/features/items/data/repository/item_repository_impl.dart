import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/features/items/data/model/item_model.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/items/domain/respository/item_repository.dart';

class ItemRepositoryImpl extends ItemRepository {
  final Dio client;

  ItemRepositoryImpl({required this.client});
  @override
  Future<Either<Failure, List<ItemEntity>>> getItems() async {
    try {
      final response = await client.get(UrlResources.getItems);
      if (response.statusCode == 200) {
        List<ItemModel> itemsList = (response.data as List)
            .map((json) => ItemModel.fromJson(json))
            .toList();
        return Right(itemsList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<ItemEntity>>> searchItems(
      {required String query}) async {
    try {
      final response = await client
          .get(UrlResources.searchItems, queryParameters: {"KeyWord": query});
      if (response.statusCode == 200) {
        List<ItemModel> itemsList = (response.data as List)
            .map((json) => ItemModel.fromJson(json))
            .toList();
        return Right(itemsList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}
