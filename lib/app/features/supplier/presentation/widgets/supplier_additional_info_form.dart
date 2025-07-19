import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupplierAdditionalInfoForm extends ConsumerStatefulWidget {
  const SupplierAdditionalInfoForm({super.key});

  @override
  ConsumerState<SupplierAdditionalInfoForm> createState() =>
      _SupplierAdditionalInfoFormState();
}

class _SupplierAdditionalInfoFormState
    extends ConsumerState<SupplierAdditionalInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
