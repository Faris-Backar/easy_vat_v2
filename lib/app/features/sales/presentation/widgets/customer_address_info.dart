import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerAddressInfo extends StatelessWidget {
  final String address;
  final String hint;
  final String label;
  const CustomerAddressInfo(
      {super.key,
      required this.address,
      required this.hint,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate(AppStrings.address),
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colorScheme.outline,
          ),
        ),
        SizedBox(
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  address,
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(width: 10.0.w),
              SvgIcon(
                icon: Assets.icons.edit,
                color: AppUtils.isDarkMode(context)
                    ? context.defaultTextColor
                    : null,
              )
            ],
          ),
        ),
      ],
    );
  }
}
