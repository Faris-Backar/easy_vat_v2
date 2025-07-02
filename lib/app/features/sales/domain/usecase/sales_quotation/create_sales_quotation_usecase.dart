import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_quotation_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_quotation_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class CreateSalesQuotationUsecase extends UseCase<
    Either<Failure, SalesQuotationEntity>, SalesQuotationModel> {
  final SalesRepository salesRepository;

  CreateSalesQuotationUsecase({required this.salesRepository});

  @override
  Future<Either<Failure, SalesQuotationEntity>> call(
      {required SalesQuotationModel params}) async {
    return await salesRepository.createSalesQuotation(
        salesQuotationRequest: params);
  }
}
