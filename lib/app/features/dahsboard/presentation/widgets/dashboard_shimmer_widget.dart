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
        _buildSummaryCardShimmer(context),
        SizedBox(height: 16.h),
        _buildFinanceReportShimmer(context),
        SizedBox(height: 16.h),
        _buildFinanceCardShimmer(context),
        SizedBox(height: 16.h),
        _buildFinanceCardShimmer(context),
      ],
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
          colors: [
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
                _shimmerBox(80.w, 16.h),
                SizedBox(height: 8.h),
                _shimmerBox(120.w, 24.h),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    _balanceIndicator(),
                    SizedBox(width: 20.w),
                    _balanceIndicator(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinanceReportShimmer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceBright,
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
          _shimmerBox(100.w, 18.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _shimmerBox(16.w, 16.h, isCircle: true),
                SizedBox(width: 8.w),
                _shimmerBox(60.w, 14.h),
                SizedBox(width: 8.w),
                _shimmerBox(8.w, 14.h),
                SizedBox(width: 8.w),
                _shimmerBox(60.w, 14.h),
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
        color: context.colorScheme.surfaceBright,
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
                  _shimmerBox(100.w, 18.h),
                  SizedBox(height: 4.h),
                  _shimmerBox(80.w, 14.h),
                ],
              ),
              _shimmerBox(36.w, 36.h, isCircle: true),
            ],
          ),
          SizedBox(height: 16.h),
          _shimmerBox(120.w, 24.h),
          SizedBox(height: 16.h),
          Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (_) => _shimmerBox(double.infinity, 10.h),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _balanceIndicator() {
    return Row(
      children: [
        _shimmerBox(10.w, 10.h, isCircle: true),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _shimmerBox(40.w, 12.h),
            SizedBox(height: 2.h),
            _shimmerBox(50.w, 14.h),
          ],
        ),
      ],
    );
  }

  Widget _shimmerBox(double width, double height, {bool isCircle = false}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: isCircle ? null : BorderRadius.circular(4.r),
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
