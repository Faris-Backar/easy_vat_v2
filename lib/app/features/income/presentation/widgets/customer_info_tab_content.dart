import 'dart:developer';

import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income_cart/income_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              context.translate(AppStrings.customer),
              style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.defaultTextColor.withValues(alpha: 0.5)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: isActive
                      ? CustomColors.activeGreenColor(context)
                      : CustomColors.inActiveRedColor(context)),
              child: Text(
                isActive
                    ? context.translate(AppStrings.active)
                    : context.translate(AppStrings.overdue),
                style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 5,
                child: SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: Text(
                    customerName,
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.clip),
                  ),
                )),
            Consumer(
              builder: (context, ref, child) {
                if (customerName.toLowerCase() != "cash") {
                  return Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          log("Customer removed");
                          ref
                              .read(incomeCartProvider.notifier)
                              .removeCustomer();
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: context.colorScheme.error
                                  .withValues(alpha: 0.1),
                              border: Border.all(
                                  color: context.colorScheme.error
                                      .withValues(alpha: 0.3),
                                  width: 1)),
                          child: Icon(
                            Icons.close_rounded,
                            size: 16,
                            color: context.colorScheme.error,
                          ),
                        ),
                      ));
                }
                return SizedBox.shrink();
              },
            )
          ],
        ),
        _buildTransactionsHeader(context,
            label: context.translate(AppStrings.outstanding),
            content: outstandingAmount),
        _buildTransactionsHeader(context,
            label: context.translate(AppStrings.creditLimit),
            content: creditLimit),
        _buildTransactionsHeader(context,
            label: context.translate(AppStrings.creditDays),
            content: creditDays),
        _buildTransactionsHeader(context,
            label: context.translate(AppStrings.trn), content: trn)
      ],
    );
  }

  _buildTransactionsHeader(
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
