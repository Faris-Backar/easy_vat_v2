import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
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
      expandedHeight: 330.h,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: isAppBarCollapsed
          ? context.colorScheme.surface
          : context.primaryColor,
      leading: IconButton(
        onPressed: () {},
        icon: SvgIcon(
          height: 24,
          width: 24,
          color:
              isAppBarCollapsed ? context.colorScheme.onSurface : Colors.white,
          icon: Assets.icons.menus,
        ),
      ),
      title: isAppBarCollapsed
          ? Text(
              context.translate(AppStrings.daybook),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            )
          : null,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge.count(
            backgroundColor: context.errorColor,
            count: 3,
            child: Icon(
              Icons.notifications_rounded,
              color: isAppBarCollapsed
                  ? context.colorScheme.onSurface
                  : Colors.white,
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
                        color: context.surfaceColor,
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1A0B3D),
                Color(0xFF27165D),
                context.primaryColor,
              ],
            ),
          ),
          child: Stack(
            children: [
              // Decorative circles
              Positioned(
                right: -50,
                top: -50,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
              Positioned(
                left: -40,
                bottom: 50,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: ValueListenableBuilder(
                          valueListenable: selectedDateNotifier,
                          builder: (context, date, child) {
                            return GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.2),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      DateFormatUtils.getCustomDateFormat(
                                          date: date, formate: "dd MMM yyyy"),
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildExpandedSummaryCard(
                            context,
                            title: context.translate(AppStrings.cash),
                            amount: getTotalByType(TransactionType.cash),
                            icon: Icons.account_balance_wallet,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildExpandedSummaryCard(
                            context,
                            title: context.translate(AppStrings.bank),
                            amount: getTotalByType(TransactionType.bank),
                            icon: Icons.account_balance,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildExpandedSummaryCard(
                            context,
                            title: context.translate(AppStrings.payable),
                            amount: getTotalByType(TransactionType.payable),
                            icon: Icons.payment,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildExpandedSummaryCard(
                            context,
                            title: context.translate(AppStrings.recievable),
                            amount: getTotalByType(TransactionType.receivable),
                            icon: Icons.account_balance_wallet_outlined,
                            color: Colors.purple,
                          ),
                        ),
                      ],
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateNotifier.value,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      selectedDateNotifier.value = picked;
    }
  }

  Widget _buildExpandedSummaryCard(
    BuildContext context, {
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "₹ ${amount.toStringAsFixed(0)}",
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

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
