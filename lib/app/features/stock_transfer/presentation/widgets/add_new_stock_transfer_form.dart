import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewStockTransferForm extends ConsumerStatefulWidget {
  final TextEditingController stockTransferNoController;
  final TextEditingController refNoController;
  final ValueNotifier<String?> fromStoreNotifier;
  final ValueNotifier<String?> toStoreNotifier;
  const AddNewStockTransferForm(
      {super.key,
      required this.stockTransferNoController,
      required this.refNoController,
      required this.fromStoreNotifier,
      required this.toStoreNotifier});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewStockTransferFormState();
}

class _AddNewStockTransferFormState
    extends ConsumerState<AddNewStockTransferForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  CustomTextField(
                    label: context.translate(AppStrings.stockTransferNo),
                    controller: widget.stockTransferNoController,
                    height: 38.h,
                    labelAndTextfieldGap: 2,
                    hint: context.translate(AppStrings.stockTransferNo),
                    fillColor: context.surfaceColor,
                    enabled: false,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    label: context.translate(AppStrings.refNo),
                    controller: widget.refNoController,
                    height: 38.h,
                    hint: context.translate(AppStrings.enterRefNumber),
                    labelAndTextfieldGap: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Consumer(builder: (context, WidgetRef ref, child) {
                    return DatePickerTextField(
                      label: context.translate(AppStrings.date),
                      onDateSelected: (date) {},
                      labelAndTextfieldGap: 2,
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : null,
                    );
                  }),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownField(
                    label: context.translate(AppStrings.fromStore),
                    valueNotifier: widget.fromStoreNotifier,
                    items: [],
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownField(
                    label: context.translate(AppStrings.toStore),
                    valueNotifier: widget.toStoreNotifier,
                    items: [],
                    onChanged: (value) {},
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
