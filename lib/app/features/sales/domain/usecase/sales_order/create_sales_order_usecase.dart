import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_order_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_order_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class CreateSalesOrderUsecase
    extends UseCase<Either<Failure, SalesOrderEntity>, SalesOrderModel> {
  final SalesRepository salesRepository;

  CreateSalesOrderUsecase({required this.salesRepository});

  @override
  Future<Either<Failure, SalesOrderEntity>> call(
      {required SalesOrderModel params}) async {
    return await salesRepository.createSalesOrders(
        salesOrderRequestParams: params);
  }
}
