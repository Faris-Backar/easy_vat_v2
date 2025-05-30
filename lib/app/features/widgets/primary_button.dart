import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlineButton;
  final Widget? child;
  final Color? bgColor;
  final double? height;
  final double? width;
  const PrimaryButton(
      {super.key,
      this.label = "",
      this.onPressed,
      this.isLoading = false,
      this.isOutlineButton = false,
      this.child,
      this.bgColor,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: isOutlineButton ? BorderSide(color: Colors.black) : null,
          backgroundColor:
              isOutlineButton ? null : (bgColor ?? context.colorScheme.primary),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : child ??
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isOutlineButton ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w500),
                ),
      ),
    );
  }
}
