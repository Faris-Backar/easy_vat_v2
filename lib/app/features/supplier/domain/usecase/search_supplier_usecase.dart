import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/repository/supplier_repository.dart';

class SearchSupplierUsecase
    extends UseCase<Either<Failure, List<SupplierEntity>>, String> {
  final SupplierRepository supplierRepository;

  SearchSupplierUsecase({required this.supplierRepository});

  @override
  Future<Either<Failure, List<SupplierEntity>>> call(
      {required String params}) async {
    return await supplierRepository.searchSupplier(query: params);
  }
}
