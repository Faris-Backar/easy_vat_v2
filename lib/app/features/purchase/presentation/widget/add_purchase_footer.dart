import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/items_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/create_purchase/create_purchase_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/purchase/purchase_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/update_purchase/update_purchase_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/download_sales/download_sales_invoices_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/update_sales/update_sales_notifier.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_confirmation_dialog.dart';
import 'package:easy_vat_v2/app/features/widgets/loader_dialogue.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPurchaseFooterWidget extends StatefulWidget {
  final TextEditingController purchaseNoController;
  final TextEditingController supInvNoController;
  final ValueNotifier<String?> purchaseModeNotifier;
  final ValueNotifier<String?> purchasedByNotifier;
  final String? purchaseType;
  const AddPurchaseFooterWidget({
    super.key,
    this.purchaseType,
    required this.purchaseNoController,
    required this.supInvNoController,
    required this.purchaseModeNotifier,
    required this.purchasedByNotifier,
  });

  @override
  State<AddPurchaseFooterWidget> createState() => _AddSalesFooterWidgetState();
}

class _AddSalesFooterWidgetState extends State<AddPurchaseFooterWidget> {
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
                    ref.listen(downloadsalesInvoiceNotifierProvider,
                        (previous, next) {
                      next.maybeWhen(
                        downloadCompleted: (pdfPath) {
                          LoaderDialog.hide(context);
                          ref.read(cartProvider.notifier).clearCart();
                          context.router.popForced();
                          context.router.popForced();
                        },
                        loading: () => LoaderDialog.show(context),
                        failure: (error) {
                          LoaderDialog.hide(context);
                          Fluttertoast.showToast(
                            msg: error,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        },
                        orElse: () {},
                      );
                    });

                    ref.listen(createPurchaseProvider, (previous, next) {
                      next.mapOrNull(
                        loaded: (success) {
                          String successMessage;
                          final purchseType =
                              widget.purchaseType?.toLowerCase();
                          if (purchseType ==
                              context
                                  .translate(AppStrings.addNewSales)
                                  .toLowerCase()) {
                            successMessage =
                                "purchase invoice successfully created!";
                          } else if (purchseType ==
                              context
                                  .translate(AppStrings.addNewSalesQuatation)
                                  .toLowerCase()) {
                            successMessage =
                                "purchase quotation successfully created!";
                          } else if (purchseType ==
                              context
                                  .translate(AppStrings.addNewSalesReturn)
                                  .toLowerCase()) {
                            successMessage =
                                "purchase return successfully created!";
                          } else {
                            successMessage =
                                "purchase order successfully created!";
                          }
                          Fluttertoast.showToast(
                            msg: successMessage,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                          showDialog<bool>(
                            context: context,
                            builder: (context) => CustomConfirmationDialog(
                              title: context.translate(AppStrings.print),
                              message: context.translate(
                                  AppStrings.doYouWantToPrintInvoice),
                              primaryButtonLabel:
                                  context.translate(AppStrings.print),
                              secondaryButtonLabel:
                                  context.translate(AppStrings.cancel),
                              primaryButtonColor: context.colorScheme.primary,
                              onPrimaryTap: () async {
                                ref
                                    .read(purchaseProvider.notifier)
                                    .clearPurchase(ref);
                                context.router.popForced();
                                context.router.popForced();
                              },
                              onSecondaryTap: () {
                                ref
                                    .read(purchaseProvider.notifier)
                                    .clearPurchase(ref);
                                context.router.popForced();
                                context.router.popForced();
                              },
                            ),
                          );
                        },
                        error: (message) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message.message)),
                        ),
                      );
                    });

                    ref.listen(updatePurchaseProvider, (previous, next) {
                      next.mapOrNull(
                        loaded: (success) {
                          String successMessage;
                          final purchaseType =
                              widget.purchaseType?.toLowerCase();
                          if (purchaseType ==
                              context
                                  .translate(AppStrings.addNewPurchase)
                                  .toLowerCase()) {
                            successMessage =
                                "Purchase invoice successfully updated!";
                          }
                          // else if (purchaseType ==
                          //     context
                          //         .translate(AppStrings.addNewPurchase)
                          //         .toLowerCase()) {
                          //   successMessage =
                          //       "Purchase quotation successfully updated!";
                          // }
                          else if (purchaseType ==
                              context
                                  .translate(AppStrings.addNewPurchaseReturn)
                                  .toLowerCase()) {
                            successMessage =
                                "Purchase return successfully updated!";
                          } else {
                            successMessage =
                                "Purchase order successfully updated!";
                          }

                          Fluttertoast.showToast(
                            msg: successMessage,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                          ref.read(cartProvider.notifier).clearCart();
                          context.router.popForced();
                        },
                        error: (message) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message.message)),
                        ),
                      );
                    });

                    if (ref.read(purchaseProvider).isForUpdate == true) {
                      final state = ref.watch(updateSalesNotifierProvider);
                      return state.maybeWhen(
                        orElse: () => PrimaryButton(
                            label:
                                ref.read(purchaseProvider).isForUpdate == true
                                    ? context.translate(AppStrings.update)
                                    : context.translate(AppStrings.save),
                            isLoading: false,
                            onPressed: () async =>
                                await _createUpdatePurchase(ref)),
                        loading: () => PrimaryButton(
                          label: context.translate(AppStrings.save),
                          isLoading: true,
                          onPressed: () {},
                        ),
                      );
                    } else {
                      final state = ref.watch(createPurchaseProvider);
                      return state.maybeWhen(
                        orElse: () => PrimaryButton(
                            label: ref.read(cartProvider).isForUpdate == true
                                ? context.translate(AppStrings.update)
                                : context.translate(AppStrings.save),
                            isLoading: false,
                            onPressed: () async =>
                                await _createUpdatePurchase(ref)),
                        loading: () => PrimaryButton(
                          label: context.translate(AppStrings.save),
                          isLoading: true,
                          onPressed: () {},
                        ),
                      );
                    }
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
        Expanded(
          child: Consumer(
            builder: (context, WidgetRef ref, child) {
              return _buildActionButton(
                context,
                Icons.add_circle_outline_rounded,
                context.translate(AppStrings.addItem),
                () {
                  showItemsBottomSheet(context);
                },
              );
            },
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildActionButton(
              context,
              Assets.icons.barcode,
              context.translate(AppStrings.scanBarCode),
              () => context.router.pushNamed(AppRouter.barcodeScanner),
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

  _createUpdatePurchase(WidgetRef ref) async {
    final purchasePrvdr = ref.read(purchaseProvider.notifier);
    purchasePrvdr.setPurchaseNo(widget.purchaseNoController.text);
    purchasePrvdr.setPurchaseMode(widget.purchaseModeNotifier.value ?? "");
    purchasePrvdr.setSupInvNo(widget.supInvNoController.text);
    if (purchasePrvdr.purchasedBy == null) {
      final salesman = ref.watch(salesManProvider.notifier).salesManList;
      if (salesman.isNotEmpty) {
        purchasePrvdr.setPurchasedBy(salesman.first);
      }
    }
    final purchaseType = widget.purchaseType?.toLowerCase() ??
        context.translate(AppStrings.addNewSalesOrder);

    if (purchasePrvdr.purchaseMode.toLowerCase() == "credit" &&
        purchasePrvdr.selectedSupplier == null) {
      Fluttertoast.showToast(
          msg: context.translate(AppStrings.pleaseSelectACustomer));
    } else {
      if (purchaseType ==
          context.translate(AppStrings.addNewSalesOrder).toLowerCase()) {
        // final newSaleOrder = await purchasePrvdr.createNewSaleOrder();
        // ref
        //     .read(createSalesNotifierProvider.notifier)
        //     .createSalesOrder(request: newSaleOrder);
      } else if (purchaseType ==
          context.translate(AppStrings.addNewPurchase).toLowerCase()) {
        final newPurchaseInvoice = await ref
            .read(purchaseProvider.notifier)
            .createNewPurchaseInvoice(ref);
        if (ref.read(purchaseProvider).isForUpdate == true) {
          ref
              .read(updatePurchaseProvider.notifier)
              .updatePurchaseInvoice(params: newPurchaseInvoice);
        } else {
          ref
              .read(createPurchaseProvider.notifier)
              .createPurchaseInvoice(newPurchaseInvoice);
        }
      } else if (purchaseType ==
          context.translate(AppStrings.addNewPurchaseReturn).toLowerCase()) {
        final newPurchaseInvoice = await ref
            .read(purchaseProvider.notifier)
            .createNewPurchaseReturn(ref);
        if (ref.read(purchaseProvider).isForUpdate == true) {
          ref
              .read(updatePurchaseProvider.notifier)
              .updatePurchaseReturn(params: newPurchaseInvoice);
        } else {
          ref
              .read(createPurchaseProvider.notifier)
              .createPurchaseReturn(newPurchaseInvoice);
        }
      }
    }
  }
}
