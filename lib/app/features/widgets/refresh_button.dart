import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onTap;
  const RefreshButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 36.h,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: context.colorScheme.outline.withValues(alpha: .4),
          ),
        ),
        child: Icon(Icons.refresh_rounded),
      ),
    );
  }
}
