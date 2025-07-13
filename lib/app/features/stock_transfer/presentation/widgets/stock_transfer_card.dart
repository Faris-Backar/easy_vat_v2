import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockTransferCard extends StatelessWidget {
  final StockTransferListEntity stockTransfer;
  final ValueNotifier<bool> isSelectedNotifier;
  const StockTransferCard(
      {super.key,
      required this.stockTransfer,
      required this.isSelectedNotifier});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isSelectedNotifier.value = !isSelectedNotifier.value,
      child: ValueListenableBuilder(
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
                          color: Colors.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: SvgIcon(icon: Assets.icons.stockTransfer),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${context.translate(AppStrings.stockTransferNo)}: ${stockTransfer.transferNo ?? "-"}",
                                style: context.textTheme.bodySmall?.copyWith(
                                    color: context.defaultTextColor
                                        .withValues(alpha: 0.9)),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "${context.translate(AppStrings.refNo)}: ${stockTransfer.referenceNo ?? ""}",
                                style: context.textTheme.bodySmall?.copyWith(
                                    color: context.defaultTextColor
                                        .withValues(alpha: 0.9)),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    DateFormatUtils.getCustomDateFormat(
                                        date: stockTransfer.transferDate ??
                                            DateTime.now(),
                                        formate: "dd-MM-yyyy - hh:MM a"),
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(
                                            color: context.defaultTextColor
                                                .withValues(alpha: 0.9)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                ],
                              )
                            ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "₹ ${stockTransfer.totalNetCost?.toStringAsFixed(2) ?? "0.00"}",
                            style: context.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
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
                    _buildExpandedDetails(context)
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
        _buildDetailRow(context,
            label: context.translate(AppStrings.totalSellValue),
            value:
                "₹ ${stockTransfer.totalSellValue?.toStringAsFixed(2) ?? "0.0"}",
            isTotal: true),
        _buildDetailRow(context,
            label: context.translate(AppStrings.totalNetCost),
            value:
                "₹ ${stockTransfer.totalNetCost?.toStringAsFixed(2) ?? "0.00"}")
      ],
    );
  }

  Widget _buildDetailRow(BuildContext context,
      {required String label, required String value, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label:",
            style: context.textTheme.bodySmall?.copyWith(
                color: context.defaultTextColor.withValues(alpha: 0.7),
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal)),
        Text(value,
            style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isTotal
                    ? context.defaultTextColor
                    : context.defaultTextColor.withValues(alpha: 0.8)))
      ],
    );
  }
}
