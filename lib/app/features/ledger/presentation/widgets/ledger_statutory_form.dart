import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LedgerStatutoryForm extends ConsumerStatefulWidget {
  const LedgerStatutoryForm({super.key});

  @override
  ConsumerState<LedgerStatutoryForm> createState() =>
      _LedgerStatutoryFormState();
}

class _LedgerStatutoryFormState extends ConsumerState<LedgerStatutoryForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.translate(AppStrings.statutoryinfo),
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Expanded(
                    child: DropdownField(
                      label: context.translate(AppStrings.taxebility),
                      valueNotifier: ValueNotifier(null),
                      items: ["Taxable", "Not Taxable"],
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : context.surfaceColor,
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: CustomTextField(
                      label: context.translate(AppStrings.taxRate),
                      controller: SearchController(),
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
