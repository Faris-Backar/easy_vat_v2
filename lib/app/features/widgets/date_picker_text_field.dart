import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerTextField extends StatefulWidget {
  final Function(DateTime data) onDateSelected;
  final String? label;
  final String? hint;
  const DatePickerTextField(
      {super.key, required this.onDateSelected, this.label, this.hint});

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier(null);
  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate.value,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _selectedDate.value = pickedDate;
      widget.onDateSelected(_selectedDate.value!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        SizedBox(
          height: 5.h,
        ),
        InkWell(
          onTap: () => _pickDate(context),
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            height: 38.h,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: context.colorScheme.surfaceContainerLowest,
              border: Border.all(
                color: context.colorScheme.outline.withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              children: [
                SvgIcon(icon: Assets.icons.calendar),
                SizedBox(
                  width: 6.w,
                ),
                ValueListenableBuilder(
                  valueListenable: _selectedDate,
                  builder: (context, DateTime? date, child) {
                    return Text(
                      date != null
                          ? DateFormatUtils.getDateOnly(date: date)
                          : AppStrings.selectDate,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: context.colorScheme.outline),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
