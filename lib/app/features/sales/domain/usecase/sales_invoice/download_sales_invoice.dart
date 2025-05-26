import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class DownloadSalesInvoiceUsecase
    extends UseCase<Either<Failure, String>, String> {
  final SalesRepository salesInvoiceRepository;

  DownloadSalesInvoiceUsecase({required this.salesInvoiceRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await salesInvoiceRepository.downloadSalesInvoices(
        salesIdpk: params);
  }
}
