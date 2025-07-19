import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LedgerAdditionalInfoForm extends ConsumerStatefulWidget {
  const LedgerAdditionalInfoForm({super.key});

  @override
  ConsumerState<LedgerAdditionalInfoForm> createState() =>
      _LedgerAdditionalInfoFormState();
}

class _LedgerAdditionalInfoFormState
    extends ConsumerState<LedgerAdditionalInfoForm> {
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
                context.translate(AppStrings.additionalInfo),
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    label: context.translate(AppStrings.description),
                    controller: SearchController(),
                    maxLines: 5,
                    labelAndTextfieldGap: 2,
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
