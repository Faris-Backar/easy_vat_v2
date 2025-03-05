import 'dart:developer';

import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/employees/presentation/providers/employee_notifiers.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_state.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/customer_info_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewSalesForm extends ConsumerStatefulWidget {
  final TextEditingController saleNoController;
  final TextEditingController refNoController;
  final ValueNotifier<String?> salesModeNotifier;
  final ValueNotifier<String?> soldByNotifier;
  const AddNewSalesForm(
      {super.key,
      required this.saleNoController,
      required this.refNoController,
      required this.salesModeNotifier,
      required this.soldByNotifier});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewSalesFormState();
}

class _AddNewSalesFormState extends ConsumerState<AddNewSalesForm> {
  final _viewMoreNotifier = ValueNotifier(false);
  late PaymentModeState paymentModeState;

  @override
  void initState() {
    super.initState();
    paymentModeState = ref.read(paymentModeNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(employeeProvider.notifier).getEmployees();
      ref.watch(paymentModeNotifierProvider.notifier).fetchPaymentModes();
    });
  }

  @override
  Widget build(BuildContext context) {
    log("State=> $paymentModeState");
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 4, child: CustomerInfoWidget()),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    child: CustomTextField(
                      label: AppStrings.salesNo,
                      controller: widget.saleNoController,
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                      hint: AppStrings.salesNo,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Consumer(builder: (context, WidgetRef ref, child) {
                    return DatePickerTextField(
                      label: AppStrings.date,
                      onDateSelected: (data) {
                        ref.read(cartProvider.notifier).setSalesDate(data);
                      },
                      labelAndTextfieldGap: 2,
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : null,
                    );
                  }),
                  SizedBox(
                    height: 5,
                  ),
                  paymentModeState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () =>
                        Center(child: CircularProgressIndicator.adaptive()),
                    error: (message) => Text('Error: $message'),
                    loaded: (paymentModes, selectedPaymentMode) {
                      if (paymentModes.isNotEmpty &&
                          widget.salesModeNotifier.value == null) {
                        final defaultSelection =
                            _getDefaultSelection(paymentModes);

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          widget.salesModeNotifier.value = defaultSelection;
                        });
                      }

                      return DropdownField(
                        label: AppStrings.salesMode,
                        valueNotifier: widget.salesModeNotifier,
                        items: paymentModes
                            .map((mode) => mode.paymentModes)
                            .toList(),
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : context.surfaceColor,
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
              child: CustomTextField(
                label: AppStrings.refNo,
                controller: widget.refNoController,
                hint: AppStrings.enterRefNumber,
                labelAndTextfieldGap: 2,
                height: 38.h,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Consumer(builder: (context, WidgetRef ref, child) {
                final state = ref.read(employeeProvider);
                return state.maybeWhen(
                  loaded: (employeeList) => DropdownField(
                    height: 38.h,
                    labelAndTextFieldGap: 2,
                    label: AppStrings.soldBy,
                    valueNotifier: widget.soldByNotifier,
                    items: employeeList.map((employee) {
                      return '${employee.firstName ?? ''} ${employee.lastName ?? ''}'
                          .trim();
                    }).toList(),
                    backgroundColor: AppUtils.isDarkMode(context)
                        ? context.colorScheme.tertiaryContainer
                        : context.surfaceColor,
                  ),
                  initial: () => Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  orElse: () => SizedBox.shrink(),
                );
              }),
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
              duration: Duration(milliseconds: 500),
              height: isExpanded ? 80.h : 0.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownField(
                          height: 38.h,
                          labelAndTextFieldGap: 2,
                          label: AppStrings.cashAccount,
                          valueNotifier: widget.soldByNotifier,
                          items: ["item 1", "Item 2"],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: DropdownField(
                          height: 38.h,
                          labelAndTextFieldGap: 2,
                          label: AppStrings.salesAccount,
                          valueNotifier: widget.soldByNotifier,
                          items: ["item 1", "Item 2"],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _viewMoreNotifier,
          builder: (BuildContext context, bool isExpanded, Widget? child) {
            return InkWell(
              onTap: () {
                _viewMoreNotifier.value = !_viewMoreNotifier.value;
              },
              child: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: AppUtils.isDarkMode(context)
                      ? context.colorScheme.tertiaryContainer
                      : context.colorScheme.secondary.withValues(alpha: 0.2),
                ),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isExpanded ? AppStrings.viewLess : AppStrings.viewMore,
                      style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.secondary),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 16.0,
                      color: context.colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String _getDefaultSelection(List<PaymentModeModel> paymentModes) {
    final cashMode = paymentModes.firstWhere(
      (mode) => mode.paymentModes.toLowerCase() == 'cash',
      orElse: () => paymentModes.first,
    );

    return cashMode.paymentModes;
  }
}
