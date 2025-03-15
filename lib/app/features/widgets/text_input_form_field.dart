import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class TextInputFormField extends StatelessWidget {
  const TextInputFormField(
      {super.key,
      this.hint,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.isPasswordVisible,
      this.textInputAction,
      this.textInputType,
      this.onChanged,
      this.fillColor,
      this.borderRadius,
      this.validator,
      this.contentPadding,
      this.hintDecoration,
      this.style,
      this.cursorColor,
      this.maxLines,
      this.autovalidateMode,
      this.onFieldSubmitted,
      this.enabled = true,
      this.height,
      this.onTap,
      this.width,
      this.label,
      this.textAlign});
  final String? hint;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isPasswordVisible;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final Color? fillColor;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintDecoration;
  final TextStyle? style;
  final Color? cursorColor;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;
  final Function(String)? onFieldSubmitted;
  final bool enabled;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final String? label;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        enabled: enabled,
        onTap: onTap,
        obscureText: isPasswordVisible ?? false,
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        obscuringCharacter: '*',
        onChanged: onChanged,
        validator: validator,
        textAlign: textAlign ?? TextAlign.start,
        autovalidateMode: autovalidateMode,
        decoration: InputDecoration(
          labelText: label,
          contentPadding:
              contentPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: enabled
              ? (fillColor ?? context.colorScheme.tertiaryContainer)
              : context.colorScheme.secondaryContainer.withValues(alpha: 0.5),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: BorderSide(color: context.primaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: BorderSide(color: context.primaryColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: BorderSide(color: context.primaryColor)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
                color: context.colorScheme.outline.withValues(alpha: .4)),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: BorderSide(
                  color: context.colorScheme.outline.withValues(alpha: .4))),
          hintText: hint,
          hintStyle: hintDecoration ??
              TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: context.defaultTextColor.withValues(alpha: .32)),
          errorStyle: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.error, fontWeight: FontWeight.w400),
        ),
        maxLines: maxLines,
        style: style,
        cursorColor: cursorColor,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
