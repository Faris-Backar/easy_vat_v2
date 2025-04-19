import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_invoice_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_invoice_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_order_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';

class SalesRepositoryImpl extends SalesRepository {
  SalesRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, SalesEntity>> getSalesInvoices(
      {required SalesParams salesInvoiceRequestParams}) async {
    try {
      final data = salesInvoiceRequestParams.toJson();
      log("Date time => $data");
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
  Future<Either<Failure, SalesEntity>> createSalesInvoices(
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
  Future<Either<Failure, SalesEntity>> getSalesOrders(
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
  Future<Either<Failure, SalesEntity>> createSalesOrders(
      {required SalesRequestModel salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();
      final response = await client.post(
        UrlResources.createSalesOrder,
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
  Future<Either<Failure, SalesEntity>> createSalesreturn(
      {required SalesRequestModel salesReturnRequestParams}) async {
    try {
      final data = salesReturnRequestParams.toJson();
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
  Future<Either<Failure, SalesEntity>> getSalesreturn(
      {required SalesParams salesReturnRequestParams}) async {
    try {
      final data = salesReturnRequestParams.toJson();
      log("Date time => $data");
      final response = await client.post(
        UrlResources.getSalesReturn,
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
