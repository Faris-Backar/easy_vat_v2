import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewExpenseForm extends ConsumerStatefulWidget {
  final TextEditingController refNoController;
  const AddNewExpenseForm({super.key, required this.refNoController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewExpenseFormState();
}

class _AddNewExpenseFormState extends ConsumerState<AddNewExpenseForm> {
  final _viewMoreNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paymentModeState = ref.watch(paymentModeNotifierProvider);
    return Column(
      children: [
        Row(
          children: [
            // Expanded(child: ) // supplier info widget
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                      // child: CustomTextField(label: context.translate(AppStrings.expenseNo,),
                      ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    label: context.translate(AppStrings.refNo),
                    controller: widget.refNoController,
                    hint: context.translate(AppStrings.enterRefNumber),
                    labelAndTextfieldGap: 2,
                    height: 38.h,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return DatePickerTextField(
                        label: context.translate(AppStrings.date),
                        onDateSelected: (data) {},
                        labelAndTextfieldGap: 2,
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : null,
                      );
                    },
                  )
                ],
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
              child: paymentModeState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                error: (message) => Text('Error: $message'),
                loaded: (paymentModes, selectedPaymentMode) {
                  if (paymentModes.isNotEmpty)
                  //widget.salesModeNotifier.value == null
                  {
                    //final defaultSelection =
                    //  _getDefaultSelection(paymentModes);
                    WidgetsBinding.instance.addPostFrameCallback((_) {});
                  }
                  return Container(); // dropdownfield
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
          valueListenable: _viewMoreNotifier,
          builder: (BuildContext context, bool isExpanded, Widget? child) {
            return AnimatedContainer(
              duration: Duration(microseconds: 500),
              height: isExpanded ? 80.h : 0.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      //Expanded(child: cashLedgerstate.maybeWhen())
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
