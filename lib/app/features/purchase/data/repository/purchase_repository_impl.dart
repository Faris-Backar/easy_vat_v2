import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_return_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_return_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';
import 'package:path_provider/path_provider.dart';

class PurchaseRepositoryImpl extends PurchaseRepository {
  PurchaseRepositoryImpl();

  final client = DioService().dio;

  // ------------------- PURCHASE INVOICE -------------------

  @override
  Future<Either<Failure, List<PurchaseInvoiceEntity>>> fetchPurchaseInvoices(
      {required PurchaseParams params}) async {
    try {
      final response = await client.post(UrlResources.getPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        if (response.data["status"] == true) {
          List<PurchaseInvoiceEntity> purchaseInvoiceList =
              (response.data["purchase"] as List)
                  .map((json) => PurchaseInvoiceModel.fromJson(json))
                  .toList();
          return Right(purchaseInvoiceList);
        } else {
          return Left(ServerFailure(message: response.data["message"]));
        }
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      log("fetch error => ${e.response?.data ?? e.error ?? ""}");
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> createPurchaseInvoices(
      {required PurchaseInvoiceModel params}) async {
    try {
      final data = params.toJson();
      log("purchase invoice dat => ${json.encode(data)}");
      final response =
          await client.post(UrlResources.createPurchaseInvoice, data: data);
      if (response.statusCode == 200) {
        PurchaseInvoiceEntity purchaseResponseModel =
            PurchaseInvoiceModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> updatePurchaseInvoices(
      {required PurchaseInvoiceModel params}) async {
    try {
      final response = await client.post(UrlResources.updatePurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseInvoiceEntity purchaseResponseModel =
            PurchaseInvoiceModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> deletePurchaseInvoices(
      {required PurchaseParams params}) async {
    try {
      final response = await client.post(UrlResources.deletePurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseInvoiceEntity purchaseResponseModel =
            PurchaseInvoiceModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> downloadPurchaseInvoices(
      {required String purchaseIDPK}) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/sales_invoice_$purchaseIDPK.pdf';

      final response = await client.download(
        UrlResources.downloadSalesInvoice,
        filePath,
        queryParameters: {"purchaseIDPK": purchaseIDPK},
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

  // ------------------- PURCHASE ORDER -------------------

  @override
  Future<Either<Failure, List<PurchaseInvoiceEntity>>>
      fetchPurchaseOrders() async {
    try {
      final response = await client.get(UrlResources.getPurchaseInvoice);
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
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> createPurchaseOrders(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseInvoiceEntity purchaseResponseModel =
            PurchaseInvoiceModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> updatePurchaseOrders(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseInvoiceEntity purchaseResponseModel =
            PurchaseInvoiceModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> deletePurchaseOrders(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.deletePurchaseOrder,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseInvoiceEntity purchaseResponseModel =
            PurchaseInvoiceModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ------------------- PURCHASE RETURN -------------------

  @override
  Future<Either<Failure, List<PurchaseReturnEntity>>> fetchPurchaseReturns(
      {required PurchaseParams params}) async {
    try {
      final response = await client.post(UrlResources.getPurchaseReturn,
          data: params.toJson());
      if (response.statusCode == 200) {
        List<PurchaseReturnEntity> purchaseReturnList = (response.data as List)
            .map((json) => PurchaseReturnModel.fromJson(json))
            .toList();
        return Right(purchaseReturnList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      log("fetch error => ${e.response?.data ?? e.error ?? ""}");
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseReturnEntity>> createPurchaseReturns(
      {required PurchaseReturnModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseReturn,
          data: params.toJson());

      if (response.statusCode == 200) {
        if (response.data["status"] == true) {
          List<PurchaseReturnEntity> purchaseResponseModel =
              (response.data["purchaseReturnEntryDetails"] as List)
                  .map((json) => PurchaseReturnModel.fromJson(json))
                  .toList();
          return Right(purchaseResponseModel.first);
        }
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseReturnEntity>> updatePurchaseReturns(
      {required PurchaseReturnModel params}) async {
    try {
      final response = await client.post(UrlResources.updatePurchaseReturn,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseReturnEntity purchaseResponseModel =
            PurchaseReturnModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deletePurchaseReturns(
      {required PurchaseParams params}) async {
    try {
      final response = await client.post(UrlResources.deletePurchaseReturn,
          data: params.toJson());
      if (response.statusCode == 200) {
        if (response.data["status"] == true) {
          return Right(true);
        }
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
