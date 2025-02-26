import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/sales_invoice_state.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/pos_app_bar.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/transaction_card.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/transaction_slidable_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage()
class SalesInvoiceScreen extends ConsumerStatefulWidget {
  const SalesInvoiceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SalesInvoiceScreenState();
}

class _SalesInvoiceScreenState extends ConsumerState<SalesInvoiceScreen> {
  final _searchTextController = TextEditingController();
  late SalesInvoiceState salesInvoiceState;

  @override
  void initState() {
    super.initState();
    salesInvoiceState = ref.read(salesInvoiceNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(salesInvoiceNotifierProvider.notifier).fetchSalesInvoice(
            params: SalesInvoiceParams(
              salesIDPK: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
              fromDate: DateTime.now(),
              toDate: DateTime.now(),
              customerID: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final salesInvoiceState = ref.watch(salesInvoiceNotifierProvider);
    return Scaffold(
      appBar: PosAppBar(searchController: _searchTextController),
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: salesInvoiceState.maybeWhen(
          success: (salesInvoiceData) => ListView.builder(
            itemCount: salesInvoiceData.salesList?.length ?? 0,
            itemBuilder: (context, index) {
              final salesInvoice = salesInvoiceData.salesList?[index];
              if (salesInvoiceData.salesList?.isEmpty == true) {
                return Center(
                  child: Text(AppStrings.noDataIsFound),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Slidable(
                  endActionPane: const ActionPane(
                    extentRatio: .15,
                    motion: ScrollMotion(),
                    children: [TransactionSlidableActionWidget()],
                  ),
                  child: TransactionCard(
                    salesOrderNumber: salesInvoice?.salesOrderNo ?? "",
                    salesDate: salesInvoice?.saleDate ?? DateTime.now(),
                    customerName: salesInvoice?.customerName ?? "",
                    soldBy: salesInvoice?.soldBy ?? "",
                    netTotal: salesInvoice?.netTotal ?? 0.0,
                    refNo: salesInvoice?.referenceNo ?? "",
                    status: "Unpaid",
                  ),
                ),
              );
            },
          ),
          loading: () => Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          failure: (message) => Center(
            child: Text(message),
          ),
          orElse: () => Text(AppStrings.noDataIsFound),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: PrimaryButton(
          onPressed: () => context.router.pushNamed(AppRouter.addNewSales),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_circle_outline_rounded, color: Colors.white),
              SizedBox(width: 5.w),
              Text(
                AppStrings.addNew,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
