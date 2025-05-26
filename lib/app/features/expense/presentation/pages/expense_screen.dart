import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_params.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_notifier.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_state.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/expense_app_bar.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/expense_card.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(expenseNotifierProvider.notifier).fetchExpenses(
            params: ExpenseParams(
              expenseIDPK: "00000000-0000-0000-0000-000000000000",
              fromDate: DateTime.now(),
              toDate: DateTime.now(),
              supplierID: "00000000-0000-0000-0000-000000000000",
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenseState = ref.watch(expenseNotifierProvider);

    return Scaffold(
      appBar: ExpenseAppBar(searchController: _searchTextController),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: expenseState.maybeWhen(
          success: (expenseData) {
            if (expenseData.isEmpty) {
              return Center(
                child: Text(context.translate(AppStrings.noDataIsFound)),
              );
            }

            return ListView.builder(
              itemCount: expenseData.length,
              itemBuilder: (context, index) {
                final expense = expenseData[index];
                final notifier = ValueNotifier<bool>(false);

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
                            icon: Assets.icons.view,
                            iconColor: AppUtils.isDarkMode(context)
                                ? context.onPrimaryColor
                                : null,
                            onTap: () {
                              // handle view
                            },
                          ),
                        ),
                        Expanded(
                          child: _buildSlidingAction(
                            color: AppUtils.isDarkMode(context)
                                ? CustomColors.getTransactionCardRedColor(
                                    context)
                                : CustomColors.getTransactionCardRedColor(
                                        context)
                                    .withValues(alpha: 0.2),
                            icon: Assets.icons.delete,
                            iconColor: AppUtils.isDarkMode(context)
                                ? context.onPrimaryColor
                                : null,
                            onTap: () {
                              // handle delete
                            },
                          ),
                        ),
                      ],
                    ),
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
        color: Colors.white,
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
                    color: context.defaultTextColor.withValues(alpha: 0.32),
                  ),
                ),
                Text(
                  ref.watch(cartProvider).totalAmount.toStringAsFixed(2),
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            PrimaryButton(
              onPressed: () {
                // Add Expense Screen
              },
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

  Widget _buildSlidingAction({
    required VoidCallback? onTap,
    required Color? color,
    required String icon,
    required Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        color: color,
        padding: const EdgeInsets.all(18.0),
        child: SvgIcon(
          height: 18,
          width: 18,
          icon: icon,
          color: iconColor,
        ),
      ),
    );
  }
}
