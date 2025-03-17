import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class PurchaseRepositoryImpl extends PurchaseRepository {
  final Dio client;

  PurchaseRepositoryImpl({required this.client});

  @override
  Future<Either<Failure, List<PurchaseInvoiceEntity>>>
      fetchPurchaseInvoices() async {
    try {
      final response = await client.get(UrlResources.paymentMode);
      if (response.statusCode == 200) {
        List<PurchaseInvoiceEntity> employeeList = (response.data as List)
            .map((json) => PurchaseInvoiceModel.fromJson(json))
            .toList();
        return Right(employeeList);
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
