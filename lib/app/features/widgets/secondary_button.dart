import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final String label;
  final VoidCallback onPressed;
  const SecondaryButton(
      {super.key,
      this.backgroundColor,
      this.child,
      required this.onPressed,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
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
            "",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
    );
  }
}
