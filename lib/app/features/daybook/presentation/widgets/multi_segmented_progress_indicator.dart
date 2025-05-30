import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiSegmentProgressBar extends StatelessWidget {
  final double sales = 0.25;
  final double income = 0.35;
  final double expenses = 0.2;
  final double purchases = 0.2;

  const MultiSegmentProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 5.sp,
        child: Row(
          children: [
            Expanded(
              flex: (sales * 100).toInt(),
              child: Container(color: Colors.green.shade400),
            ),
            Expanded(
              flex: (income * 100).toInt(),
              child: Container(color: Colors.blue.shade400),
            ),
            Expanded(
              flex: (expenses * 100).toInt(),
              child: Container(color: Colors.red.shade400),
            ),
            Expanded(
              flex: (purchases * 100).toInt(),
              child: Container(color: Colors.orange.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
