import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

class CustomTextTheme extends TextTheme {
  const CustomTextTheme._();

  static TextStyle header(BuildContext context) => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppUtils.isDarkMode(context)
          ? context.colorScheme.primaryContainer
          : context.colorScheme.primaryContainer.withValues(alpha: 0.5));
}
