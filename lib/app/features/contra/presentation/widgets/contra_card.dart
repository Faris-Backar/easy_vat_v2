import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContraCard extends StatelessWidget {
  final ContraEntryEntity contra;
  final ValueNotifier<bool> isSelectedNotifier;
  const ContraCard(
      {super.key, required this.contra, required this.isSelectedNotifier});

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
                            borderRadius: BorderRadius.circular(10.r)),
                        child: SvgIcon(icon: Assets.icons.contra),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              "${context.translate(AppStrings.contraNo)}: ${contra.contraNo ?? "-"}",
                              style: context.textTheme.bodySmall?.copyWith(
                                  color: context.defaultTextColor
                                      .withValues(alpha: 0.9)),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "${context.translate(AppStrings.refNo)}: ${contra.referenceNo ?? ""}",
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
                                      date: contra.contraDate ?? DateTime.now(),
                                      formate: "dd-MM-yyyy - hh:MM a"),
                                  style: context.textTheme.bodySmall?.copyWith(
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.9)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ])),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "₹ ${contra.totalAmount?.toStringAsFixed(2) ?? "0.00"}",
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
        Row(
          children: [
            Text(context.translate(AppStrings.description),
                style: context.textTheme.bodySmall?.copyWith(
                    color: context.defaultTextColor.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            Text(contra.description ?? "",
                style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.defaultTextColor.withValues(alpha: 0.8))),
          ],
        )
      ],
    );
  }
}
