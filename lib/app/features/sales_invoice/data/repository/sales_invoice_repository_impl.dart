import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/data/model/sales_invoice_model.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/repositories/sales_order_repository.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/usecase/params/sales_invoice_params.dart';

class SalesInvoiceRepositoryImpl extends SalesInvoiceRepository {
  final Dio client;

  SalesInvoiceRepositoryImpl({required this.client});
  @override
  Future<Either<Failure, SalesInvoiceEntity>> getSalesInvoices(
      {required SalesInvoiceParams salesInvoiceRequestParams}) async {
    try {
      final data = salesInvoiceRequestParams.toJson();
      final response = await client.post(
        UrlResources.getSalesInvoice,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return Right(salesInvoiceList);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
