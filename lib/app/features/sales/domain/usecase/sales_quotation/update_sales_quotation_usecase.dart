import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_quotation_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_quotation_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class UpdateSalesQuotationUsecase
    extends UseCase<Either<Failure, SalesQuotationEntity>, SalesQuotationModel> {
  final SalesRepository salesReturnRepository;

  UpdateSalesQuotationUsecase({required this.salesReturnRepository});

  @override
  Future<Either<Failure, SalesQuotationEntity>> call(
      {required SalesQuotationModel params}) async {
    return await salesReturnRepository.updateSalesQuotation(
        salesQuotationRequest: params);
  }
}
