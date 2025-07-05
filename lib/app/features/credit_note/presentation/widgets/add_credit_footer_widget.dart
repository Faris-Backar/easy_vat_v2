import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/create_credit_note/create_credit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note_cart/credit_note_cart_provider.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/update_credit_note/update_credit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/widgets/credit_note_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCreditFooterWidget extends StatefulWidget {
  final TextEditingController creditNoteNoController;
  final TextEditingController refNoController;
  final TextEditingController soldByController;
  final ValueNotifier<String?> paymentMethodNotifier;
  const AddCreditFooterWidget(
      {super.key,
      required this.creditNoteNoController,
      required this.refNoController,
      required this.paymentMethodNotifier,
      required this.soldByController});

  @override
  State<AddCreditFooterWidget> createState() => _AddCreditFooterWidgetState();
}

class _AddCreditFooterWidgetState extends State<AddCreditFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final isCartNotEmpty =
          (ref.watch(creditNoteCartProvider).ledgerList?.length ?? 0) > 0;
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isCartNotEmpty ? 107.h : 67.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
        decoration: BoxDecoration(
            color: AppUtils.isDarkMode(context)
                ? context.colorScheme.tertiaryContainer
                : context.surfaceColor,
            boxShadow: [
              BoxShadow(
                  color: context.colorScheme.shadow.withValues(alpha: 0.5),
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer)
            ]),
        child: Column(
          children: [
            _buildButtonsRow(context),
            if (isCartNotEmpty) ...[
              SizedBox(height: 6),
              SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: Consumer(builder: (context, WidgetRef ref, child) {
                    ref.listen(createCreditNoteNotifierProvider,
                        (previous, next) {
                      next.mapOrNull(
                          success: (success) {
                            final successMessage =
                                "Credit Note successfully created!";

                            Fluttertoast.showToast(
                                msg: successMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);
                            ref
                                .read(creditNoteCartProvider.notifier)
                                .clearCreditNoteCart();
                            context.router.popForced();
                          },
                          failure: (message) => ScaffoldMessenger.of(context)
                              .showSnackBar(
                                  SnackBar(content: Text(message.error))));
                    });

                    ref.listen(updateCreditNoteNotifierProvider,
                        (previous, next) {
                      next.mapOrNull(
                          success: (success) {
                            final successMessage =
                                "Credit Note successfully updated!";

                            Fluttertoast.showToast(
                                msg: successMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);
                            ref
                                .read(creditNoteCartProvider.notifier)
                                .clearCreditNoteCart();
                            context.router.popForced();
                          },
                          failure: (message) => ScaffoldMessenger.of(context)
                              .showSnackBar(
                                  SnackBar(content: Text(message.error))));
                    });
                    if (ref.read(creditNoteCartProvider).isForUpdate == true) {
                      final state = ref.watch(updateCreditNoteNotifierProvider);
                      return state.maybeWhen(
                          orElse: () => PrimaryButton(
                              label: ref
                                          .read(creditNoteCartProvider)
                                          .isForUpdate ==
                                      true
                                  ? context.translate(AppStrings.update)
                                  : context.translate(AppStrings.save),
                              isLoading: false,
                              // createUpdateCreditNote
                              onPressed: () async =>
                                  await _createUpdateCreditNote(ref)),
                          loading: () => PrimaryButton(
                                label: context.translate(AppStrings.save),
                                isLoading: true,
                                onPressed: () {},
                              ));
                    } else {
                      final state = ref.watch(createCreditNoteNotifierProvider);

                      return state.maybeWhen(
                        orElse: () => PrimaryButton(
                            label:
                                ref.read(creditNoteCartProvider).isForUpdate ==
                                        true
                                    ? context.translate(AppStrings.update)
                                    : context.translate(AppStrings.save),
                            isLoading: false,
                            // createUpdateCreditNote
                            onPressed: () async =>
                                await _createUpdateCreditNote(ref)),
                      );
                    }
                  }))
            ]
          ],
        ),
      );
    });
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Consumer(builder: (context, WidgetRef ref, child) {
          return _buildActionButton(context, Icons.add_circle_outline_rounded,
              context.translate(AppStrings.addLedger), () {
            showCreditNoteBottomSheet(context);
          });
        }))
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
                : Icon(icon,
                    size: 18,
                    color: (AppUtils.isDarkMode(context)
                        ? context.defaultTextColor
                        : context.colorScheme.primary)),
            SizedBox(width: 6.w),
            _styledText(context, label, isPrimary: true, isBold: true)
          ],
        ));
  }

  Widget _styledText(BuildContext context, String text,
      {bool isOutline = false, bool isPrimary = false, bool isBold = false}) {
    return Text(text,
        style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
            color: isOutline
                ? context.colorScheme.outline
                : (isPrimary
                    ? (AppUtils.isDarkMode(context)
                        ? context.defaultTextColor
                        : context.colorScheme.primary)
                    : null)));
  }

  _createUpdateCreditNote(WidgetRef ref) async {
    final cnCartPrvd = ref.read(creditNoteCartProvider.notifier);
    cnCartPrvd.setCreditNoteNo(widget.creditNoteNoController.text);
    cnCartPrvd.setRefNo(widget.refNoController.text);
    cnCartPrvd.setPaymentMode(widget.paymentMethodNotifier.value ?? "");
    cnCartPrvd.setSoldBy(widget.soldByController.text);

    if (cnCartPrvd.paymentMode.toLowerCase() == "credit" &&
        cnCartPrvd.selectedCustomer == null) {
      Fluttertoast.showToast(
          msg: context.translate(AppStrings.pleaseSelectACustomer));
    } else {
      final newCreditNote = await cnCartPrvd.createNewCreditNote();

      if (ref.read(creditNoteCartProvider).isForUpdate == true) {
        ref
            .read(updateCreditNoteNotifierProvider.notifier)
            .updateCreditNote(request: newCreditNote);
      } else {
        ref
            .read(createCreditNoteNotifierProvider.notifier)
            .createCreditNote(request: newCreditNote);
      }
    }
  }
}
