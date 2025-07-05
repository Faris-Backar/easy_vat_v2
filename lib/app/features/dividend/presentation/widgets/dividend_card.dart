import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividendCard extends StatelessWidget {
  final DividendListEntity dividend;
  final ValueNotifier<bool> isSelectedNotifier;
  const DividendCard(
      {super.key, required this.dividend, required this.isSelectedNotifier});

  Color _getPaymentMethodColor(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case 'cash':
        return Colors.green;
      case 'card':
        return Colors.orange;
      case 'bank':
        return Colors.red;
      case 'credit':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getPaymentMethodIcon(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case "cash":
        return Icons.account_balance_wallet;
      case "card":
        return Icons.credit_card;
      case "bank":
        return Icons.account_balance;
      case "credit":
        return Icons.payment;
      default:
        return Icons.help_outline;
    }
  }

  String _getPaymentMethodDisplayName(String paymentMethod) {
    switch (paymentMethod.toLowerCase()) {
      case "cash":
        return "Cash";
      case "card":
        return "Card";
      case "bank":
        return "Bank";
      case "credit":
        return "Credit";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethod = dividend.paymentMode?.toLowerCase() ?? "cash";
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
                      : null),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Icon(
                          icon,
                          color: color,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dividend.expenseLedger ?? "Cash",
                              style: context.textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "${context.translate(AppStrings.dividendNo)}: ${dividend.dividendNo ?? ""}   ${context.translate(AppStrings.refNo)}: ${dividend.referenceNo ?? ""}",
                              style: context.textTheme.bodySmall?.copyWith(
                                color: context.defaultTextColor
                                    .withValues(alpha: 0.9),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
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
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(
                                            color: color,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  DateFormatUtils.getCustomDateFormat(
                                    date:
                                        dividend.dividendDate ?? DateTime.now(),
                                    formate: "dd-MM-yyyy - hh:MM a",
                                  ),
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: context.defaultTextColor
                                        .withValues(alpha: 0.9),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Expanded(
                                  child: Text(
                                    dividend.issuedBy ?? "",
                                    style: context.textTheme.labelSmall
                                        ?.copyWith(
                                            color: context.defaultTextColor
                                                .withValues(alpha: 0.9)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "₹ ${dividend.netTotal?.toStringAsFixed(2) ?? "0.00"}",
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          )
                        ],
                      )
                    ],
                  ),
                  if (isSelected) ...[
                    SizedBox(
                      height: 12.h,
                    ),
                    Divider(
                      color: context.defaultTextColor.withValues(alpha: 0.1),
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    _buildExpandedDetails(context),
                  ]
                ],
              ),
            );
          }),
    );
  }

  Widget _buildExpandedDetails(BuildContext context) {
    return Column(
      children: [
        _buildDetailRow(
          context,
          label: context.translate(AppStrings.discount),
          value: "₹ ${dividend.netTotal?.toStringAsFixed(2) ?? "0.00"}",
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
