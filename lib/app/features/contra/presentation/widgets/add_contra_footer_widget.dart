import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra_cart/contra_cart_provider.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/create_contra/create_contra_notifier.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/update_contra/update_contra_notifier.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/contra_bottom_model_sheet.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_state.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddContraFooterWidget extends StatefulWidget {
  final TextEditingController contraNoController;
  final TextEditingController refNoController;
  final TextEditingController descriptionController;
  const AddContraFooterWidget(
      {super.key,
      required this.contraNoController,
      required this.refNoController,
      required this.descriptionController});

  @override
  State<AddContraFooterWidget> createState() => _AddContraFooterWidgetState();
}

class _AddContraFooterWidgetState extends State<AddContraFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final isCartNotEmpty =
          (ref.watch(contraCartProvider).ledgerList?.length ?? 0) > 0;
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: double.infinity,
        height: isCartNotEmpty ? 107.h : 67.h,
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
            _buildButtonRow(context),
            if (isCartNotEmpty) ...[
              SizedBox(
                height: 6,
              ),
              SizedBox(
                width: double.infinity,
                height: 40.h,
                child: Consumer(builder: (context, WidgetRef ref, child) {
                  ref.listen(createContraNotifierProvider, (previous, next) {
                    next.mapOrNull(
                        success: (success) {
                          final successMessage = "Contra successfully created!";

                          Fluttertoast.showToast(
                              msg: successMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                          ref
                              .read(contraCartProvider.notifier)
                              .clearContraCart();
                          context.router.popForced();
                        },
                        failure: (message) => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text(message.error))));
                  });

                  ref.listen(updateContraNotifierProvider, (previous, next) {
                    next.mapOrNull(
                        success: (success) {
                          final successMessage = "Contra successfully update!";

                          Fluttertoast.showToast(
                              msg: successMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                          ref
                              .read(contraCartProvider.notifier)
                              .clearContraCart();
                          context.router.popForced();
                        },
                        failure: (message) => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text(message.error))));
                  });
                  if (ref.read(contraCartProvider).isForUpdate == true) {
                    final state = ref.watch(updateContraNotifierProvider);
                    return state.maybeWhen(
                      orElse: () => PrimaryButton(
                        label: ref.read(contraCartProvider).isForUpdate == true
                            ? context.translate(AppStrings.update)
                            : context.translate(AppStrings.save),
                        isLoading: false,
                        onPressed: () async => await _createUpdateContra(ref),
                      ),
                      loading: () => PrimaryButton(
                        label: context.translate(AppStrings.save),
                        isLoading: true,
                        onPressed: () {},
                      ),
                    );
                  } else {
                    final state = ref.watch(createContraNotifierProvider);

                    return state.maybeWhen(
                      orElse: () => PrimaryButton(
                        label: ref.read(contraCartProvider).isForUpdate == true
                            ? context.translate(AppStrings.update)
                            : context.translate(AppStrings.save),
                        isLoading: false,
                        onPressed: () async => await _createUpdateContra(ref),
                      ),
                    );
                  }
                }),
              )
            ]
          ],
        ),
      );
    });
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Consumer(builder: (context, WidgetRef ref, child) {
            return _buildActionButtom(context, Icons.add_circle_outline_rounded,
                context.translate(AppStrings.addLedger), () {
              showLedgerBottomSheet(context);
            });
          }),
        )
      ],
    );
  }

  Widget _buildActionButtom(
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
      {bool isOutline = false, bool isPrimary = false, bool isBold = false}) {
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

  _createUpdateContra(WidgetRef ref) async {
    final cartPrvd = ref.read(contraCartProvider.notifier);

    final entryMode = ref.read(entryModeProvider);

    if (entryMode == EntryModeState.doubleEntry()) {
      final cartState = ref.read(contraCartProvider);
      if (cartState.drAmount != cartState.crAmount) {
        Fluttertoast.showToast(
            msg: "Debit amount and Credit amount must be equal!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
        return;
      }
    }

    cartPrvd.setContraNo(widget.contraNoController.text);
    cartPrvd.setRefNo(widget.refNoController.text);
    cartPrvd.setDescription(widget.descriptionController.text);

    final newContra = await cartPrvd.createNewContra();

    if (ref.read(contraCartProvider).isForUpdate == true) {
      ref
          .read(updateContraNotifierProvider.notifier)
          .updateContra(request: newContra);
    } else {
      ref
          .read(createContraNotifierProvider.notifier)
          .createContra(request: newContra);
    }
  }
}
