import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/customer_info_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewSalesForm extends StatefulWidget {
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
  State<AddNewSalesForm> createState() => _AddNewSalesFormState();
}

class _AddNewSalesFormState extends State<AddNewSalesForm> {
  final _viewMoreNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
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
                  DatePickerTextField(
                    label: AppStrings.date,
                    onDateSelected: (data) {},
                    labelAndTextfieldGap: 2,
                    backgroundColor: AppUtils.isDarkMode(context)
                        ? context.colorScheme.tertiaryContainer
                        : null,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownField(
                    label: AppStrings.salesMode,
                    valueNotifier: widget.salesModeNotifier,
                    items: ["item 1", "Item 2"],
                    backgroundColor: AppUtils.isDarkMode(context)
                        ? context.colorScheme.tertiaryContainer
                        : context.surfaceColor,
                  ),
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
              child: DropdownField(
                height: 38.h,
                labelAndTextFieldGap: 2,
                label: AppStrings.salesMode,
                valueNotifier: widget.soldByNotifier,
                items: ["item 1", "Item 2"],
                backgroundColor: AppUtils.isDarkMode(context)
                    ? context.colorScheme.tertiaryContainer
                    : context.surfaceColor,
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
}
