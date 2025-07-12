import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/params/debit_note_params.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/create_debit_note/create_debit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note/debit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note_cart/debit_note_cart_provider.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/update_debit_note/update_debit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/widgets/debit_note_bottom_model_sheet.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        final isCartNotEmpty =
            (ref.watch(debitNoteCartProvider).ledgerList?.length ?? 0) > 0;
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
                    color: context.colorScheme.tertiaryContainer,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            children: [
              _buildButtonsRow(context),
              if (isCartNotEmpty) ...[
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: Consumer(
                    builder: (context, WidgetRef ref, child) {
                      ref.listen(createDebitNoteNotifierProvider,
                          (previous, next) {
                        next.mapOrNull(
                          success: (success) {
                            final successMessage =
                                "Debit Note successfully created!";

                            Fluttertoast.showToast(
                                msg: successMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);
                            ref
                                .read(debitNoteCartProvider.notifier)
                                .clearDebitNoteCart();
                            context.router.popForced();
                            ref
                                .read(debitNoteNotifierProvider.notifier)
                                .fetchDebitNote(
                                    params: DebitNoteParams(
                                        debitNoteIDPK: PrefResources.emptyGuid,
                                        fromDate: ref
                                            .read(dateRangeProvider)
                                            .fromDate,
                                        toDate: ref
                                            .read(dateRangeProvider)
                                            .toDate));
                          },
                          failure: (message) => ScaffoldMessenger.of(context)
                              .showSnackBar(
                                  SnackBar(content: Text(message.error))),
                        );
                      });

                      ref.listen(updateDebitNoteNotifierProvider,
                          (previous, next) {
                        next.mapOrNull(
                          success: (message) {
                            final successMessage =
                                "Debit Note successfully updated!";

                            Fluttertoast.showToast(
                                msg: successMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);
                            ref
                                .read(debitNoteCartProvider.notifier)
                                .clearDebitNoteCart();
                            context.router.popForced();
                            ref
                                .read(debitNoteNotifierProvider.notifier)
                                .fetchDebitNote(
                                    params: DebitNoteParams(
                                        debitNoteIDPK: PrefResources.emptyGuid,
                                        fromDate: ref
                                            .read(dateRangeProvider)
                                            .fromDate,
                                        toDate: ref
                                            .read(dateRangeProvider)
                                            .toDate));
                          },
                          failure: (message) => ScaffoldMessenger.of(context)
                              .showSnackBar(
                                  SnackBar(content: Text(message.error))),
                        );
                      });
                      if (ref.read(debitNoteCartProvider).isForUpdate == true) {
                        final state =
                            ref.watch(updateDebitNoteNotifierProvider);
                        return state.maybeWhen(
                          orElse: () => PrimaryButton(
                            label:
                                ref.read(debitNoteCartProvider).isForUpdate ==
                                        true
                                    ? context.translate(AppStrings.update)
                                    : context.translate(AppStrings.save),
                            isLoading: false,
                            onPressed: () async =>
                                await _createUpdateDebitNote(ref),
                          ),
                          loading: () => PrimaryButton(
                            label: context.translate(AppStrings.save),
                            isLoading: true,
                            onPressed: () {},
                          ),
                        );
                      } else {
                        final state =
                            ref.watch(createDebitNoteNotifierProvider);
                        return state.maybeWhen(
                          orElse: () => PrimaryButton(
                            label:
                                ref.read(debitNoteCartProvider).isForUpdate ==
                                        true
                                    ? context.translate(AppStrings.update)
                                    : context.translate(AppStrings.save),
                            isLoading: false,
                            onPressed: () async =>
                                await _createUpdateDebitNote(ref),
                          ),
                        );
                      }
                    },
                  ),
                )
              ]
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
                showDebitNoteBottomSheet(context);
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

  _createUpdateDebitNote(WidgetRef ref) async {
    final cartPrvd = ref.read(debitNoteCartProvider.notifier);
    cartPrvd.setDebitNoteNo(widget.debitNoteNoController.text);
    cartPrvd.setPaymentMode(widget.paymentModeNotifier.value ?? "");
    cartPrvd.setRefNo(widget.refNoController.text);
    cartPrvd.setPurchasedBy(widget.purchasedByController.text);

    if (cartPrvd.paymentMode.toLowerCase() == "credit" &&
        cartPrvd.selectedSupplier == null) {
      Fluttertoast.showToast(
          msg: context.translate(AppStrings.pleaseSelectASupplier));
    } else {
      final newDebitNote = await cartPrvd.createNewDebitNote();

      if (ref.read(debitNoteCartProvider).isForUpdate == true) {
        ref
            .read(updateDebitNoteNotifierProvider.notifier)
            .updateDebitNote(request: newDebitNote);
      } else {
        ref
            .read(createDebitNoteNotifierProvider.notifier)
            .createDebitNote(request: newDebitNote);
      }
    }
  }
}
