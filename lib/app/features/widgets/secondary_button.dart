import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final String label;
  final VoidCallback onPressed;
  final BorderSide? border;
  final Color? labelColor;
  const SecondaryButton(
      {super.key,
      this.backgroundColor,
      this.child,
      required this.onPressed,
      this.border,
      this.labelColor,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: border ??
            BorderSide(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
            ),
        backgroundColor: backgroundColor ?? Color(0xFFF9F9F9),
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: labelColor ?? Colors.white, fontWeight: FontWeight.w600),
          ),
    );
  }
}
