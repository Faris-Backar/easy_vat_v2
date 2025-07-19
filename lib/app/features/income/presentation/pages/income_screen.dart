import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/income/domain/usecase/params/income_params.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/delete_income/delete_income_notifier.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income/income_notifier.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income/income_state.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income_cart/income_cart_provider.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/income_appbar.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/income_card.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/income_ledger/income_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/pdf_viewer/pdf_viewer_screen.dart';
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
class IncomeScreen extends ConsumerStatefulWidget {
  const IncomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends ConsumerState<IncomeScreen> {
  final _searchTextController = TextEditingController();
  late IncomeState incomeState;
  bool isTaxRegistrationEnabled = false;

  @override
  void initState() {
    super.initState();
    incomeState = ref.read(incomeNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
      ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
      ref.read(paymentModeNotifierProvider.notifier).fetchPaymentModes();
      ref.read(incomeLedgerNotifierProvider.notifier).fetchIncomeLedgers();
      ref.read(incomeNotifierProvider.notifier).fetchIncome(
          params: IncomeParams(
              incomeIDPK: PrefResources.emptyGuid,
              fromDate: DateTime.now(),
              toDate: DateTime.now(),
              customerID: PrefResources.emptyGuid));
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final prefs = await SharedPreferences.getInstance();
        isTaxRegistrationEnabled =
            prefs.getBool(PrefResources.isTaxEnabled) ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final incomeState = ref.watch(incomeNotifierProvider);
    return Scaffold(
      appBar: IncomeAppbar(
        searchController: _searchTextController,
        config: IncomeAppBarConfig(),
      ),
      backgroundColor: context.surfaceColor,
      body: Consumer(builder: (context, ref, child) {
        ref.listen(deleteIncomeNotifierProvider, (previous, next) {
          next.maybeWhen(
              success: () {
                Fluttertoast.showToast(
                    msg: context
                        .translate(AppStrings.deleteIncomeConfirmationMessage),
                    backgroundColor: Colors.white,
                    textColor: Colors.black);
                ref.read(incomeNotifierProvider.notifier).fetchIncome(
                    params: IncomeParams(
                        fromDate: ref.read(dateRangeProvider).fromDate,
                        toDate: ref.read(dateRangeProvider).toDate));
              },
              failure: (error) {
                Fluttertoast.showToast(
                    msg: error,
                    backgroundColor: Colors.red,
                    textColor: Colors.white);
              },
              orElse: () {});
        });

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: incomeState.maybeWhen(
            success: (incomeData, totalAmount) {
              if (incomeData.isEmpty == true) {
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
                itemCount: incomeData.length,
                itemBuilder: (context, index) {
                  final income = incomeData[index];
                  final notifier = ValueNotifier<bool>(false);
                  if (incomeData.isEmpty == true) {
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

                                //handle print

                                onTap: () async {
                                  context.router.push(PdfViewerRoute(
                                      pdfType: PDFType.income,
                                      queryParameters: {
                                        "IncomeIDPK": income.incomeIDPK ?? ""
                                      },
                                      pdfName: income.customerName));
                                })),
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
                          icon: Assets.icons.edit,
                          iconColor: AppUtils.isDarkMode(context)
                              ? context.onPrimaryColor
                              : null,
                          onTap: () async {
                            await ref
                                .read(incomeCartProvider.notifier)
                                .reinsertIncomeForm(income, ref);
                            if (mounted) {
                              context.router.push(AddNewIncomeRoute(
                                title:
                                    context.translate(AppStrings.addNewIncome),
                              ));
                            }
                          },
                        ))
                      ]),
                      startActionPane: ActionPane(
                          motion: ScrollMotion(),
                          extentRatio: 0.25,
                          children: [
                            Expanded(
                              child: _buildSlidingAction(
                                  color: AppUtils.isDarkMode(context)
                                      ? CustomColors.getTransactionCardRedColor(
                                          context)
                                      : CustomColors.getTransactionCardRedColor(
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
                                  // Delete
                                  onTap: () => _showDeleteDialog(context,
                                      incomeIDPK: income.incomeIDPK ?? "",
                                      customerID: income.customerIDFK ?? "")),
                            ),
                          ]),
                      child: IncomeCard(
                        income: income,
                        isSelectedNotifier: notifier,
                        isTaxEnabled: isTaxRegistrationEnabled,
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(
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
                  incomeState.maybeWhen(
                      success: (income, totalAmount) => Text(
                            totalAmount?.toStringAsFixed(2) ?? "0.0",
                            style: context.textTheme.bodyLarge?.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                      orElse: () => Text(
                            ref
                                .watch(incomeCartProvider)
                                .totalAmount
                                .toStringAsFixed(2),
                            style: context.textTheme.bodyLarge?.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                onPressed: () => context.router.push(AddNewIncomeRoute(
                    title: context.translate(AppStrings.addNewIncome))),
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
      {required String incomeIDPK, required String customerID}) {
    showDialog(
        context: context,
        builder: (context) => CustomConfirmationDialog(
              title: context.translate(AppStrings.delete),
              message: context.translate(AppStrings.deleteConfirmationInCart),
              primaryButtonLabel: context.translate(AppStrings.delete),
              secondaryButtonLabel: context.translate(AppStrings.cancel),
              onPrimaryTap: () {
                ref.read(deleteIncomeNotifierProvider.notifier).deleteIncome(
                    request: IncomeParams(
                        fromDate: ref.read(dateRangeProvider).fromDate,
                        toDate: ref.read(dateRangeProvider).toDate,
                        incomeIDPK: incomeIDPK,
                        customerID: customerID));
                context.router.popForced();
              },
              onSecondaryTap: () => context.router.popForced(),
            ));
  }
}
