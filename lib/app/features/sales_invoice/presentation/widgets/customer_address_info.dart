import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerAddressInfo extends StatelessWidget {
  final String address;
  const CustomerAddressInfo({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.address,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colorScheme.outline,
          ),
        ),
        SizedBox(
          height: 40.h,
          child: Text(
            address,
            style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
