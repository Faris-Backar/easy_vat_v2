import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateRangePicker extends StatefulWidget {
  final Function(DateTime fromDate) onFromDateSelected;
  final Function(DateTime toDate) onToDateSelected;
  const DateRangePicker(
      {super.key,
      required this.onFromDateSelected,
      required this.onToDateSelected});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  final ValueNotifier<DateTime> _selectedFromDate =
      ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> _selectedToDate = ValueNotifier(DateTime.now());

  Future<void> _pickFromDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedFromDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedFromDate.value = pickedDate;
      });
      widget.onFromDateSelected(_selectedFromDate.value);
    }
  }

  Future<void> _pickToDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedToDate.value,
      firstDate: _selectedFromDate.value,
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedToDate.value = pickedDate;
      });
      widget.onToDateSelected(_selectedToDate.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: AppUtils.isDarkMode(context)
          ? Theme.of(context).scaffoldBackgroundColor
          : context.colorScheme.surfaceContainerLowest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => _pickFromDate(context),
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 36.h,
              width: 131.w,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: context.colorScheme.surfaceBright,
                border: Border.all(
                  color: context.colorScheme.outline.withValues(alpha: 0.5),
                ),
              ),
              child: Row(
                children: [
                  SvgIcon(
                    icon: Assets.icons.calendar,
                    color: AppUtils.isDarkMode(context) ? Colors.white : null,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  ValueListenableBuilder(
                      valueListenable: _selectedFromDate,
                      builder: (context, DateTime fromDate, child) {
                        return Text(
                          DateFormatUtils.getDateOnly(date: fromDate),
                        );
                      }),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text("-"),
          SizedBox(
            width: 5.w,
          ),
          InkWell(
            onTap: () => _pickToDate(context),
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 36.h,
              width: 131.w,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: context.colorScheme.surfaceBright,
                border: Border.all(
                  color: context.colorScheme.outline.withValues(alpha: 0.5),
                ),
              ),
              child: Row(
                children: [
                  SvgIcon(
                    icon: Assets.icons.calendar,
                    color: AppUtils.isDarkMode(context) ? Colors.white : null,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  ValueListenableBuilder(
                      valueListenable: _selectedToDate,
                      builder: (context, DateTime toDate, child) {
                        return Text(DateFormatUtils.getDateOnly(date: toDate));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
