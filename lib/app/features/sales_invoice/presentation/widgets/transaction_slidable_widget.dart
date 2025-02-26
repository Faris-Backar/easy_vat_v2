import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionSlidableActionWidget extends StatelessWidget {
  const TransactionSlidableActionWidget({super.key});

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
                    color: CustomColors.getTransactionSkyBlueColor(context)
                        .withValues(alpha: .2),
                    icon: Assets.icons.print,
                    ontap: () {}),
              ),
              Expanded(
                child: _buildSlidableAction(
                    color: CustomColors.getTransactionCardBlueColor(context)
                        .withValues(alpha: .2),
                    icon: Assets.icons.edit,
                    ontap: () {}),
              ),
              Expanded(
                child: _buildSlidableAction(
                    color: Color(0xFF2E3EBF).withValues(alpha: .2),
                    icon: Assets.icons.view,
                    ontap: () {}),
              ),
              Expanded(
                child: _buildSlidableAction(
                    color: CustomColors.getTransactionCardRedColor(context)
                        .withValues(alpha: .2),
                    icon: Assets.icons.delete,
                    ontap: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlidableAction(
      {required String icon,
      required Color color,
      required VoidCallback ontap}) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            height: 50.h,
            width: 40.w,
            color: color,
            padding: const EdgeInsets.all(10.0),
            child: SvgIcon(height: 18, width: 18, icon: icon),
          ),
        ),
        Divider(
          height: 4,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
