import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class PurchaseRepositoryImpl extends PurchaseRepository {
  PurchaseRepositoryImpl();

  final client = DioService().dio;

  @override
  Future<Either<Failure, List<PurchaseEntity>>> fetchPurchaseInvoices() async {
    try {
      final response = await client.get(UrlResources.getPurchaseInvoice);
      if (response.statusCode == 200) {
        List<PurchaseEntity> employeeList = (response.data as List)
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

  @override
  Future<Either<Failure, PurchaseEntityModel>> createPurchaseInvoices(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, PurchaseEntityModel>> updatePurchaseInvoices(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, PurchaseEntityModel>> deletePurchaseInvoices(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.deletePurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<PurchaseEntity>>> fetchPurchaseOrders() async {
    try {
      final response = await client.get(UrlResources.getPurchaseInvoice);
      if (response.statusCode == 200) {
        List<PurchaseEntity> employeeList = (response.data as List)
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

  @override
  Future<Either<Failure, PurchaseEntityModel>> createPurchaseOrders(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, PurchaseEntityModel>> updatePurchaseOrders(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, PurchaseEntityModel>> deletePurchaseOrders(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.deletePurchaseOrder,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<PurchaseEntity>>> fetchPurchaseReturns() async {
    try {
      final response = await client.get(UrlResources.getPurchaseInvoice);
      if (response.statusCode == 200) {
        List<PurchaseEntity> employeeList = (response.data as List)
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

  @override
  Future<Either<Failure, PurchaseEntityModel>> createPurchaseReturns(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, PurchaseEntityModel>> updatePurchaseReturns(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.createPurchaseInvoice,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, PurchaseEntityModel>> deletePurchaseReturns(
      {required PurchaseRequestModel params}) async {
    try {
      final response = await client.post(UrlResources.deletePurchaseOrder,
          data: params.toJson());
      if (response.statusCode == 200) {
        PurchaseEntityModel purchaseResponseModel =
            PurchaseEntityModel.fromJson(response.data);
        return Right(purchaseResponseModel);
      }
      return Left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}
