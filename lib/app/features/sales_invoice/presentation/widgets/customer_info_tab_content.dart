import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerInfoTabContent extends StatelessWidget {
  final String customerName;
  final String outstandingAmount;
  final String creditDays;
  final String creditLimit;
  final String trn;
  final bool isActive;
  const CustomerInfoTabContent(
      {super.key,
      required this.customerName,
      required this.outstandingAmount,
      required this.creditDays,
      required this.creditLimit,
      required this.trn,
      this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.customer,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: context.defaultTextColor.withValues(alpha: 0.50),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: isActive
                      ? CustomColors.activeGreenColor(context)
                      : CustomColors.inActiveRedColor(context)),
              child: Text(
                isActive ? AppStrings.active : AppStrings.overdue,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
          width: double.infinity,
          child: Text(
            customerName,
            style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500, overflow: TextOverflow.clip),
          ),
        ),
        _buildTransactionsHeaders(
          context,
          content: outstandingAmount,
          label: AppStrings.outstanding,
        ),
        _buildTransactionsHeaders(
          context,
          content: creditLimit,
          label: AppStrings.creditLimit,
        ),
        _buildTransactionsHeaders(
          context,
          content: creditDays,
          label: AppStrings.creditDays,
        ),
        _buildTransactionsHeaders(
          context,
          content: trn,
          label: AppStrings.trn,
        ),
      ],
    );
  }

  _buildTransactionsHeaders(
    BuildContext context, {
    required String label,
    required String content,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.defaultTextColor.withValues(alpha: 0.50),
          ),
        ),
        Text(
          content,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
