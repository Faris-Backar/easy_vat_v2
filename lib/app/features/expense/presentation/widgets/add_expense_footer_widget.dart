import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/expense_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/create_expense/create_expense_notifier.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/update_expense/update_expense_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddExpenseFooterWidget extends StatefulWidget {
  // final TextEditingController expenseNoController;
  // final TextEditingController refNoController;
  // final ValueNotifier<String?> paymentModeNotifier;
  // final ValueNotifier<String?> purchasedByNotifier;
  const AddExpenseFooterWidget({super.key});

  //     required this.expenseNoController,
  //     required this.refNoController,
  //     required this.paymentModeNotifier,
  //     required this.purchasedByNotifier

  @override
  State<AddExpenseFooterWidget> createState() => _AddExpenseFooterWidgetState();
}

class _AddExpenseFooterWidgetState extends State<AddExpenseFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final isCartNotEmpty =
          (ref.watch(cartProvider).itemList?.length ?? 0) > 0;
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isCartNotEmpty ? 107.h : 67.h,
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
                  blurStyle: BlurStyle.outer),
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
                child: Consumer(builder: (context, WidgetRef ref, child) {
                  ref.listen(createExpenseNotifierProvider, (previous, next) {
                    next.mapOrNull(
                        success: (success) {
                          final successMessage =
                              "Expense successfully created!";

                          Fluttertoast.showToast(
                              msg: successMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                          ref.read(cartProvider.notifier).clearCart();
                          context.router.popForced();
                        },
                        failure: (message) => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text(message.error))));
                  });

                  ref.listen(updateExpenseNotifierProvider, (previous, next) {
                    next.mapOrNull(
                        success: (success) {
                          final successMessage =
                              "Expense successfully updates!";

                          Fluttertoast.showToast(
                              msg: successMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                          ref.read(cartProvider.notifier).clearCart();
                          context.router.popForced();
                        },
                        failure: (message) => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text(message.error))));
                  });
                  if (ref.read(cartProvider).isForUpdate == true) {
                    final state = ref.watch(updateExpenseNotifierProvider);
                    return state.maybeWhen(
                      orElse: () => PrimaryButton(
                          label: ref.read(cartProvider).isForUpdate == true
                              ? context.translate(AppStrings.update)
                              : context.translate(AppStrings.save),
                          isLoading: false,
                          onPressed: () {}), //await _createUpdateExpense(ref),
                      loading: () => PrimaryButton(
                        label: context.translate(AppStrings.save),
                        isLoading: true,
                        onPressed: () {},
                      ),
                    );
                  } else {
                    final state = ref.watch(createExpenseNotifierProvider);
                    return state.maybeWhen(
                        orElse: () => PrimaryButton(
                              label: ref.read(cartProvider).isForUpdate == true
                                  ? context.translate(AppStrings.update)
                                  : context.translate(AppStrings.save),
                              isLoading: false,
                              onPressed: () {},
                              // await _createUpdateExpense(ref),
                            ));
                  }
                }),
              )
            ]
          ],
        ),
      );
    });
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
                showExpenseBottomSheet(context);
              });

              // return FloatingActionButton.extended(
              //   onPressed: () {
              //     showItemsBottomSheet(context);
              //   },
              //   icon: Icon(Icons.add_circle_outline_rounded),
              //   label: Text(context.translate(AppStrings.addLedger)),
              //   backgroundColor: Theme.of(context).colorScheme.primary,
              //   foregroundColor: Theme.of(context).colorScheme.onPrimary,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadiusGeometry.circular(8)),

              // );
            },
          ),
        ),
        // SizedBox(
        //   width: 8.w,
        // ),
        // Expanded(
        //   child: _buildActionButton(
        //       context,
        //       Assets.icons.barcode,
        //       context.translate(AppStrings.scanBarCode),
        //       () => context.router.pushNamed(AppRouter.barcodeScanner),
        //       isSvg: true),
        // ),
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
