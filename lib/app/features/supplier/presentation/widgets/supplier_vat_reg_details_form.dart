import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplierVatRegDetailsForm extends ConsumerStatefulWidget {
  const SupplierVatRegDetailsForm({super.key});

  @override
  ConsumerState<SupplierVatRegDetailsForm> createState() =>
      _SupplierVatRegDetailsFormState();
}

class _SupplierVatRegDetailsFormState
    extends ConsumerState<SupplierVatRegDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownField(
                label: context.translate(AppStrings.regType),
                valueNotifier: ValueNotifier(null),
                items: [],
                onChanged: (value) {},
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Consumer(
          builder: (context, ref, child) {
            return DatePickerTextField(
              label: context.translate(AppStrings.vatDate),
              onDateSelected: (date) {},
              labelAndTextfieldGap: 2,
              backgroundColor: AppUtils.isDarkMode(context)
                  ? context.colorScheme.tertiaryContainer
                  : null,
            );
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextField(
              label: context.translate(AppStrings.trn),
              controller: SearchController(),
              height: 38.h,
              labelAndTextfieldGap: 2,
            ))
          ],
        ),
      ],
    );
  }
}
