import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';

class ExpenseSlidableWidget extends StatelessWidget {
  final VoidCallback onEditTap;
  final VoidCallback onPrintTap;
  final VoidCallback onDeleteTap;
  const ExpenseSlidableWidget(
      {super.key,
      required this.onEditTap,
      required this.onPrintTap,
      required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: 44.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VerticalDivider(
            color: Colors.transparent,
            width: 4,
          ),
          Column(
            children: [
              Expanded(
                child: _buildSlidableAction(
                    color: AppUtils.isDarkMode(context)
                        ? CustomColors.getTransactionSkyBlueColor(context)
                        : CustomColors.getTransactionSkyBlueColor(context)
                            .withValues(alpha: 0.2),
                    icon: Assets.icons.print,
                    iconColor: AppUtils.isDarkMode(context)
                        ? context.onPrimaryColor
                        : null,
                    ontap: () {}),
              ),
              Expanded(
                child: _buildSlidableAction(
                    color: AppUtils.isDarkMode(context)
                        ? CustomColors.getTransactionCardBlueColor(context)
                        : CustomColors.getTransactionCardBlueColor(context)
                            .withValues(alpha: 0.2),
                    icon: Assets.icons.view,
                    iconColor: AppUtils.isDarkMode(context)
                        ? context.onPrimaryColor
                        : null,
                    ontap: onEditTap),
              ),
              Expanded(
                  child: _buildSlidableAction(
                      color: AppUtils.isDarkMode(context)
                          ? CustomColors.getTransactionCardRedColor(context)
                          : CustomColors.getTransactionCardRedColor(context)
                              .withValues(alpha: 0.2),
                      icon: Assets.icons.delete,
                      iconColor: AppUtils.isDarkMode(context)
                          ? context.onPrimaryColor
                          : null,
                      ontap: () {}))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSlidableAction(
      {required String icon,
      required Color color,
      Color? iconColor,
      required VoidCallback ontap}) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            height: 68.h,
            width: 40.w,
            color: color,
            padding: const EdgeInsets.all(10.0),
            child: SvgIcon(
              height: 18,
              width: 18,
              icon: icon,
              color: iconColor,
            ),
          ),
        ),
        Divider(
          height: 4,
          color: Colors.transparent,
        )
      ],
    );
  }
}
