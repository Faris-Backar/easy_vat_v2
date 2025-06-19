import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_invoice_state.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/sales_appbar.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/transaction_card.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage()
class PurchaseOrderScreen extends ConsumerStatefulWidget {
  const PurchaseOrderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PurchaseOrderScreenState();
}

class _PurchaseOrderScreenState extends ConsumerState<PurchaseOrderScreen> {
  final _searchTextController = TextEditingController();
  late SalesInvoiceState salesInvoiceState;

  @override
  void initState() {
    super.initState();
    salesInvoiceState = ref.read(salesInvoiceNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
      ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
      ref.read(salesLedgerNotifierProvider.notifier).fetchSalesLedgers();
      ref.read(salesManProvider.notifier).getSalesMans();
      ref.read(paymentModeNotifierProvider.notifier).fetchPaymentModes();
      ref.read(salesInvoiceNotifierProvider.notifier).fetchSalesInvoice(
            params: SalesParams(
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
      appBar: SalesAppBar(
        searchController: _searchTextController,
        config: SalesAppBarConfig(
            title: context.translate(AppStrings.purchaseReturn),
            isForPurchase: true),
      ),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: salesInvoiceState.maybeWhen(
          success: (salesInvoiceData, totalAmount) {
            if (salesInvoiceData.isEmpty == true) {
              return Center(
                child: Text(context.translate(AppStrings.noDataIsFound)),
              );
            }
            return ListView.builder(
              itemCount: salesInvoiceData.length,
              itemBuilder: (context, index) {
                final salesInvoice = salesInvoiceData[index];
                if (salesInvoiceData.isEmpty == true) {
                  return Center(
                    child: Text(context.translate(AppStrings.noDataIsFound)),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      extentRatio: .15,
                      motion: ScrollMotion(),
                      children: [
                        // TransactionSlidableActionWidget(
                        //   onDeleteTap: () {},
                        //   onEditTap: () {
                        //     ref
                        //         .read(cartProvider.notifier)
                        //         .reinsertSalesForm(salesInvoice, ref);
                        //     context.router.pushNamed(AppRouter.addNewSales);
                        //   },
                        //   onPrintTap: () {},
                        // )
                      ],
                    ),
                    child: TransactionCard(
                      soldItems: salesInvoice.soldItems ?? [],
                      salesOrderNumber: salesInvoice.salesOrderNo ?? "",
                      salesDate: salesInvoice.saleDate ?? DateTime.now(),
                      customerName: salesInvoice.customerName ?? "",
                      soldBy: salesInvoice.soldBy ?? "",
                      netTotal: salesInvoice.netTotal ?? 0.0,
                      refNo: salesInvoice.referenceNo ?? "",
                      status: "Unpaid",
                    ),
                  ),
                );
              },
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          failure: (message) => Center(
            child: Text(message),
          ),
          orElse: () => Text(context.translate(AppStrings.noDataIsFound)),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppUtils.isDarkMode(context)
            ? context.colorScheme.tertiaryContainer
            : context.surfaceColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.translate(AppStrings.netTotal),
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: context.defaultTextColor.withValues(alpha: 0.32)),
                ),
                Text(
                  ref.watch(cartProvider).totalAmount.toStringAsFixed(2),
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryButton(
              onPressed: () => context.router.push(AddNewSalesRoute(
                  title: context.translate(AppStrings.addNewPurchaseOrder),
                  isForPurchase: true)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_circle_outline_rounded,
                      color: Colors.white),
                  SizedBox(width: 5.w),
                  Text(
                    context.translate(AppStrings.addNew),
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
