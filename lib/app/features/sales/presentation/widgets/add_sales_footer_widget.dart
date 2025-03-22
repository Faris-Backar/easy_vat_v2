import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/items_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/create_sales_inovice/create_sales_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddSalesFooterWidget extends StatefulWidget {
  final TextEditingController saleNoController;
  final TextEditingController refNoController;
  final ValueNotifier<String?> salesModeNotifier;
  final ValueNotifier<String?> soldByNotifier;
  final bool isForPurchase;
  const AddSalesFooterWidget(
      {super.key,
      required this.saleNoController,
      required this.refNoController,
      required this.salesModeNotifier,
      required this.soldByNotifier,
      this.isForPurchase = false});

  @override
  State<AddSalesFooterWidget> createState() => _AddSalesFooterWidgetState();
}

class _AddSalesFooterWidgetState extends State<AddSalesFooterWidget> {
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
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
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
                    ref.listen(createSalesNotifierProvider, (previous, next) {
                      next.mapOrNull(
                        success: (success) {
                          Fluttertoast.showToast(
                            msg: widget.isForPurchase
                                ? "Purchase order successfully created!"
                                : "Sales order successfully created!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                          ref.read(cartProvider.notifier).clearCart();
                          context.router.popForced();
                        },
                        failure: (message) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message.error)),
                        ),
                      );
                    });

                    final state = ref.watch(createSalesNotifierProvider);

                    return state.maybeWhen(
                      orElse: () => PrimaryButton(
                        label: AppStrings.save,
                        isLoading: false,
                        onPressed: ref.watch(cartProvider).isViewOnly == false
                            ? () {}
                            : () {
                                if (widget.isForPurchase) {
                                  Fluttertoast.showToast(
                                      msg: AppStrings.somethingWentWrong);
                                } else {
                                  final cartPrvd =
                                      ref.read(cartProvider.notifier);
                                  cartPrvd
                                      .setSalesNo(widget.saleNoController.text);
                                  cartPrvd.setSalesMode(
                                      widget.salesModeNotifier.value ?? "");
                                  cartPrvd
                                      .setRefNo(widget.refNoController.text);
                                  final newSale = cartPrvd.createNewSale();
                                  if (cartPrvd.salesMode.toLowerCase() ==
                                      "credit") {
                                    if (cartPrvd.selectedCustomer != null) {
                                      Fluttertoast.showToast(
                                          msg:
                                              AppStrings.pleaseSelectACustomer);
                                    } else {
                                      ref
                                          .read(createSalesNotifierProvider
                                              .notifier)
                                          .createSalesOrder(request: newSale);
                                    }
                                  } else {
                                    ref
                                        .read(createSalesNotifierProvider
                                            .notifier)
                                        .createSalesOrder(request: newSale);
                                  }
                                }
                              },
                      ),
                      loading: () => PrimaryButton(
                        label: AppStrings.save,
                        isLoading: true,
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              )
            ],
          ],
        ),
      );
    });
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Consumer(builder: (context, WidgetRef ref, child) {
          return _buildActionButton(
            context,
            Icons.add_circle_outline_rounded,
            AppStrings.addItem,
            () {
              showItemsBottomSheet(context);
            },
          );
        })),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildActionButton(
              context, Assets.icons.barcode, AppStrings.scanBarCode, () {},
              isSvg: true),
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
                      : context.colorScheme.primary))
              : Icon(
                  icon,
                  size: 18,
                  color: (AppUtils.isDarkMode(context)
                      ? context.defaultTextColor
                      : context.colorScheme.primary),
                ),
          SizedBox(width: 6.w),
          _styledText(context, label, isPrimary: true, isBold: true),
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
                : null),
      ),
    );
  }
}
