import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterWidget extends StatelessWidget {
  final VoidCallback onTap;
  const FilterWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 37.h,
        width: 41.w,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceBright,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.colorScheme.outline.withValues(alpha: 0.4),
          ),
        ),
        child: SvgIcon(
          height: 24,
          width: 24,
          icon: Assets.icons.filter,
          color: AppUtils.isDarkMode(context) ? Colors.white : null,
        ),
      ),
    );
  }
}
