import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';

abstract class SupplierRepository {
  Future<Either<Failure, List<SupplierEntity>>> getSuppliers();
  Future<Either<Failure, List<SupplierEntity>>> searchSupplier(
      {required String query});
}
