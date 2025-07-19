import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewSupplierForm extends ConsumerStatefulWidget {
  const AddNewSupplierForm({super.key});

  @override
  ConsumerState<AddNewSupplierForm> createState() => _AddNewSupplierFormState();
}

class _AddNewSupplierFormState extends ConsumerState<AddNewSupplierForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: context.translate(AppStrings.supplierCode),
                controller: SearchController(),
                height: 38.h,
                labelAndTextfieldGap: 2,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: context.translate(AppStrings.supplierName),
                controller: SearchController(),
                height: 38.h,
                labelAndTextfieldGap: 2,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: context.translate(AppStrings.creditLimit),
                controller: SearchController(),
                height: 38.h,
                labelAndTextfieldGap: 2,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: CustomTextField(
              label: context.translate(AppStrings.creditPeriod),
              controller: SearchController(),
              height: 38.h,
              labelAndTextfieldGap: 2,
            ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomTextField(
                label: context.translate(AppStrings.openBal),
                controller: SearchController(),
                height: 38.h,
                labelAndTextfieldGap: 2,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: DropdownField(
                label: "",
                valueNotifier: ValueNotifier(null),
                items: ["Dr", "Cr"],
                backgroundColor: AppUtils.isDarkMode(context)
                    ? context.colorScheme.tertiaryContainer
                    : context.surfaceColor,
                onChanged: (value) {},
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomTextField(
                label: context.translate(AppStrings.currentBal),
                controller: SearchController(),
                height: 38.h,
                labelAndTextfieldGap: 2,
                enabled: false,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: CustomTextField(
                label: "",
                controller: SearchController(),
                height: 38.h,
                labelAndTextfieldGap: 2,
                enabled: false,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
              child: DropdownField(
                label: context.translate(AppStrings.paymentMode),
                valueNotifier: ValueNotifier(null),
                items: ["cash", "bank", "card", "credit"],
                onChanged: (value) {},
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 5,
          thickness: 3,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextField(
              label: context.translate(AppStrings.mailingName),
              controller: SearchController(),
              height: 38.h,
              labelAndTextfieldGap: 2,
            ))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextField(
              label: context.translate(AppStrings.contactPerson),
              controller: SearchController(),
              height: 38.h,
              labelAndTextfieldGap: 2,
            ))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextField(
              label: context.translate(AppStrings.contactNo),
              controller: SearchController(),
              height: 38.h,
              labelAndTextfieldGap: 2,
            ))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextField(
              label: context.translate(AppStrings.address),
              controller: SearchController(),
              maxLines: 5,
              labelAndTextfieldGap: 2,
            ))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextField(
              label: context.translate(AppStrings.mobile),
              controller: SearchController(),
              maxLines: 5,
              labelAndTextfieldGap: 2,
            ))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextField(
              label: context.translate(AppStrings.phone),
              controller: SearchController(),
              maxLines: 5,
              labelAndTextfieldGap: 2,
            ))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Expanded(
              child: DropdownField(
                label: context.translate(AppStrings.country),
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
        Row(
          children: [
            Expanded(
              child: DropdownField(
                label: context.translate(AppStrings.emirates),
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
        Divider(
          height: 5,
          thickness: 3,
        ),
        SizedBox(
          height: 10.h,
        ),
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
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 5,
          thickness: 3,
        ),
        SizedBox(
          height: 10.h,
        ),
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
    );
  }
}
