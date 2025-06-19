import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/create_income/create_income_notifier.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income_cart/income_cart_provider.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/update_income/update_income_notifier.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/income_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddIncomeFooterWidget extends StatefulWidget {
  final TextEditingController incomeNoController;
  final TextEditingController refNoController;
  final TextEditingController soldByController;
  final ValueNotifier<String?> paymentMethodNotifier;
  const AddIncomeFooterWidget(
      {super.key,
      required this.incomeNoController,
      required this.refNoController,
      required this.paymentMethodNotifier,
      required this.soldByController});

  @override
  State<AddIncomeFooterWidget> createState() => _AddIncomeFooterWidgetState();
}

class _AddIncomeFooterWidgetState extends State<AddIncomeFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final isIncomeCartNotEmpty =
          (ref.watch(incomeCartProvider).ledgerList?.length ?? 0) > 0;
      return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isIncomeCartNotEmpty ? 107.h : 67.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
              if (isIncomeCartNotEmpty) ...[
                SizedBox(height: 6),
                SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: Consumer(builder: (context, WidgetRef ref, child) {
                      ref.listen(createIncomeNotifierProvider,
                          (previous, next) {
                        next.mapOrNull(
                            success: (success) {
                              final successMessage =
                                  "Income successfully created!";

                              Fluttertoast.showToast(
                                  msg: successMessage,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM);
                              ref
                                  .read(incomeCartProvider.notifier)
                                  .clearIncomeCart();
                              context.router.popForced();
                            },
                            failure: (message) => ScaffoldMessenger.of(context)
                                .showSnackBar(
                                    SnackBar(content: Text(message.error))));
                      });

                      ref.listen(updateIncomeNotifierProvider,
                          (previous, next) {
                        next.mapOrNull(
                            success: (success) {
                              final successMessage =
                                  "Income successfully updated!";

                              Fluttertoast.showToast(
                                  msg: successMessage,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM);
                              ref
                                  .read(incomeCartProvider.notifier)
                                  .clearIncomeCart();
                              context.router.popForced();
                            },
                            failure: (message) => ScaffoldMessenger.of(context)
                                .showSnackBar(
                                    SnackBar(content: Text(message.error))));
                      });
                      if (ref.read(incomeCartProvider).isForUpdate == true) {
                        final state = ref.watch(updateIncomeNotifierProvider);
                        return state.maybeWhen(
                            orElse: () => PrimaryButton(
                                label:
                                    ref.read(incomeCartProvider).isForUpdate ==
                                            true
                                        ? context.translate(AppStrings.update)
                                        : context.translate(AppStrings.save),
                                isLoading: false,
                                // createUpdateIncome
                                onPressed: () async =>
                                    await _createUpdateIncome(ref)),
                            loading: () => PrimaryButton(
                                  label: context.translate(AppStrings.save),
                                  isLoading: true,
                                  onPressed: () {},
                                ));
                      } else {
                        final state = ref.watch(createIncomeNotifierProvider);

                        return state.maybeWhen(
                          orElse: () => PrimaryButton(
                              label: ref.read(incomeCartProvider).isForUpdate ==
                                      true
                                  ? context.translate(AppStrings.update)
                                  : context.translate(AppStrings.save),
                              isLoading: false,
                              // createUpdateIncome
                              onPressed: () async =>
                                  await _createUpdateIncome(ref)),
                        );
                      }
                    }))
              ]
            ],
          ));
    });
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Consumer(builder: (context, WidgetRef ref, child) {
          return _buildActionButton(context, Icons.add_circle_outline_rounded,
              context.translate(AppStrings.addLedger), () {
            showIncomeBottomSheet(context);
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

  _createUpdateIncome(WidgetRef ref) async {
    final incCartPrvd = ref.read(incomeCartProvider.notifier);
    incCartPrvd.setIncomeNo(widget.incomeNoController.text);
    incCartPrvd.setRefNo(widget.refNoController.text);
    incCartPrvd.setPaymentMode(widget.paymentMethodNotifier.value ?? "");
    incCartPrvd.setSoldBy(widget.soldByController.text);

    if (incCartPrvd.paymentMode.toLowerCase() == "credit" &&
        incCartPrvd.selectedCustomer == null) {
      Fluttertoast.showToast(
          msg: context.translate(AppStrings.pleaseSelectACustomer));
    } else {
      final newIncome = await incCartPrvd.createNewIncome();

      if (ref.read(incomeCartProvider).isForUpdate == true) {
        ref
            .read(updateIncomeNotifierProvider.notifier)
            .updateIncome(request: newIncome);
      } else {
        ref
            .read(createIncomeNotifierProvider.notifier)
            .createIncome(request: newIncome);
      }
    }
  }
}
