import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTransactionCard extends StatelessWidget {
  final String paymentMethod;
  final ValueNotifier<bool> isSelectedNotifier;
  final bool isTaxEnabled;
  final String? title;
  final String? subtitle;
  final String? transactionId;
  final String? transactionTitle;
  final String? referenceNo;
  final String? referenceTitle;
  final double? amount;
  final String? status;
  final String? user;
  final DateTime? date;
  final double? tax;
  final double? discount;
  final double? grossAmount;
  final double? netAmount;
  final String? transactionBy;
  const CustomTransactionCard(
      {super.key,
      this.paymentMethod = "cash",
      required this.isSelectedNotifier,
      this.isTaxEnabled = false,
      this.title,
      this.subtitle,
      this.transactionId,
      this.referenceNo,
      this.amount,
      this.status,
      this.user,
      this.date,
      this.tax,
      this.discount,
      this.netAmount,
      this.grossAmount,
      this.referenceTitle,
      this.transactionTitle,
      this.transactionBy});

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
      case 'quotation':
        return Colors.green;
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
        return Icons.person_rounded;
      case 'quotation':
        return Icons.receipt_long;
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
      case 'quotation':
        return 'Quotation';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            title ?? "Cash",
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "${context.translate(transactionTitle ?? AppStrings.saleNo)}: ${transactionId ?? "-"} \t ${context.translate(referenceTitle ?? AppStrings.invNo)}: ${referenceNo ?? "-"}",
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.defaultTextColor
                                  .withValues(alpha: 0.7),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.h),

                          // Status and Date Row - FIXED FOR OVERFLOW
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 2.h),
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
                              Expanded(
                                child: Text(
                                  DateFormatUtils.getCustomDateFormat(
                                    formate: "dd-MMM-yyyy-hh:mm a",
                                    date: date ?? DateTime.now(),
                                  ),
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: Colors.grey.shade600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                          "₹ ${netAmount?.toStringAsFixed(2) ?? "0.00"}",
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          width: 85.w,
                          child: Text(
                            transactionBy ?? "-",
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
            value: "₹ ${grossAmount?.toStringAsFixed(2) ?? "0.00"}",
          ),
          SizedBox(height: 4.h),
          _buildDetailRow(
            context,
            label: context.translate(AppStrings.totalTax),
            value: "₹ ${tax?.toStringAsFixed(2) ?? "0.00"}",
          ),
          SizedBox(height: 4.h),
        ],
        _buildDetailRow(
          context,
          label: context.translate(AppStrings.discount),
          value: "₹ ${discount?.toStringAsFixed(2) ?? "0.00"}",
        ),
        SizedBox(height: 4.h),
        _buildDetailRow(
          context,
          label: context.translate(AppStrings.total),
          value: "₹ ${netAmount?.toStringAsFixed(2) ?? "0.00"}",
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
}
