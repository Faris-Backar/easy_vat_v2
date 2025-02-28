import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerInfoTabContent extends StatelessWidget {
  final String customerName;
  final String outstandingAmount;
  final String creditDays;
  final String creditLimit;
  final String trn;
  const CustomerInfoTabContent(
      {super.key,
      required this.customerName,
      required this.outstandingAmount,
      required this.creditDays,
      required this.creditLimit,
      required this.trn});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.customer,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colorScheme.outline,
          ),
        ),
        SizedBox(
          height: 40.h,
          child: Text(
            customerName,
            style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
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
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colorScheme.outline,
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
