import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:flutter/material.dart';

class SalesTransactionCard extends StatelessWidget {
  final SalesListEntity salesInvoice;

  const SalesTransactionCard({super.key, required this.salesInvoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppUtils.isDarkMode(context)
            ? Color(0xFF2B2E30)
            : const Color(0xFFF9F9F9),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.translate(AppStrings.salesNo),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.defaultTextColor.withValues(alpha: 0.32),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      salesInvoice.salesOrderNo ?? "",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: context.defaultTextColor.withValues(alpha: 0.75),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.translate(AppStrings.salesDate),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.defaultTextColor.withValues(alpha: 0.32),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      DateFormatUtils.getFormettedTime(
                          date: salesInvoice.saleDate ?? DateTime.now()),
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: context.defaultTextColor.withValues(alpha: 0.75),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.translate(AppStrings.customer),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.defaultTextColor.withValues(alpha: 0.32),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3),
                    Text(
                      salesInvoice.customerName ?? "",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: context.defaultTextColor.withValues(alpha: 0.75),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.translate(AppStrings.soldBy),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.defaultTextColor.withValues(alpha: 0.32),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 3),
                    Text(
                      salesInvoice.soldBy ?? "",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: context.defaultTextColor.withValues(alpha: 0.75),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.translate(AppStrings.netTotal),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.defaultTextColor.withValues(alpha: 0.32),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 3),
                    Text(
                      salesInvoice.netTotal?.toStringAsFixed(2) ?? "",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: context.defaultTextColor.withValues(alpha: 0.75),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
