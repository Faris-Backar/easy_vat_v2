import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';

abstract class SalesManRepository {
  Future<Either<Failure, List<SalesManEntity>>> getSalesMan();
}
