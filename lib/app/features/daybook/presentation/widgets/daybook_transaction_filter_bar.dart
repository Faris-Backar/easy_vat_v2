import 'package:easy_vat_v2/app/features/daybook/presentation/pages/daybook_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';

class DayBookTransactionFilterBar extends StatelessWidget {
  final TextEditingController searchController;
  final String searchQuery;
  final ValueChanged<TransactionCategory> onCategorySelected;
  final TransactionCategory selectedCategory;
  final VoidCallback onClearSearch;

  const DayBookTransactionFilterBar({
    super.key,
    required this.searchController,
    required this.searchQuery,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.tertiaryContainer,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceBright,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Search Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
              child: TextInputFormField(
                controller: searchController,
                hint: context.translate(AppStrings.searchTransactions),
                borderRadius: 10.r,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                  size: 20,
                ),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        onPressed: onClearSearch,
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey.shade500,
                          size: 20,
                        ),
                      )
                    : null,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Filter Chips
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: TransactionCategory.values.map((category) {
                  final isSelected = selectedCategory == category;
                  return Container(
                    margin: EdgeInsets.only(right: 8.w, top: 8.h, bottom: 8.h),
                    child: FilterChip(
                      label: Text(
                        _getCategoryDisplayName(category),
                        style: TextStyle(
                          color:
                              isSelected ? Colors.white : Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (_) => onCategorySelected(category),
                      backgroundColor: Colors.grey.shade100,
                      selectedColor: context.primaryColor,
                      checkmarkColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCategoryDisplayName(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.all:
        return 'All';
      case TransactionCategory.cash:
        return 'Cash';
      case TransactionCategory.bank:
        return 'Bank';
      case TransactionCategory.payable:
        return 'Payable';
      case TransactionCategory.receivable:
        return 'Receivable';
    }
  }
}
