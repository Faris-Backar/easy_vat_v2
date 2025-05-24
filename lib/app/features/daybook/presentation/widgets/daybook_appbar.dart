import 'dart:developer';

import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/features/daybook/presentation/pages/daybook_screen.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';

class DayBookAppBar extends StatelessWidget {
  final bool isAppBarCollapsed;
  final List<Transaction> transactions;
  final ValueNotifier<DateTime> selectedDateNotifier;
  final ValueNotifier<TransactionCategory> selectedCategoryNotifier;
  const DayBookAppBar({
    super.key,
    required this.isAppBarCollapsed,
    required this.transactions,
    required this.selectedDateNotifier,
    required this.selectedCategoryNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: Color(0xFF1A1D29),
      leading: IconButton(
        onPressed: () {},
        icon: SvgIcon(
          height: 24,
          width: 24,
          color: context.colorScheme.onPrimary,
          icon: Assets.icons.menus,
        ),
      ),
      title: Text(
        context.translate(AppStrings.daybook),
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.colorScheme.onPrimary,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge.count(
            backgroundColor: context.errorColor,
            count: 3,
            child: Icon(
              Icons.notifications_rounded,
              color: context.colorScheme.onPrimary,
              size: 24,
            ),
          ),
        ),
        SizedBox(width: 8.w),
      ],
      bottom: isAppBarCollapsed
          ? PreferredSize(
              preferredSize: Size.fromHeight(55.h),
              child: ValueListenableBuilder<TransactionCategory>(
                  valueListenable: selectedCategoryNotifier,
                  builder: (_, selected, __) {
                    return Container(
                      height: 60.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: AppUtils.isDarkMode(context)
                            ? Color(0xFF1A1D29)
                            : context.colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => selectedCategoryNotifier.value =
                                  TransactionCategory.cash,
                              child: _buildCompactSummaryCard(
                                context,
                                title: context.translate(AppStrings.cash),
                                amount: getTotalByType(TransactionType.cash),
                                icon: Icons.account_balance_wallet,
                                color: Colors.green,
                                isSelected: _getTransactionCategoryFromType(
                                    TransactionType.cash, selected),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.5,
                            height: 35.h,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => selectedCategoryNotifier.value =
                                  TransactionCategory.bank,
                              child: _buildCompactSummaryCard(
                                context,
                                title: context.translate(AppStrings.bank),
                                amount: getTotalByType(TransactionType.bank),
                                icon: Icons.account_balance,
                                color: Colors.blue,
                                isSelected: _getTransactionCategoryFromType(
                                    TransactionType.bank, selected),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.5,
                            height: 35.h,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => selectedCategoryNotifier.value =
                                  TransactionCategory.payable,
                              child: _buildCompactSummaryCard(
                                context,
                                title: context.translate(AppStrings.payable),
                                amount: getTotalByType(TransactionType.payable),
                                icon: Icons.payment,
                                color: Colors.orange,
                                isSelected: _getTransactionCategoryFromType(
                                    TransactionType.payable, selected),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.5,
                            height: 35.h,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => selectedCategoryNotifier.value =
                                  TransactionCategory.receivable,
                              child: _buildCompactSummaryCard(
                                context,
                                title: context.translate(AppStrings.recievable),
                                amount:
                                    getTotalByType(TransactionType.receivable),
                                icon: Icons.account_balance_wallet_outlined,
                                color: Colors.purple,
                                isSelected: _getTransactionCategoryFromType(
                                    TransactionType.receivable, selected),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          : null,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1A1D29),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32),

                  Text(
                    'Expenses',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$3,578',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Budget progress
                  Row(
                    children: [
                      Text(
                        'Monthly Budget Limit: \$4,200',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '10%',
                        style: TextStyle(
                          color: Color(0xFF4ECDC4),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.85,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF4ECDC4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactSummaryCard(BuildContext context,
      {required String title,
      required double amount,
      required IconData icon,
      required Color color,
      bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      foregroundDecoration: isSelected
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: color,
                  width: 2.0,
                ),
              ),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "₹ ${amount.toStringAsFixed(0)}",
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double getTotalByType(TransactionType type) => transactions
      .where((t) => t.type == type)
      .fold(0, (sum, t) => sum + t.amount);

  bool _getTransactionCategoryFromType(
      TransactionType type, TransactionCategory category) {
    log("transaction typ => $type , category => $category");
    switch (category) {
      case TransactionCategory.cash:
        return type == TransactionType.cash;
      case TransactionCategory.bank:
        return type == TransactionType.bank;
      case TransactionCategory.payable:
        return type == TransactionType.payable;
      case TransactionCategory.receivable:
        return type == TransactionType.receivable;
      case TransactionCategory.all:
        return false;
    }
  }
}
