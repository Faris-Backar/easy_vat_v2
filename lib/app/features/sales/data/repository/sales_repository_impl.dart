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
import 'package:path_provider/path_provider.dart';

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
        if (salesInvoiceList.status == true) {
          return right(salesInvoiceList);
        } else {
          return left(ServerFailure(
              message: salesInvoiceList.message ?? "Something went wrong."));
        }
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
  Future<Either<Failure, SalesReturnEntity>> createSalesreturn(
      {required SalesReturnModel salesReturnRequestParams}) async {
    try {
      final data = salesReturnRequestParams.toJson();
      log("salesorder request => $data");
      final response = await client.post(
        UrlResources.createSalesReturn,
        data: data,
      );
      if (response.statusCode == 200) {
        log("create sales return response => ${response.data}");
        if (response.data["status"] == true) {
          final salesInvoiceList = SalesReturnModel.fromJson(
              (response.data["saleReturnEntry"] as List).first);
          return right(salesInvoiceList);
        }
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
          "fromDate": DateFormatUtils.serverformatDate(
              salesReturnRequestParams.fromDate),
          "toDate":
              DateFormatUtils.serverformatDate(salesReturnRequestParams.toDate),
        },
      );
      if (response.statusCode == 200) {
        final salesReturnList = List<SalesReturnModel>.from(
            response.data.map((x) => SalesReturnModel.fromJson(x)));
        return Right(salesReturnList);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
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
      {required SalesParams salesParams}) async {
    try {
      final data = salesParams.toJson();
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
        if (salesInvoiceList.status == true) {
          return right(salesInvoiceList);
        } else {
          return left(ServerFailure(
              message: salesInvoiceList.message ?? "Something went wrong."));
        }
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
  Future<Either<Failure, bool>> deleteSalesreturn(
      {required SalesParams salesReturnRequestParams}) async {
    try {
      final data = salesReturnRequestParams.toJson();
      final response = await client.post(
        UrlResources.deleteSalesReturn,
        data: data,
      );
      if (response.statusCode == 200) {
        return right(true);
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
  Future<Either<Failure, SalesReturnEntity>> updateSalesreturn(
      {required SalesReturnModel salesReturnRequestParams}) async {
    try {
      final data = salesReturnRequestParams.toJson();
      final response = await client.post(
        UrlResources.updateSalesReturn,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesReturnModel.fromJson(response.data);
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
  Future<Either<Failure, String>> downloadSalesInvoices({
    required String salesIdpk,
  }) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/sales_invoice_$salesIdpk.pdf';

      final response = await client.download(
        UrlResources.downloadSalesInvoice,
        filePath,
        queryParameters: {"SaleIDPK": salesIdpk},
      );

      if (response.statusCode == 200) {
        return right(filePath);
      } else {
        return left(ServerFailure(
          message: "Download failed with status code ${response.statusCode}",
        ));
      }
    } on DioException catch (e) {
      return left(ServerFailure(
        message:
            e.response?.statusMessage?.toString() ?? e.message ?? "Dio error",
      ));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
