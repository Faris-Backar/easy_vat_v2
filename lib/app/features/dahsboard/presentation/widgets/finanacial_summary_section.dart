import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinanacialSummaryCardGrid extends StatelessWidget {
  const FinanacialSummaryCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Financial Overview',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppUtils.isDarkMode(context) ? Colors.white : Colors.black87,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildModernSummaryCard(
                context,
                title: context.translate(AppStrings.cash),
                amount: 1800.00,
                icon: Icons.account_balance_wallet_rounded,
                gradientColors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                percentage: '+5.2%',
                isPositive: true,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildModernSummaryCard(
                context,
                title: context.translate(AppStrings.bank),
                amount: 3800.00,
                icon: Icons.account_balance_rounded,
                gradientColors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
                percentage: '+8.1%',
                isPositive: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildModernSummaryCard(
                context,
                title: context.translate(AppStrings.payable),
                amount: 800.00,
                icon: Icons.payment_rounded,
                gradientColors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
                percentage: '-2.3%',
                isPositive: false,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildModernSummaryCard(
                context,
                title: context.translate(AppStrings.recievable),
                amount: 5800.00,
                icon: Icons.account_balance_wallet_outlined,
                gradientColors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
                percentage: '+12.7%',
                isPositive: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildModernSummaryCard(
    BuildContext context, {
    required String title,
    required double amount,
    required IconData icon,
    required List<Color> gradientColors,
    required String percentage,
    required bool isPositive,
  }) {
    final isDarkMode = AppUtils.isDarkMode(context);

    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        gradient: isDarkMode
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[850]!.withValues(alpha: 0.8),
                  Colors.grey[800]!.withValues(alpha: 0.9),
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.grey[50]!,
                ],
              ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.grey.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.grey.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Background icon (subtle)
          Positioned(
            right: -10,
            top: -10,
            child: Icon(
              icon,
              size: 80,
              color: gradientColors[0].withValues(alpha: 0.05),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradientColors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: gradientColors[0].withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: isPositive
                            ? Colors.green.withValues(alpha: 0.1)
                            : Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: isPositive
                              ? Colors.green.withValues(alpha: 0.3)
                              : Colors.red.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isPositive
                                ? Icons.trending_up_rounded
                                : Icons.trending_down_rounded,
                            color: isPositive ? Colors.green : Colors.red,
                            size: 12,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            percentage,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: isPositive ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "₹ ${amount.toStringAsFixed(0)}",
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                        fontSize: 18.sp,
                      ),
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
}
