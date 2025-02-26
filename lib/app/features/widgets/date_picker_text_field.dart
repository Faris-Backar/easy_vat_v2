import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerTextField extends StatefulWidget {
  final Function(DateTime data) onDateSelected;
  const DatePickerTextField({super.key, required this.onDateSelected});

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final _selectedDate = ValueNotifier(DateTime.now());
  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate.value,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _selectedDate.value = pickedDate;
      widget.onDateSelected(_selectedDate.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pickDate(context),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
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
                builder: (context, DateTime toDate, child) {
                  return Text(DateFormatUtils.getDateOnly(date: toDate));
                }),
          ],
        ),
      ),
    );
  }
}
