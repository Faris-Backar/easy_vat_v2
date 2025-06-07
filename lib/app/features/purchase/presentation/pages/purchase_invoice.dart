import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/delete_purchase/delete_purchase_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/purchase/purchase_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/widget/purchase_appbar.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/providers/supplier_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_confirmation_dialog.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_transaction_card.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class PurchaseInvoiceScreen extends ConsumerStatefulWidget {
  const PurchaseInvoiceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PurchaseInvoiceScreenState();
}

class _PurchaseInvoiceScreenState extends ConsumerState<PurchaseInvoiceScreen> {
  final _searchTextController = TextEditingController();
  bool isTaxRegisrationEnabled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
        ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
        ref.read(salesLedgerNotifierProvider.notifier).fetchSalesLedgers();
        ref.read(salesManProvider.notifier).getSalesMans();
        ref.read(paymentModeNotifierProvider.notifier).fetchPaymentModes();
        ref.read(supplierNotfierProvider.notifier).getSupplier();
        ref.read(fetchPurchaseInvoiceProvider.notifier).fetchPurchaseInvoice(
            params: PurchaseParams(
                fromDate: ref.read(dateRangeProvider).fromDate,
                toDate: ref.read(dateRangeProvider).toDate));
        final prefs = await SharedPreferences.getInstance();
        isTaxRegisrationEnabled =
            prefs.getBool(PrefResources.isTaxEnabled) ?? false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final purchaseInvoiceState = ref.watch(fetchPurchaseInvoiceProvider);
    return Scaffold(
      appBar: PurchaseAppBar(
        searchController: _searchTextController,
        config: PurchaseAppBarConfig(
          filterFunction: (params) => ref
              .read(fetchPurchaseInvoiceProvider.notifier)
              .fetchPurchaseInvoice(params: params),
          onSearch: (value) => ref
              .read(fetchPurchaseInvoiceProvider.notifier)
              .searchPurchaseInvoice(value),
        ),
      ),
      backgroundColor: context.surfaceColor,
      body: Consumer(builder: (context, ref, child) {
        ref.listen(deletePurchaseProvider, (previous, next) {
          next.maybeWhen(
            loaded: () {
              final fromDate = ref.read(dateRangeProvider).fromDate;
              final toDate = ref.read(dateRangeProvider).toDate;
              ref
                  .read(fetchPurchaseInvoiceProvider.notifier)
                  .fetchPurchaseInvoice(
                    params: PurchaseParams(
                      fromDate: fromDate,
                      toDate: toDate,
                    ),
                  );
              Fluttertoast.showToast(
                msg: context.translate(
                    AppStrings.deleteSalesInvoiceConfirmationMessage),
                backgroundColor: Colors.white,
                textColor: Colors.black,
              );
            },
            error: (error) {
              Fluttertoast.showToast(
                msg: error,
                backgroundColor: Colors.red,
                textColor: Colors.white,
              );
            },
            orElse: () {},
          );
        });

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: purchaseInvoiceState.maybeWhen(
            success: (purchaseInvoiceData, totalAmount) {
              if (purchaseInvoiceData.isEmpty == true) {
                return Center(
                  child: Container(
                    height: 0.5.sh,
                    width: 0.8.sw,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.images.noDataFound.path))),
                  ),
                );
              }
              return ListView.builder(
                itemCount: purchaseInvoiceData.length,
                itemBuilder: (context, index) {
                  final purchaseInvoice = purchaseInvoiceData[index];
                  final notifier = ValueNotifier<bool>(false);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.4,
                        motion: ScrollMotion(),
                        children: [
                          Expanded(
                            child: _buildSlidingAction(
                                color: AppUtils.isDarkMode(context)
                                    ? CustomColors.getTransactionSkyBlueColor(
                                        context)
                                    : CustomColors.getTransactionSkyBlueColor(
                                            context)
                                        .withValues(alpha: .2),
                                icon: Assets.icons.print,
                                iconColor: AppUtils.isDarkMode(context)
                                    ? context.onPrimaryColor
                                    : null,
                                borderRadiusBottomLeft: 10,
                                borderRadiusTopLeft: 10,
                                onTap: () async {
                                  context.router.push(PdfViewerRoute(
                                      pdfUrl:
                                          UrlResources.downloadPurchaseInvoice,
                                      queryParameters: {
                                        'PurchaseIDPK':
                                            purchaseInvoice.purchaseIdpk,
                                      },
                                      pdfName: purchaseInvoice.supplierName));
                                }),
                          ),
                          Expanded(
                            child: _buildSlidingAction(
                                color: AppUtils.isDarkMode(context)
                                    ? CustomColors.getTransactionCardBlueColor(
                                        context)
                                    : CustomColors.getTransactionCardBlueColor(
                                            context)
                                        .withValues(alpha: .2),
                                icon: Assets.icons.view,
                                borderRadiusTopRight: 10.0,
                                borderRadiusBottomRight: 10.0,
                                iconColor: AppUtils.isDarkMode(context)
                                    ? context.onPrimaryColor
                                    : null,
                                onTap: () async {
                                  await ref
                                      .read(purchaseProvider.notifier)
                                      .reinsertPurchaseInvoiceForm(
                                          purchaseInvoice, ref);
                                  if (mounted) {
                                    context.router.push(AddNewPurchaseRoute(
                                      title: context
                                          .translate(AppStrings.addNewPurchase),
                                    ));
                                  }
                                }),
                          ),
                        ],
                      ),
                      startActionPane:
                          ActionPane(motion: ScrollMotion(), children: [
                        Expanded(
                          child: _buildSlidingAction(
                            width: 50.w,
                            color: AppUtils.isDarkMode(context)
                                ? CustomColors.getTransactionCardRedColor(
                                    context)
                                : CustomColors.getTransactionCardRedColor(
                                        context)
                                    .withValues(alpha: .2),
                            icon: Assets.icons.delete,
                            borderRadiusTopLeft: 10.0,
                            borderRadiusBottomLeft: 10.0,
                            borderRadiusTopRight: 10.0,
                            borderRadiusBottomRight: 10.0,
                            iconColor: AppUtils.isDarkMode(context)
                                ? context.onPrimaryColor
                                : null,
                            iconHeight: 24.0,
                            iconWidth: 24.0,
                            onTap: () => _showDeleteDialog(context,
                                salesIdpk: purchaseInvoice.purchaseIdpk ?? "",
                                supplierIdpk:
                                    purchaseInvoice.supplierIdfk ?? ""),
                          ),
                        ),
                      ]),
                      child: CustomTransactionCard(
                        isSelectedNotifier: notifier,
                        isTaxEnabled: isTaxRegisrationEnabled,
                        date: purchaseInvoice.purchaseDate,
                        discount: purchaseInvoice.discount,
                        grossAmount: purchaseInvoice.grossAmount,
                        netAmount: purchaseInvoice.netTotal,
                        paymentMethod: purchaseInvoice.purchaseMode ?? "cash",
                        referenceNo: purchaseInvoice.referenceNo,
                        title: purchaseInvoice.supplierName,
                        tax: purchaseInvoice.tax,
                        transactionBy: purchaseInvoice.purchasedBy,
                        transactionId: purchaseInvoice.purchaseNo?.toString(),
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
        );
      }),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiaryContainer
              : context.surfaceColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.translate(AppStrings.total),
                    style: context.textTheme.bodyMedium?.copyWith(
                        color:
                            context.defaultTextColor.withValues(alpha: 0.32)),
                  ),
                  purchaseInvoiceState.maybeWhen(
                    success: (salesInvoice, totalAmount) => Text(
                      totalAmount?.toStringAsFixed(2) ?? "0.0",
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    orElse: () => Text(
                      ref.watch(cartProvider).totalAmount.toStringAsFixed(2),
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                onPressed: () => context.router.push(
                  AddNewPurchaseRoute(
                    title: context.translate(AppStrings.addNewPurchase),
                  ),
                ),
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
      ),
    );
  }

