import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal_cart/journal_cart_provider.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/widgets/ledger_info_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewJournalForm extends ConsumerStatefulWidget {
  final TextEditingController journalNoController;
  final TextEditingController refNoController;
  final TextEditingController descriptionController;

  const AddNewJournalForm({
    super.key,
    required this.journalNoController,
    required this.refNoController,
    required this.descriptionController,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewJournalFormState();
}

class _AddNewJournalFormState extends ConsumerState<AddNewJournalForm> {
  @override
  void initState() {
    super.initState();

    final cart = ref.read(journalCartProvider);
    widget.journalNoController.text = cart.journalNo ?? "";
    widget.refNoController.text = cart.refNo ?? "";
    widget.descriptionController.text = cart.description ?? "";

    widget.refNoController.addListener(() {
      ref
          .read(journalCartProvider.notifier)
          .setRefNo(widget.refNoController.text);
    });

    widget.descriptionController.addListener(() {
      ref
          .read(journalCartProvider.notifier)
          .setDescription(widget.descriptionController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final entryMode = ref.watch(entryModeProvider);

    return Column(
      children: [
        Row(
          children: [
            // Entry Mode Dropdown
            Expanded(
              child: DropdownButton<EntryModeState>(
                value: entryMode,
                onChanged: (EntryModeState? newValue) {
                  if (newValue != null) {
                    ref.read(entryModeProvider.notifier).setEntryMode(newValue);
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: const EntryModeState.singleEntry(),
                    child: Text("Single Entry"),
                  ),
                  DropdownMenuItem(
                    value: const EntryModeState.doubleEntry(),
                    child: Text("Double Entry"),
                  ),
                ],
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
            Consumer(
              builder: (context, ref, child) {
                return entryMode.when(
                    singleEntry: () =>
                        Expanded(flex: 3, child: LedgerInfoWidget()),
                    doubleEntry: () => const SizedBox.shrink());
              },
            ),
            // ValueListenableBuilder<String?>(
            //   valueListenable: widget.entryModeNotifier,
            //   builder: (context, entryMode, __) {
            //     return entryMode == "Single Entry"
            //         ? Expanded(
            //             flex: 3,
            //             child: LedgerInfoWidget(),
            //           )
            //         : const SizedBox.shrink();
            //   },
            // ),
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
                    fillColor: context.surfaceColor,
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
