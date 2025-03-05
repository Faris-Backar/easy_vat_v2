import 'package:easy_vat_v2/app/core/extensions/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownField extends StatelessWidget {
  final double? height;
  final String? hint;
  final String label;
  final ValueNotifier<String?> valueNotifier;
  final List<String> items;
  final double? labelAndTextFieldGap;
  final Color? backgroundColor;
  final Function(String? value) onChanged;
  const DropdownField(
      {super.key,
      required this.label,
      required this.valueNotifier,
      required this.items,
      this.height,
      this.hint,
      this.labelAndTextFieldGap,
      this.backgroundColor,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500)),
        SizedBox(height: labelAndTextFieldGap ?? 5),
        ValueListenableBuilder<String?>(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            return Container(
              height: height ?? 38.h,
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      color:
                          context.colorScheme.outline.withValues(alpha: 0.4)),
                  color: backgroundColor ?? context.surfaceColor),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  value: value,
                  isExpanded: true,
                  hint: Text(hint ?? "Select an option",
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: context.colorScheme.outline)),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: context.textTheme.bodyMedium,
                        ));
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