  _buildSlidingAction({
    required Function()? onTap,
    required Color? color,
    required String icon,
    required Color? iconColor,
    double? borderRadiusTopLeft,
    double? borderRadiusTopRight,
    double? borderRadiusBottomLeft,
    double? borderRadiusBottomRight,
    double? width,
    double? iconHeight, // Add this parameter
    double? iconWidth, // Add this parameter
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
            topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
            bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
            bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0),
          ),
        ),
        padding: const EdgeInsets.all(18.0),
        child: SvgIcon(
          height: iconHeight ?? 18,
          width: iconWidth ?? 18,
          icon: icon,
          color: iconColor,
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context,
      {required String salesIdpk, required String supplierIdpk}) {
    showDialog(
        context: context,
        builder: (context) => CustomConfirmationDialog(
              title: context.translate(AppStrings.delete),
              message: context.translate(AppStrings.deleteConfirmationInCart),
              primaryButtonLabel: context.translate(AppStrings.delete),
              secondaryButtonLabel: context.translate(AppStrings.cancel),
              onPrimaryTap: () {
                ref.read(deletePurchaseProvider.notifier).deletePurchaseInvoice(
                      params: PurchaseParams(
                        fromDate: ref.read(dateRangeProvider).fromDate,
                        toDate: ref.read(dateRangeProvider).toDate,
                        purchaseIDPK: salesIdpk,
                        supplierIDPK: supplierIdpk,
                      ),
                    );
                context.router.popForced();
              },
              onSecondaryTap: () => context.router.popForced(),
            ));
  }
}
