import 'dart:convert';
import 'dart:developer';

import 'package:archive/archive.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_invoice_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_order_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_quotation_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_return_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_order_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_quotation_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:path_provider/path_provider.dart';

class SalesRepositoryImpl extends SalesRepository {
  SalesRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, SalesInvoiceEntity>> getSalesInvoices(
      {required SalesParams salesInvoiceRequestParams,
      bool isCompressedFetch = false}) async {
    try {
      final data = salesInvoiceRequestParams.toJson();

      if (isCompressedFetch) {
        // final dio = Dio();

        // final url =
        // 'https://easyvatapi.microzys.in/Sales/00000000-0000-0000-0000-000000000000?fromDate${DateFormatUtils.getCustomDateFormat(date: salesInvoiceRequestParams.fromDate, formate: "yyyy-MM-dd")}=&toDate=${DateFormatUtils.getCustomDateFormat(date: salesInvoiceRequestParams.toDate, formate: "yyyy-MM-dd")}';
        // log("compressed Url => $url");
        final response = await client.post(
          'Sales/00000000-0000-0000-0000-000000000000?fromDate${DateFormatUtils.getCustomDateFormat(date: salesInvoiceRequestParams.fromDate, formate: "yyyy-MM-dd")}=&toDate=${DateFormatUtils.getCustomDateFormat(date: salesInvoiceRequestParams.toDate, formate: "yyyy-MM-dd")}',
          options: Options(
            responseType: ResponseType.bytes,
            headers: {
              'Accept-Encoding': 'gzip',
            },
          ),
        );
        // final response = await dio.get<List<int>>(
        //   url,
        //   options: Options(
        //     responseType: ResponseType.bytes,
        //     headers: {
        //       'Accept-Encoding': 'gzip',
        //     },
        //   ),
        // );

        if (response.statusCode != 200 ||
            response.data == null ||
            response.data!.isEmpty) {
          return Left(ServerFailure(message: "Some thing went wrong"));
        }
        final decompressedBytes = GZipDecoder().decodeBytes(response.data!);
        final jsonStr = utf8.decode(decompressedBytes);
        final responseJsonList = List<SalesInvoiceListModel>.from(
            json.decode(jsonStr).map((x) => SalesInvoiceListModel.fromJson(x)));
        log("jsonList => $responseJsonList");
        final salesData = SalesInvoiceModel(
            message: "success", status: true, salesList: responseJsonList);
        return Right(salesData);
      } else {
        final response = await client.post(
          UrlResources.getSalesInvoice,
          data: data,
        );

        if (response.statusCode == 200) {
          final salesInvoiceList = SalesInvoiceModel.fromJson(response.data);
          return Right(salesInvoiceList);
        }
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
  Future<Either<Failure, List<SalesOrderEntity>>> getSalesOrders(
      {required SalesParams salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();
      final response = await client.post(
        UrlResources.getSalesOrder,
        data: data,
      );
      if (response.statusCode == 200 && response.data["status"] == true) {
        final salesOrderList = List<SalesOrderModel>.from(response
            .data["salesOrder"]
            .map((x) => SalesOrderModel.fromJson(x)));
        return Right(salesOrderList);
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
  Future<Either<Failure, SalesOrderEntity>> createSalesOrders(
      {required SalesOrderModel salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();

      log("salesorder request => ${jsonEncode(data)}");
      final response = await client.post(
        UrlResources.createSalesOrder,
        data: data,
      );
      if (response.statusCode == 200 && response.data["status"] == true) {
        final salesOrderResult = SalesOrderModel.fromJson(response.data);
        return right(salesOrderResult);
      }
      return left(ServerFailure(message: response.data["message"]));
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
  Future<Either<Failure, bool>> deleteSalesOrders(
      {required SalesOrderModel salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();
      final response = await client.post(
        UrlResources.deleteSalesOrder,
        data: data,
      );
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(true);
      }
      return left(ServerFailure(message: response.data["message"]));
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
  Future<Either<Failure, SalesOrderEntity>> updateSalesOrders(
      {required SalesOrderModel salesOrderRequestParams}) async {
    try {
      final data = salesOrderRequestParams.toJson();
      final response = await client.post(
        UrlResources.updateSalesOrder,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesOrderList = SalesOrderModel.fromJson(response.data);
        return right(salesOrderList);
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

  @override
  Future<Either<Failure, SalesQuotationEntity>> createSalesQuotation(
      {required SalesQuotationModel salesQuotationRequest}) async {
    try {
      final data = salesQuotationRequest.toJson();
      final response = await client.post(
        UrlResources.createSalesQuotation,
        data: data,
      );
      if (response.statusCode == 200 && response.data["status"] == true) {
        final salesQuotationModel = SalesQuotationModel.fromJson(response.data);
        return right(salesQuotationModel);
      } else {
        return left(ServerFailure(message: response.data["message"]));
      }
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
  Future<Either<Failure, bool>> deleteSalesQuotation(
      {required SalesParams salesQuotationRequest}) async {
    try {
      final data = salesQuotationRequest.toJson();
      final response = await client.post(
        UrlResources.deleteSalesQuotation,
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
  Future<Either<Failure, List<SalesQuotationEntity>>> getSalesQuotation(
      {required SalesParams salesQuotationRequest}) async {
    try {
      final response = await client.post(
        UrlResources.getSalesQuotation,
        data: salesQuotationRequest.toJson(),
      );
      if (response.statusCode == 200) {
        if ((response.data["quotation"] as List).isNotEmpty) {
          final salesQuotationList = List<SalesQuotationModel>.from(response
              .data["quotation"]
              .map((x) => SalesQuotationModel.fromJson(x)));
          return Right(salesQuotationList);
        }
        return Right([]);
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
  Future<Either<Failure, SalesQuotationEntity>> updateSalesQuotation(
      {required SalesQuotationModel salesQuotationRequest}) async {
    try {
      final data = salesQuotationRequest.toJson();
      final response = await client.post(
        UrlResources.updateSalesQuotation,
        data: data,
      );
      if (response.statusCode == 200) {
        final salesInvoiceList = SalesQuotationModel.fromJson(response.data);
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
