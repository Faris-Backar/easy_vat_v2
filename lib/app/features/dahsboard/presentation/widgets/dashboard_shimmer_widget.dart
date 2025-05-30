import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';

class DashboardShimmerWidget extends StatelessWidget {
  const DashboardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        // Finance Report Shimmer
        _buildFinanceReportShimmer(context),
        SizedBox(height: 20.h),
        // Dashboard Summary Card Shimmer
        _buildSummaryCardShimmer(context),
        SizedBox(height: 16.h),
        // Financial Overview Section Shimmer
        _buildFinancialOverviewShimmer(context),
        SizedBox(height: 16.h),
        // Finance Cards Shimmers
        _buildFinanceCardShimmer(context),
        SizedBox(height: 16.h),
        _buildFinanceCardShimmer(context),
      ],
    );
  }

  Widget _buildFinanceReportShimmer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
      decoration: BoxDecoration(
        color: AppUtils.isDarkMode(context)
            ? Colors.grey[850]?.withValues(alpha: 0.3)
            : context.colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _shimmerBox(context, 100.w, 18.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _shimmerBox(context, 16.w, 16.h, isCircle: true),
                SizedBox(width: 8.w),
                _shimmerBox(context, 60.w, 14.h),
                SizedBox(width: 8.w),
                _shimmerBox(context, 8.w, 14.h),
                SizedBox(width: 8.w),
                _shimmerBox(context, 60.w, 14.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCardShimmer(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppUtils.isDarkMode(context)
              ? [
                  Colors.grey[850]!.withValues(alpha: 0.8),
                  Colors.grey[800]!.withValues(alpha: 0.9),
                ]
              : [
                  Color(0xFF27165D).withValues(alpha: 0.3),
                  context.secondaryColor.withValues(alpha: 0.3),
                ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: _circle(100, 0.05),
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: _circle(120, 0.03),
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _shimmerBox(context, 80.w, 16.h),
                SizedBox(height: 8.h),
                _shimmerBox(context, 120.w, 24.h),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    _balanceIndicator(context),
                    SizedBox(width: 20.w),
                    _balanceIndicator(context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialOverviewShimmer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title shimmer
        _shimmerBox(context, 150.w, 20.h),
        SizedBox(height: 12.h),
        // First row of cards
        Row(
          children: [
            Expanded(child: _buildFinancialSummaryCardShimmer(context)),
            SizedBox(width: 12.w),
            Expanded(child: _buildFinancialSummaryCardShimmer(context)),
          ],
        ),
        SizedBox(height: 12.h),
        // Second row of cards
        Row(
          children: [
            Expanded(child: _buildFinancialSummaryCardShimmer(context)),
            SizedBox(width: 12.w),
            Expanded(child: _buildFinancialSummaryCardShimmer(context)),
          ],
        ),
      ],
    );
  }

  Widget _buildFinancialSummaryCardShimmer(BuildContext context) {
    final isDarkMode = AppUtils.isDarkMode(context);

    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        gradient: isDarkMode
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[850]!.withValues(alpha: 0.4),
                  Colors.grey[800]!.withValues(alpha: 0.5),
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.8),
                  Colors.grey[50]!.withValues(alpha: 0.9),
                ],
              ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.grey.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Background shimmer icon
          Positioned(
            right: -5,
            top: -5,
            child:
                _shimmerBox(context, 60.w, 60.h, isCircle: true, opacity: 0.03),
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
                    // Icon container shimmer
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: _shimmerBox(context, 20.w, 20.h),
                    ),
                    // Percentage indicator shimmer
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: Colors.grey.withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _shimmerBox(context, 12.w, 12.h, isCircle: true),
                          SizedBox(width: 4.w),
                          _shimmerBox(context, 30.w, 10.h),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title shimmer
                    _shimmerBox(context, 60.w, 12.h),
                    SizedBox(height: 6.h),
                    // Amount shimmer
                    _shimmerBox(context, 80.w, 18.h),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinanceCardShimmer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppUtils.isDarkMode(context)
            ? Colors.grey[850]?.withValues(alpha: 0.3)
            : context.colorScheme.surfaceBright,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerBox(context, 100.w, 18.h),
                  SizedBox(height: 4.h),
                  _shimmerBox(context, 80.w, 14.h),
                ],
              ),
              _shimmerBox(context, 36.w, 36.h, isCircle: true),
            ],
          ),
          SizedBox(height: 16.h),
          _shimmerBox(context, 120.w, 24.h),
          SizedBox(height: 16.h),
          // Chart area shimmer with wavy pattern
          Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.grey.withValues(alpha: 0.05),
            ),
            child: Stack(
              children: [
                // Animated bars pattern
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(8, (index) {
                    final heights = [
                      60.h,
                      80.h,
                      45.h,
                      100.h,
                      70.h,
                      55.h,
                      90.h,
                      65.h
                    ];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: _shimmerBox(
                        context,
                        20.w,
                        heights[index % heights.length],
                        opacity: 0.3,
                      ),
                    );
                  }),
                ),
                // Overlay gradient for chart effect
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.grey.withValues(alpha: 0.1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _balanceIndicator(BuildContext context) {
    return Row(
      children: [
        _shimmerBox(context, 10.w, 10.h, isCircle: true),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _shimmerBox(context, 40.w, 12.h),
            SizedBox(height: 2.h),
            _shimmerBox(context, 50.w, 14.h),
          ],
        ),
      ],
    );
  }

  Widget _shimmerBox(
    BuildContext context,
    double width,
    double height, {
    bool isCircle = false,
    double opacity = 1.0,
  }) {
    return Shimmer.fromColors(
      baseColor: AppUtils.isDarkMode(context)
          ? Colors.grey[700]!.withValues(alpha: 0.3 * opacity)
          : Colors.grey[300]!.withValues(alpha: opacity),
      highlightColor: AppUtils.isDarkMode(context)
          ? Colors.grey[600]!.withValues(alpha: 0.5 * opacity)
          : Colors.grey[100]!.withValues(alpha: opacity),
      period: Duration(milliseconds: 1200),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppUtils.isDarkMode(context)
              ? Colors.grey[700]?.withValues(alpha: 0.3 * opacity)
              : Colors.grey[300]?.withValues(alpha: opacity),
          borderRadius: isCircle ? null : BorderRadius.circular(6.r),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  Widget _circle(double size, double opacity) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}
