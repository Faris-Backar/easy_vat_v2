import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra_cart/contra_cart_provider.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/debit_ledger_info_widget.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_state.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewContraForm extends ConsumerStatefulWidget {
  final TextEditingController contraNoController;
  final TextEditingController refNoController;
  final TextEditingController descriptionController;
  final TextEditingController notesController;
  const AddNewContraForm(
      {super.key,
      required this.contraNoController,
      required this.refNoController,
      required this.descriptionController,
      required this.notesController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewContraFormState();
}

class _AddNewContraFormState extends ConsumerState<AddNewContraForm> {
  @override
  void initState() {
    super.initState();

    final cart = ref.read(contraCartProvider);
    widget.contraNoController.text = cart.contraNo ?? "";
    widget.refNoController.text = cart.refNo ?? "";
    widget.descriptionController.text = cart.description ?? "";
    widget.notesController.text = cart.notes ?? "";

    widget.refNoController.addListener(() {
      ref
          .read(contraCartProvider.notifier)
          .setRefNo(widget.refNoController.text);
    });

    widget.descriptionController.addListener(() {
      ref
          .read(contraCartProvider.notifier)
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
            Expanded(
              child: DropdownButton<EntryModeState>(
                value: entryMode,
                onChanged: (EntryModeState? newValue) {
                  if (newValue != null) {
                    ref.read(contraCartProvider.notifier).clearContraCart();
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
                label: context.translate(AppStrings.contraNo),
                controller: widget.contraNoController,
                height: 38.h,
                labelAndTextfieldGap: 2,
                hint: context.translate(AppStrings.contraNo),
                fillColor: context.surfaceColor,
                enabled: false,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return entryMode.when(
                    singleEntry: () =>
                        Expanded(flex: 3, child: DebitLedgerInfoWidget()),
                    doubleEntry: () => const SizedBox.shrink());
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
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
                  Consumer(
                    builder: (context, ref, child) {
                      return DatePickerTextField(
                        label: context.translate(AppStrings.date),
                        onDateSelected: (date) {
                          ref
                              .read(contraCartProvider.notifier)
                              .setContraDate(date);
                        },
                        labelAndTextfieldGap: 2,
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : null,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
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
            )
          ],
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
