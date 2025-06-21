import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/widgets/ledger_info_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewJournalForm extends ConsumerStatefulWidget {
  final TextEditingController journalNoController;
  final TextEditingController refNoController;
  final TextEditingController descriptionController;
  final ValueNotifier<String?> entryModeNotifier;
  const AddNewJournalForm(
      {super.key,
      required this.journalNoController,
      required this.refNoController,
      required this.descriptionController,
      required this.entryModeNotifier});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewJournalFormState();
}

class _AddNewJournalFormState extends ConsumerState<AddNewJournalForm> {
  final ValueNotifier<String?> entryModeModifier =
      ValueNotifier<String?>("Single Entry");
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
            // Entry Mode Dropdown
            Expanded(
              child: DropdownField(
                label: context.translate(AppStrings.entryMode),
                valueNotifier: widget.entryModeNotifier,
                items: ["Single Entry", "Double Entry"],
                onChanged: (newValue) {
                  widget.entryModeNotifier.value = newValue;
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: CustomTextField(
                label: context.translate(AppStrings.journalNo),
                controller: widget.journalNoController,
                height: 38.h,
                labelAndTextfieldGap: 2,
                hint: context.translate(AppStrings.journalNo),
                fillColor: context.surfaceColor,
                enabled: false,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            // Debit Ledger Selector in Single Entry
            ValueListenableBuilder<String?>(
              valueListenable: widget.entryModeNotifier,
              builder: (context, entryMode, __) {
                return entryMode == "Single Entry"
                    ? Expanded(
                        flex: 3,
                        child: LedgerInfoWidget(),
                      )
                    : const SizedBox.shrink();
              },
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  CustomTextField(
                    label: context.translate(AppStrings.refNo),
                    controller: widget.refNoController,
                    height: 38.h,
                    hint: context.translate(AppStrings.enterRefNumber),
                    labelAndTextfieldGap: 2,
                  ),
                  SizedBox(height: 5),
                  Consumer(
                    builder: (context, ref, child) {
                      return DatePickerTextField(
                        label: context.translate(AppStrings.date),
                        onDateSelected: (date) {},
                        labelAndTextfieldGap: 2,
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: context.translate(AppStrings.description),
                    controller: widget.descriptionController,
                    hint: context.translate(AppStrings.description),
                    labelAndTextfieldGap: 2,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
