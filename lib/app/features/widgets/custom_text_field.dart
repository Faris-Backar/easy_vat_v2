import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? passwordvisibility;
  final String? hint;
  final String? Function(String? value)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int maxLines;
  final bool enabled;
  final double? height;
  final double? width;
  final double? labelAndTextfieldGap;
  final Color? fillColor;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Function(String)? onFieldSubmitted;
  const CustomTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.suffixIcon,
      this.passwordvisibility,
      this.hint,
      this.textInputAction,
      this.validator,
      this.textInputType,
      this.maxLines = 1,
      this.enabled = true,
      this.height,
      this.width,
      this.labelAndTextfieldGap,
      this.fillColor,
      this.onChanged,
      this.prefixIcon,
      this.style,
      this.onTap,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: labelAndTextfieldGap ?? 5),
        TextInputFormField(
          height: height,
          width: width,
          onTap: onTap,
          enabled: enabled,
          controller: controller,
          fillColor: fillColor,
          suffixIcon: suffixIcon,
          isPasswordVisible: passwordvisibility,
          hintDecoration: context.textTheme.bodyMedium
              ?.copyWith(color: context.colorScheme.outline),
          hint: hint,
          prefixIcon: prefixIcon,
          textInputAction: textInputAction,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: maxLines,
          contentPadding: maxLines != 1
              ? EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0)
              : null,
          style: style ??
              context.textTheme.bodyMedium
                  ?.copyWith(color: context.colorScheme.onSurface),
          textInputType: textInputType,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
