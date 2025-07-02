import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_order_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';

class FetchSalesOrderUsecase
    extends UseCase<Either<Failure, List<SalesOrderEntity>>, SalesParams> {
  final SalesRepository salesRepository;
  FetchSalesOrderUsecase({required this.salesRepository});

  @override
  Future<Either<Failure, List<SalesOrderEntity>>> call(
      {required SalesParams params}) async {
    return await salesRepository.getSalesOrders(
        salesOrderRequestParams: params);
  }
}
