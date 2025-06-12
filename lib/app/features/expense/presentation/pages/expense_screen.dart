import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
//import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_params.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_notifier.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_state.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense_cart/expense_cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/expense_appbar.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/expense_card.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/expense_ledger/expense_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ExpenseScreen extends ConsumerStatefulWidget {
  const ExpenseScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpenseInvoiceScreenState();
}

class _ExpenseInvoiceScreenState extends ConsumerState<ExpenseScreen> {
  final _searchTextController = TextEditingController();
  late ExpenseState expenseState;
  bool isTaxRegisrationEnabled = false;

  @override
  void initState() {
    super.initState();
    expenseState = ref.read(expenseNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
      ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
      ref.read(paymentModeNotifierProvider.notifier).fetchPaymentModes();
      ref.read(expenseLedgerNotifierProvider.notifier).fetchExpenseLedgers();
      ref.read(expenseNotifierProvider.notifier).fetchExpenses(
            params: ExpenseParams(
              expenseIDPK: "00000000-0000-0000-0000-000000000000",
              fromDate: DateTime.now(),
              toDate: DateTime.now(),
              supplierID: "00000000-0000-0000-0000-000000000000",
            ),
          );
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final prefs = await SharedPreferences.getInstance();
        isTaxRegisrationEnabled =
            prefs.getBool(PrefResources.isTaxEnabled) ?? false;
      });
    });
  }

  // Future<void> _initializeData() async {
  //   ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
  //   ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
  //   ref.read(paymentModeNotifierProvider.notifier).fetchPaymentModes();
  //   ref.read(expenseNotifierProvider.notifier).fetchExpenses(
  //         params: ExpenseParams(
  //           expenseIDPK: "00000000-0000-0000-0000-000000000000",
  //           fromDate: DateTime.now(),
  //           toDate: DateTime.now(),
  //           supplierID: "00000000-0000-0000-0000-000000000000",
  //         ),
  //       );

  //   final prefs = await SharedPreferences.getInstance();
  //   final enabled = prefs.getBool(PrefResources.isTaxEnabled) ?? false;
  //   setState(() {
  //     isTaxRegisrationEnabled = enabled;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final expenseState = ref.watch(expenseNotifierProvider);
    return Scaffold(
      appBar: ExpenseAppbar(
        searchController: _searchTextController,
        config: ExpenseAppBarConfig(),
      ),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: expenseState.maybeWhen(
          success: (expenseData, totalAmount) {
            if (expenseData.isEmpty == true) {
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
              itemCount: expenseData.length,
              itemBuilder: (context, index) {
                final expense = expenseData[index];
                final notifier = ValueNotifier<bool>(false);
                if (expenseData.isEmpty == true) {
                  return Center(
                    child: Text(context.translate(AppStrings.noDataIsFound)),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        Expanded(
                          child: _buildSlidingAction(
                            color: AppUtils.isDarkMode(context)
                                ? CustomColors.getTransactionSkyBlueColor(
                                    context)
                                : CustomColors.getTransactionSkyBlueColor(
                                        context)
                                    .withValues(alpha: 0.2),
                            borderRadiusTopLeft: 10.0,
                            borderRadiusBottomLeft: 10.0,
                            icon: Assets.icons.print,
                            iconColor: AppUtils.isDarkMode(context)
                                ? context.onPrimaryColor
                                : null,
                            onTap: () {
                              // handle print
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
                                .read(expenseCartProvider.notifier)
                                .reinsertExpenseForm(expense, ref);
                            if (mounted) {
                              context.router.push(AddNewExpenseRoute(
                                tittle:
                                    context.translate(AppStrings.addNewExpense),
                              ));
                            }
                          },
                        )),
                      ],
                    ),
                    startActionPane:
                        ActionPane(motion: ScrollMotion(), children: [
                      Expanded(child: Container()),
                      Expanded(
                        child: _buildSlidingAction(
                          color: AppUtils.isDarkMode(context)
                              ? CustomColors.getTransactionCardRedColor(context)
                              : CustomColors.getTransactionCardRedColor(context)
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
                          onTap: () {
                            // handle delete
                          },
                        ),
                      ),
                    ]),
                    child: ExpenseCard(
                      expense: expense,
                      isSelectedNotifier: notifier,
                      isTaxEnabled: isTaxRegisrationEnabled,
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
                  context.translate(AppStrings.total),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.defaultTextColor.withValues(alpha: 0.32),
                  ),
                ),
                expenseState.maybeWhen(
                    success: (expense, totalAmount) => Text(
                          totalAmount?.toStringAsFixed(2) ?? "0.0",
                          style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                    orElse: () => Text(
                          ref
                              .watch(expenseCartProvider)
                              .totalAmount
                              .toStringAsFixed(2),
                          style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ))

                // Text(
                //   ref.watch(cartProvider).totalAmount.toStringAsFixed(2),
                //   style: context.textTheme.bodyLarge?.copyWith(
                //     fontSize: 17,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 10),
            PrimaryButton(
              onPressed: () => context.router.push(
                AddNewExpenseRoute(),
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
}
