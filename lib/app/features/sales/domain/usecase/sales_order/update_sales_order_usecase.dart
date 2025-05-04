import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_order_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class UpdateSalesOrderUsecase extends UseCase<
    Either<Failure, SalesInvoiceEntity>, SalesOrderRequestModel> {
  final SalesRepository salesOrderRepository;

  UpdateSalesOrderUsecase({required this.salesOrderRepository});

  @override
  Future<Either<Failure, SalesInvoiceEntity>> call(
      {required SalesOrderRequestModel params}) async {
    return await salesOrderRepository.updateSalesOrders(
        salesOrderRequestParams: params);
  }
}
