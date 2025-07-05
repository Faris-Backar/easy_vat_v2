import 'dart:convert';
import 'dart:developer';

import 'package:archive/archive.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
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
import 'package:easy_vat_v2/app/features/pdf_viewer/pdf_viewer_screen.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_invoice_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/delete_sales/delete_sales_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales/sales_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_invoice_state.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/sales_appbar.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/sales_tansaction_card.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_confirmation_dialog.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class PosScreen extends ConsumerStatefulWidget {
  const PosScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PosScreenState();
}

class _PosScreenState extends ConsumerState<PosScreen> {
  // final _searchTextController = TextEditingController();

  final ValueNotifier<String?> selectedSalesMode = ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedSoldBy = ValueNotifier<String?>(null);
  final ValueNotifier<List<SalesInvoiceListModel>> soldItemsList =
      ValueNotifier<List<SalesInvoiceListModel>>([]);

  final List<String> salesModes = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4"
  ];
  final List<String> soldByOptions = ["Ajmal", "Zara", "Sam", "Mike", "Anna"];

  Future<List<SalesInvoiceListModel>> fetchCompressedSales() async {
    final dio = Dio();

    try {
      final response = await dio.get<List<int>>(
        'https://easyvatapi.microzys.in/Sales/00000000-0000-0000-0000-000000000000?fromDate=2025-01-01&toDate=2025-12-31',
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Accept-Encoding': 'gzip',
          },
        ),
      );

      if (response.statusCode != 200 ||
          response.data == null ||
          response.data!.isEmpty) {
        return [];
      }
      final decompressedBytes = GZipDecoder().decodeBytes(response.data!);
      final jsonStr = utf8.decode(decompressedBytes);
      final responseJsonList = List<SalesInvoiceListModel>.from(
          json.decode(jsonStr).map((x) => SalesInvoiceListModel.fromJson(x)));

      log("jsonList => $responseJsonList");
      return responseJsonList;
    } catch (e) {
      log('Error fetching sales: $e');
      return [];
    }
  }

  final _searchTextController = TextEditingController();
  late SalesInvoiceState salesInvoiceState;
  bool isTaxRegisrationEnabled = false;

  @override
  void initState() {
    super.initState();
    salesInvoiceState = ref.read(salesInvoiceNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
      ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
      ref.read(salesLedgerNotifierProvider.notifier).fetchSalesLedgers();
      ref.read(salesManProvider.notifier).getSalesMans();
      ref.read(paymentModeNotifierProvider.notifier).fetchPaymentModes();
      ref.read(salesInvoiceNotifierProvider.notifier).fetchSalesInvoice(
          params: SalesParams(
            fromDate: DateTime.now(),
            toDate: DateTime.now(),
          ),
          isCompressedFetchedItems: true);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final prefs = await SharedPreferences.getInstance();
        isTaxRegisrationEnabled =
            prefs.getBool(PrefResources.isTaxEnabled) ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final salesInvoiceState = ref.watch(salesInvoiceNotifierProvider);
    return Scaffold(
      appBar: SalesAppBar(
        searchController: _searchTextController,
        config: SalesAppBarConfig(
          fetchFunction: (SalesParams params) => ref
              .read(salesInvoiceNotifierProvider.notifier)
              .fetchSalesInvoice(
                  params: params, isCompressedFetchedItems: true),
        ),
      ),
      backgroundColor: context.surfaceColor,
      body: Consumer(builder: (context, ref, child) {
        ref.listen(deleteSalesNotifierProvider, (previous, next) {
          next.maybeWhen(
            success: () {
              Fluttertoast.showToast(
                msg: context.translate(
                    AppStrings.deleteSalesInvoiceConfirmationMessage),
                backgroundColor: Colors.white,
                textColor: Colors.black,
              );
              ref.read(salesInvoiceNotifierProvider.notifier).fetchSalesInvoice(
                    params: SalesParams(
                      fromDate: ref.read(dateRangeProvider).fromDate,
                      toDate: ref.read(dateRangeProvider).fromDate,
                    ),
                  );
            },
            failure: (error) {
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
          child: salesInvoiceState.maybeWhen(
            success: (salesInvoiceData, totalAmount) {
              if (salesInvoiceData.isEmpty == true) {
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
                itemCount: salesInvoiceData.length,
                itemBuilder: (context, index) {
                  final salesInvoice = salesInvoiceData[index];
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
                                      pdfUrl: UrlResources.downloadSalesInvoice,
                                      queryParameters: {
                                        'SaleIDPK': salesInvoice.saleIdpk,
                                      },
                                      pdfName: salesInvoice.customerName,
                                      pdfType: PDFType.salesInvoice,),);
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
                                      .read(salesProvider.notifier)
                                      .reinsertSalesForm(salesInvoice, ref);
                                  if (mounted) {
                                    context.router.push(AddNewSalesRoute(
                                      title: context
                                          .translate(AppStrings.addNewSales),
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
                                salesIdpk: salesInvoice.saleIdpk ?? "",
                                customerID: salesInvoice.custemerIdfk ?? ""),
                          ),
                        ),
                      ]),
                      child: SalesTransactionCard(
                        salesInvoice: salesInvoice,
                        isSelectedNotifier: notifier,
                        isTaxEnabled: isTaxRegisrationEnabled,
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
                  salesInvoiceState.maybeWhen(
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
                  AddNewSalesRoute(
                    title: context.translate(AppStrings.addNewSales),
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
      {required String salesIdpk, required String customerID}) {
    showDialog(
        context: context,
        builder: (context) => CustomConfirmationDialog(
              title: context.translate(AppStrings.delete),
              message: context.translate(AppStrings.deleteConfirmationInCart),
              primaryButtonLabel: context.translate(AppStrings.delete),
              secondaryButtonLabel: context.translate(AppStrings.cancel),
              onPrimaryTap: () {
                ref
                    .read(deleteSalesNotifierProvider.notifier)
                    .deleteSalesInvoice(
                      request: SalesParams(
                        fromDate: ref.read(dateRangeProvider).fromDate,
                        toDate: ref.read(dateRangeProvider).toDate,
                        salesIDPK: salesIdpk,
                        customerID: customerID,
                      ),
                    );
                context.router.popForced();
              },
              onSecondaryTap: () => context.router.popForced(),
            ));
  }
}
