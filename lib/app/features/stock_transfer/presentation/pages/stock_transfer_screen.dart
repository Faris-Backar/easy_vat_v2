import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/pdf_viewer/pdf_viewer_screen.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/params/stock_transfer_params.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/delete_stock_transfer/delete_stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/fetch_stock_transfer/fetch_stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/fetch_stock_transfer/fetch_stock_transfer_state.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_appbar.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_card.dart';
import 'package:easy_vat_v2/app/features/store/presentation/providers/store_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_confirmation_dialog.dart';
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
class StockTransferScreen extends ConsumerStatefulWidget {
  const StockTransferScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StockTransferScreenState();
}

class _StockTransferScreenState extends ConsumerState<StockTransferScreen> {
  final _searchTextController = TextEditingController();
  late FetchStockTransferState stockTransferState;
  bool isTaxRegistrationEnabled = false;

  @override
  void initState() {
    super.initState();
    stockTransferState = ref.read(fetchStockTransferNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(storeProvider.notifier).getStore();
      ref.read(fetchStockTransferNotifierProvider.notifier).fetchStockTransfer(
          params: StockTransferParams(
              stockTransferIDPK: PrefResources.emptyGuid,
              fromDate: DateTime.now(),
              toDate: DateTime.now()));
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final prefs = await SharedPreferences.getInstance();
        isTaxRegistrationEnabled =
            prefs.getBool(PrefResources.isTaxEnabled) ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockTransferState = ref.watch(fetchStockTransferNotifierProvider);
    return Scaffold(
      appBar: StockTransferAppbar(
          searchController: _searchTextController,
          config: StockTransferAppBarConfig()),
      backgroundColor: context.surfaceColor,
      body: Consumer(builder: (context, ref, child) {
        ref.listen(deleteStockTransferNotifierProvider, (previous, next) {
          next.maybeWhen(
            success: () {
              Fluttertoast.showToast(
                  msg: context.translate(
                      AppStrings.deleteStockTransferConfirmationMessage),
                  backgroundColor: Colors.white,
                  textColor: Colors.black);
              ref
                  .read(fetchStockTransferNotifierProvider.notifier)
                  .fetchStockTransfer(
                      params: StockTransferParams(
                          fromDate: ref.read(dateRangeProvider).fromDate,
                          toDate: ref.read(dateRangeProvider).toDate));
            },
            failure: (error) {
              Fluttertoast.showToast(
                  msg: error,
                  backgroundColor: Colors.red,
                  textColor: Colors.white);
            },
            orElse: () {},
          );
        });

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: stockTransferState.maybeWhen(
            success: (stockTransferData, totalAmount) {
              if (stockTransferData.isEmpty == true) {
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
                itemCount: stockTransferData.length,
                itemBuilder: (context, index) {
                  final stockTransfer = stockTransferData[index];
                  final notifier = ValueNotifier<bool>(false);
                  if (stockTransferData.isEmpty == true) {
                    return Center(
                      child: Text(context.translate(AppStrings.noDataIsFound)),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          Expanded(
                            child: _buildSlidingAction(
                              color: AppUtils.isDarkMode(context)
                                  ? CustomColors.getTransactionSkyBlueColor(
                                      context)
                                  : CustomColors.getTransactionSkyBlueColor(
                                          context)
                                      .withValues(alpha: 0.2),
                              borderRadiusBottomLeft: 10.0,
                              borderRadiusTopLeft: 10.0,
                              icon: Assets.icons.print,
                              iconColor: AppUtils.isDarkMode(context)
                                  ? context.onPrimaryColor
                                  : null,
                              onTap: () async {
                                context.router.push(PdfViewerRoute(
                                    pdfType: PDFType.stockTransfer,
                                    queryParameters: {
                                      "StockTransferIDPK":
                                          stockTransfer.stockTransferIDPK ?? ""
                                    },
                                    pdfName: stockTransfer.referenceNo));
                              },
                            ),
                          ),
                          Expanded(
                            child: _buildSlidingAction(
                                color: AppUtils.isDarkMode(context)
                                    ? CustomColors.getTransactionCardBlueColor(
                                        context)
                                    : CustomColors.getTransactionCardBlueColor(
                                            context)
                                        .withValues(alpha: 0.2),
                                borderRadiusBottomRight: 10.0,
                                borderRadiusTopRight: 10.0,
                                icon: Assets.icons.view,
                                iconColor: AppUtils.isDarkMode(context)
                                    ? context.onPrimaryColor
                                    : null,
                                onTap: () async {
                                  await ref
                                      .read(stockTransferProvider.notifier)
                                      .reinsertStockTransferForm(
                                          stockTransfer, ref);
                                  if (mounted) {
                                    context.router.push(
                                        AddNewStockTransferRoute(
                                            title: context.translate(AppStrings
                                                .addNewStockTransfer)));
                                  }
                                }),
                          )
                        ]),
                        startActionPane: ActionPane(
                            motion: ScrollMotion(),
                            extentRatio: 0.25,
                            children: [
                              Expanded(
                                child: _buildSlidingAction(
                                    color: AppUtils.isDarkMode(context)
                                        ? CustomColors
                                            .getTransactionCardRedColor(context)
                                        : CustomColors
                                                .getTransactionCardRedColor(
                                                    context)
                                            .withValues(alpha: 0.2),
                                    icon: Assets.icons.delete,
                                    borderRadiusTopLeft: 10.0,
                                    borderRadiusBottomLeft: 10.0,
                                    borderRadiusBottomRight: 10.0,
                                    borderRadiusTopRight: 10.0,
                                    iconColor: AppUtils.isDarkMode(context)
                                        ? context.onPrimaryColor
                                        : null,
                                    iconHeight: 24.0,
                                    iconWidth: 24.0,
                                    onTap: () => _showDeleteDialog(context,
                                        stockTransferIDPK:
                                            stockTransfer.stockTransferIDPK ??
                                                "")),
                              )
                            ]),
                        child: StockTransferCard(
                            stockTransfer: stockTransfer,
                            isSelectedNotifier: notifier)),
                  );
                },
              );
            },
            loading: () => const Center(
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
                  stockTransferState.maybeWhen(
                    success: (stockTransfer, totalAmount) => Text(
                      totalAmount?.toStringAsFixed(2) ?? "0.00",
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    orElse: () => Text(
                      ref
                          .watch(stockTransferProvider)
                          .totalNetCost
                          .toStringAsFixed(2),
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
                onPressed: () => context.router.push(AddNewStockTransferRoute(
                    title: context.translate(AppStrings.addNewStockTransfer))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      context.translate(AppStrings.addNew),
                      style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlidingAction(
      {required Function()? onTap,
      required Color? color,
      required String icon,
      required Color? iconColor,
      double? borderRadiusTopLeft,
      double? borderRadiusTopRight,
      double? borderRadiusBottomLeft,
      double? borderRadiusBottomRight,
      double? width,
      double? iconHeight,
      double? iconWidth}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
                topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
                bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
                bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0))),
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
      {required String stockTransferIDPK}) {
    showDialog(
        context: context,
        builder: (context) => CustomConfirmationDialog(
              title: context.translate(AppStrings.delete),
              message: context.translate(AppStrings.deleteConfirmationInCart),
              primaryButtonLabel: context.translate(AppStrings.delete),
              secondaryButtonLabel: context.translate(AppStrings.cancel),
              onPrimaryTap: () {
                ref
                    .read(deleteStockTransferNotifierProvider.notifier)
                    .deleteStockTransfer(
                        request: StockTransferParams(
                      fromDate: ref.read(dateRangeProvider).fromDate,
                      toDate: ref.read(dateRangeProvider).toDate,
                      stockTransferIDPK: stockTransferIDPK,
                    ));
                context.router.popForced();
              },
              onSecondaryTap: () => context.router.popForced(),
            ));
  }
}
