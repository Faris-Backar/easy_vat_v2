import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesTransactionCard extends StatelessWidget {
  final SalesInvoiceListEntity salesInvoice;
  final ValueNotifier<bool> isSelectedNotifier;
  final bool isTaxEnabled;

  const SalesTransactionCard(
      {super.key,
      required this.salesInvoice,
      required this.isSelectedNotifier,
      this.isTaxEnabled = false});

  Color _getPaymentMethodColor(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case 'cash':
        return Colors.green;
      case 'card':
        return Colors.blue;
      case 'bank':
        return Colors.purple;
      case 'credit':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _getPaymentMethodIcon(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case 'cash':
        return Icons.account_balance_wallet;
      case 'card':
        return Icons.credit_card;
      case 'bank':
        return Icons.account_balance;
      case 'credit':
        return Icons.payment;
      default:
        return Icons.help_outline;
    }
  }

  String _getPaymentMethodDisplayName(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case 'cash':
        return 'Cash';
      case 'card':
        return 'Card';
      case 'bank':
        return 'Bank';
      case 'credit':
        return 'Credit';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethod = salesInvoice.saleMode?.toLowerCase() ?? "cash";
    final color = _getPaymentMethodColor(paymentMethod);
    final icon = _getPaymentMethodIcon(paymentMethod);

    return GestureDetector(
      onTap: () => isSelectedNotifier.value = !isSelectedNotifier.value,
      child: ValueListenableBuilder<bool>(
        valueListenable: isSelectedNotifier,
        builder: (context, isSelected, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppUtils.isDarkMode(context)
                  ? const Color(0xFF2B2E30)
                  : const Color(0xFFF9F9F9),
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5)
                  : null,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    // Status Icon Container
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Main Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            salesInvoice.customerName?.toString() ?? "Cash",
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "${context.translate(AppStrings.saleNo)}: ${salesInvoice.saleNo ?? "-"}",
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.defaultTextColor
                                  .withValues(alpha: 0.7),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "${context.translate(AppStrings.refNo)}: ${salesInvoice.referenceNo ?? "-"}",
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.defaultTextColor
                                  .withValues(alpha: 0.7),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          // Status and Date Row
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: color.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  _getPaymentMethodDisplayName(paymentMethod),
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: color,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                DateFormatUtils.getCustomDateFormat(
                                  formate: "dd MMM yy - hh:mm a",
                                  date: salesInvoice.saleDate ?? DateTime.now(),
                                ),
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "₹ ${salesInvoice.netTotal?.toStringAsFixed(2) ?? "0.00"}",
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          width: 85.w,
                          child: Text(
                            salesInvoice.soldBy ?? "",
                            style: context.textTheme.labelSmall?.copyWith(
                              color: Colors.grey.shade500,
                            ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Expanded Details Section (when selected)
                if (isSelected) ...[
                  SizedBox(height: 12.h),
                  Divider(
                    color: context.defaultTextColor.withValues(alpha: 0.1),
                    thickness: 1,
                  ),
                  SizedBox(height: 8.h),
                  _buildExpandedDetails(context),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildExpandedDetails(BuildContext context) {
    return Column(
      children: [
        // Financial Details
        if (isTaxEnabled) ...[
          _buildDetailRow(
            context,
            label: context.translate(AppStrings.subTotal),
            value:
                "₹ ${salesInvoice.grossAmount?.toStringAsFixed(2) ?? "0.00"}",
          ),
          SizedBox(height: 4.h),
          _buildDetailRow(
            context,
            label: context.translate(AppStrings.totalTax),
            value: "₹ ${salesInvoice.tax?.toStringAsFixed(2) ?? "0.00"}",
          ),
          SizedBox(height: 4.h),
        ],
        _buildDetailRow(
          context,
          label: context.translate(AppStrings.discount),
          value: "₹ ${salesInvoice.discount?.toStringAsFixed(2) ?? "0.00"}",
        ),
        SizedBox(height: 4.h),
        _buildDetailRow(
          context,
          label: context.translate(AppStrings.total),
          value: "₹ ${salesInvoice.netTotal?.toStringAsFixed(2) ?? "0.00"}",
          isTotal: true,
        ),
      ],
    );
  }

  Widget _buildDetailRow(BuildContext context,
      {required String label, required String value, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$label:",
          style: context.textTheme.bodySmall?.copyWith(
            color: context.defaultTextColor.withValues(alpha: 0.7),
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: isTotal
                ? context.defaultTextColor
                : context.defaultTextColor.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoColumn(BuildContext context,
      {required String label, required String value}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.translate(label),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.defaultTextColor.withValues(alpha: 0.32),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: context.defaultTextColor.withValues(alpha: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}
