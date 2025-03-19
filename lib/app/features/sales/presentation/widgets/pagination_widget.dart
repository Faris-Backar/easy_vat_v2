import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPaginationInfo(context);
  }

  Widget _buildPaginationInfo(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      alignment: Alignment.center,
      color: context.colorScheme.surfaceContainerLowest,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildResultCount(context),
          _buildItemsPerPageDropdown(context),
        ],
      ),
    );
  }

  Widget _buildResultCount(BuildContext context) {
    return Text(
      "21-80 of 88 results",
      style: context.textTheme.labelMedium?.copyWith(
        color: context.colorScheme.onSurface.withValues(alpha: 0.35),
      ),
    );
  }

  Widget _buildItemsPerPageDropdown(BuildContext context) {
    return Row(
      children: [
        Text(
          "Items per page",
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.35),
          ),
        ),
        SizedBox(width: 6.w),
        Container(
          height: 28.h,
          width: 47.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                color: context.colorScheme.outline.withValues(alpha: 0.4)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("10"),
              Icon(Icons.keyboard_arrow_down_rounded, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
