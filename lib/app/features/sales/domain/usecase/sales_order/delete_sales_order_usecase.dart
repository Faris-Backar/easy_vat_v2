import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_order_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class DeleteSalesOrderUsecase
    extends UseCase<Either<Failure, bool>, SalesOrderModel> {
  final SalesRepository salesOrderRepository;

  DeleteSalesOrderUsecase({required this.salesOrderRepository});

  @override
  Future<Either<Failure, bool>> call(
      {required SalesOrderModel params}) async {
    return await salesOrderRepository.deleteSalesOrders(
        salesOrderRequestParams: params);
  }
}
