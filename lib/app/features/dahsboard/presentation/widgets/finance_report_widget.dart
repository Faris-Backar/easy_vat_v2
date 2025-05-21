import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/dahsboard/presentation/providers/dashboard/dashboard_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinanceReportWidget extends ConsumerWidget {
  const FinanceReportWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromDate = ref.watch(dashboardProvider).fromDate;
    final toDate = ref.watch(dashboardProvider).toDate;
    final formattedFromDate = DateFormat('dd MMM yy').format(fromDate);
    final formattedToDate = DateFormat('dd MMM yy').format(toDate);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.translate(AppStrings.financialPeriod),
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
            decoration: BoxDecoration(
              color: AppUtils.isDarkMode(context)
                  ? context.primaryColor.withValues(alpha: 0.5)
                  : context.primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 16,
                    color: AppUtils.isDarkMode(context)
                        ? context.onPrimaryColor
                        : context.primaryColor),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () => _pickDate(context, ref,
                      isFromDate: true, fromDate: fromDate, toDate: toDate),
                  child: Text(
                    formattedFromDate,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppUtils.isDarkMode(context)
                          ? context.onPrimaryColor
                          : context.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppUtils.isDarkMode(context)
                          ? context.onPrimaryColor
                          : context.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _pickDate(context, ref,
                      isFromDate: false, fromDate: fromDate, toDate: toDate),
                  child: Text(
                    formattedToDate,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppUtils.isDarkMode(context)
                          ? context.onPrimaryColor
                          : context.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(BuildContext context, WidgetRef ref,
      {required bool isFromDate,
      required DateTime fromDate,
      required DateTime toDate}) async {
    final initialDate = isFromDate ? fromDate : toDate;
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (newDate != null) {
      if (isFromDate) {
        ref.read(dashboardProvider.notifier).updateFromDate(newDate);
        if (toDate.isBefore(fromDate)) {
          ref
              .read(dashboardProvider.notifier)
              .updateToDate(fromDate.add(Duration(days: 30)));
        }
      } else {
        ref.read(dashboardProvider.notifier).updateToDate(newDate);
        toDate = newDate;
      }
    }
  }
}
