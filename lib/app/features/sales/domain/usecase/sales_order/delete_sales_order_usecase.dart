import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_invoice_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_order_repository.dart';

class DeleteSalesOrderUsecase
    extends UseCase<Either<Failure, SalesEntity>, SalesRequestModel> {
  final SalesRepository salesOrderRepository;

  DeleteSalesOrderUsecase({required this.salesOrderRepository});

  @override
  Future<Either<Failure, SalesEntity>> call(
      {required SalesRequestModel params}) async {
    return await salesOrderRepository.deleteSalesOrders(
        salesOrderRequestParams: params);
  }
}
