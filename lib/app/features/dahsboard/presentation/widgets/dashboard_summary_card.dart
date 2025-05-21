import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardSummaryCard extends StatelessWidget {
  const DashboardSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF27165D),
            context.secondaryColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.translate(AppStrings.netBalance),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'AED 3,500',
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    _buildBalanceIndicator(
                      context,
                      label: context.translate(AppStrings.income),
                      value: '+12,000',
                      color: Color(0xFF4CAF50),
                    ),
                    SizedBox(width: 20.w),
                    _buildBalanceIndicator(
                      context,
                      label: context.translate(AppStrings.expenses),
                      value: '-8,500',
                      color: Color(0xFFF44336),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceIndicator(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          height: 10.h,
          width: 10.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 12.sp,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
