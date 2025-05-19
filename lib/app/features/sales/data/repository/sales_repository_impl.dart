import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_invoice_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_order_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_return_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';

class SalesRepositoryImpl extends SalesRepository {
  SalesRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, SalesInvoiceEntity>> getSalesInvoices(
      {required SalesParams salesInvoiceRequestParams}) async {
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

  @override
  Future<Either<Failure, SalesInvoiceEntity>> createSalesInvoices(
      {required SalesRequestModel salesInvoiceRequestParams}) async {
    try {
      final data = salesInvoiceRequestParams.toJson();
      final response = await client.post(
        UrlResources.createSalesInvoice,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return right(salesInvoiceList);
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceEntity>> getSalesOrders(
      {required SalesParams salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();
      log("Date time => $data");
      final response = await client.post(
        UrlResources.getSalesOrder,
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

  @override
  Future<Either<Failure, SalesInvoiceEntity>> createSalesOrders(
      {required SalesOrderModel salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();

      log("salesorder request => ${jsonEncode(data)}");
      final response = await client.post(
        UrlResources.createSalesOrder,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesOrderResult = SalesInvoiceModel.fromJson(response.data);
        if (salesOrderResult.status == true) {
          return right(salesOrderResult);
        }
        return left(ServerFailure(message: salesOrderResult.message ?? ""));
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceEntity>> createSalesreturn(
      {required SalesReturnModel salesReturnRequestParams}) async {
    try {
      final data = salesReturnRequestParams.toJson();
      log("salesorder request => $data");
      final response = await client.post(
        UrlResources.createSalesReturn,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return right(salesInvoiceList);
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SalesReturnEntity>>> getSalesreturn(
      {required SalesParams salesReturnRequestParams}) async {
    try {
      final response = await client.get(
        UrlResources.getSalesReturn,
        queryParameters: {
          "fromDate": DateFormatUtils.getDateOnly(
              date: salesReturnRequestParams.fromDate),
          "toDate": DateFormatUtils.getDateOnly(
              date: salesReturnRequestParams.toDate),
        },
      );
      log("salesreturn url => ${response.requestOptions.uri}");
      if (response.statusCode == 200) {
        final salesReturnList = List<SalesReturnModel>.from(
            response.data.map((x) => SalesReturnModel.fromJson(x)));
        log("salesreturn list => $salesReturnList");
        return Right(salesReturnList);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      log("salesreturn error => ${e.toString()}");
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      log("salesreturn error => ${e.toString()}");
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceEntity>> deleteSalesInvoices(
      {required SalesRequestModel salesInvoiceRequestParams}) async {
    try {
      final data = salesInvoiceRequestParams.toJson();
      final response = await client.post(
        UrlResources.deleteSalesInvoice,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return right(salesInvoiceList);
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceEntity>> updateSalesInvoices(
      {required SalesRequestModel salesInvoiceRequestParams}) async {
    try {
      final data = salesInvoiceRequestParams.toJson();
      final response = await client.post(
        UrlResources.updateSalesInvoice,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return right(salesInvoiceList);
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceEntity>> deleteSalesOrders(
      {required SalesOrderModel salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();
      final response = await client.post(
        UrlResources.deleteSalesOrder,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return right(salesInvoiceList);
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceEntity>> updateSalesOrders(
      {required SalesOrderModel salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();
      final response = await client.post(
        UrlResources.updateSalesOrder,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return right(salesInvoiceList);
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceEntity>> deleteSalesreturn(
      {required SalesReturnModel salesReturnRequestParams}) async {
    try {
      final data = salesReturnRequestParams.toJson();
      final response = await client.post(
        UrlResources.deleteSalesReturn,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return right(salesInvoiceList);
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceEntity>> updateSalesreturn(
      {required SalesReturnModel salesReturnRequestParams}) async {
    try {
      final data = salesReturnRequestParams.toJson();
      final response = await client.post(
        UrlResources.updateSalesReturn,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
        return right(salesInvoiceList);
      }
      return left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
