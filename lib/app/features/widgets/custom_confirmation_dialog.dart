import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String primaryButtonLabel;
  final String secondaryButtonLabel;
  final VoidCallback onPrimaryTap;
  final VoidCallback? onSecondaryTap;

  const CustomConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.primaryButtonLabel,
    required this.secondaryButtonLabel,
    required this.onPrimaryTap,
    this.onSecondaryTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.surfaceColor,
      title: Text(title),
      titleTextStyle: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      content: Text(message),
      contentTextStyle:
          context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      actions: [
        Row(
          children: [
            Expanded(
              child: SecondaryButton(
                width: double.infinity,
                onPressed: onSecondaryTap ?? () => context.router.popForced(),
                label: secondaryButtonLabel,
                labelColor: context.defaultTextColor,
                backgroundColor: AppUtils.isDarkMode(context)
                    ? context.colorScheme.tertiaryContainer
                    : null,
                border: BorderSide(
                  color: context.colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: PrimaryButton(
                width: double.infinity,
                label: primaryButtonLabel,
                bgColor: CustomColors.getTransactionCardRedColor(context),
                onPressed: () {
                  onPrimaryTap();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
