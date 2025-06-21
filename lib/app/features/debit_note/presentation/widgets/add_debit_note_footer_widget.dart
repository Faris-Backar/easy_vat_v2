import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/expense_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense_cart/expense_cart_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDebitNoteFooterWidget extends StatefulWidget {
  final TextEditingController debitNoteNoController;
  final TextEditingController refNoController;
  final TextEditingController supInvNoController;
  final TextEditingController purchasedByController;
  final ValueNotifier<String?> paymentModeNotifier;
  const AddDebitNoteFooterWidget(
      {super.key,
      required this.debitNoteNoController,
      required this.refNoController,
      required this.paymentModeNotifier,
      required this.supInvNoController,
      required this.purchasedByController});

  @override
  State<AddDebitNoteFooterWidget> createState() =>
      _AddDebitNoteFooterWidgetState();
}

class _AddDebitNoteFooterWidgetState extends State<AddDebitNoteFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isExpenseCartNotEmpty =
            (ref.watch(expenseCartProvider).ledgerList?.length ?? 0) >
                0; // need to change
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isExpenseCartNotEmpty ? 107.h : 67.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
          decoration: BoxDecoration(
              color: AppUtils.isDarkMode(context)
                  ? context.colorScheme.tertiaryContainer
                  : context.surfaceColor,
              boxShadow: [
                BoxShadow(
                    color: context.colorScheme.tertiaryContainer,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            children: [
              _buildButtonsRow(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Consumer(
            builder: (context, WidgetRef ref, child) {
              return _buildActionButton(
                  context,
                  Icons.add_circle_outline_rounded,
                  context.translate(AppStrings.addLedger), () {
                showExpenseBottomSheet(context); // change this
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context, dynamic icon, String label, VoidCallback onPressed,
      {bool isSvg = false}) {
    return SecondaryButton(
      onPressed: onPressed,
      label: "",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSvg
              ? SvgIcon(
                  icon: icon,
                  color: (AppUtils.isDarkMode(context)
                      ? context.defaultTextColor
                      : context.colorScheme.primary),
                )
              : Icon(
                  icon,
                  size: 18,
                  color: (AppUtils.isDarkMode(context)
                      ? context.defaultTextColor
                      : context.colorScheme.primary),
                ),
          SizedBox(
            width: 6.w,
          ),
          _styledText(context, label, isPrimary: true, isBold: true)
        ],
      ),
    );
  }

  Widget _styledText(BuildContext context, String text,
      {bool isBold = false, bool isOutline = false, bool isPrimary = false}) {
    return Text(
      text,
      style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
          color: isOutline
              ? context.colorScheme.outline
              : (isPrimary
                  ? (AppUtils.isDarkMode(context)
                      ? context.defaultTextColor
                      : context.colorScheme.primary)
                  : null)),
    );
  }
}
