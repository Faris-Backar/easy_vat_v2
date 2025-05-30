import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/widget/purchase_invoice_appbar.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/transaction_card.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/transaction_slidable_widget.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage()
class PurchaseInvoiceScreen extends ConsumerStatefulWidget {
  const PurchaseInvoiceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PurchaseInvoiceScreenState();
}

class _PurchaseInvoiceScreenState extends ConsumerState<PurchaseInvoiceScreen> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
        ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
        ref.read(salesLedgerNotifierProvider.notifier).fetchSalesLedgers();
        ref.read(salesManProvider.notifier).getSalesMans();
        ref.read(paymentModeNotifierProvider.notifier).fetchPaymentModes();
        ref.read(fetchPurchaseInvoiceProvider.notifier).fetchPurchaseInvoice();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final purchaseInvoiceState = ref.watch(fetchPurchaseInvoiceProvider);
    return Scaffold(
      appBar: PurchaseInvoiceAppbar(searchController: _searchTextController),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: purchaseInvoiceState.maybeWhen(
          loaded: (purchaseInvoiceData) {
            if (purchaseInvoiceData.isEmpty == true) {
              return Center(
                child: Text(context.translate(AppStrings.noDataIsFound)),
              );
            }
            return ListView.builder(
              itemCount: purchaseInvoiceData.length,
              itemBuilder: (context, index) {
                final purchaseInvoice = purchaseInvoiceData[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      extentRatio: .15,
                      motion: ScrollMotion(),
                      children: [
                        TransactionSlidableActionWidget(
                          onDeleteTap: () {},
                          onEditTap: () {
                            // ref
                            //     .read(cartProvider.notifier)
                            //     .reinsertSalesForm(purchaseInvoice, ref);
                            // context.router.pushNamed(AppRouter.addNewSales);
                          },
                          onPrintTap: () {},
                        )
                      ],
                    ),
                    child: TransactionCard(
                      soldItems: [],
                      isForPurchase: true,
                      salesOrderNumber:
                          purchaseInvoice.purchaseNo?.toString() ?? "",
                      salesDate: purchaseInvoice.purchaseDate ?? DateTime.now(),
                      customerName: purchaseInvoice.supplierName ?? "",
                      soldBy: purchaseInvoice.purchasedBy ?? "",
                      netTotal: purchaseInvoice.netTotal ?? 0.0,
                      refNo: purchaseInvoice.referenceNo ?? "",
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
          error: (message) => Center(
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
              onPressed: () =>
                  context.router.push(AddNewSalesRoute(isForPurchase: true)),
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
