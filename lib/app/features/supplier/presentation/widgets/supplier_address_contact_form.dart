import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplierAddressContactForm extends ConsumerStatefulWidget {
  const SupplierAddressContactForm({super.key});

  @override
  ConsumerState<SupplierAddressContactForm> createState() =>
      _SupplierAddressContactFormState();
}

class _SupplierAddressContactFormState
    extends ConsumerState<SupplierAddressContactForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              label: context.translate(AppStrings.phone),
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
      ],
    );
  }
}
