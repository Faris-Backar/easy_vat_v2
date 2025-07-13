import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/items_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/pdf_viewer/pdf_viewer_screen.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/pages/add_new_sales_screen.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/create_sales/create_sales_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/download_sales/download_sales_invoices_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales/sales_notifier.dart';
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

class AddSalesFooterWidget extends StatefulWidget {
  final TextEditingController saleNoController;
  final TextEditingController refNoController;
  final ValueNotifier<String?> salesModeNotifier;
  final ValueNotifier<String?> soldByNotifier;
  final bool isForPurchase;
  final SalesType salesType;
  const AddSalesFooterWidget(
      {super.key,
      required this.saleNoController,
      required this.refNoController,
      required this.salesModeNotifier,
      required this.soldByNotifier,
      required this.salesType,
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
                    ref.listen(downloadsalesInvoiceNotifierProvider,
                        (previous, next) {
                      next.maybeWhen(
                        downloadCompleted: (pdfPath) {
                          LoaderDialog.hide(context);
                          ref.read(cartProvider.notifier).clearCart();
                          ref.read(salesProvider.notifier).clear();
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

                    ref.listen(createSalesNotifierProvider, (previous, next) {
                      next.mapOrNull(
                        success: (success) {
                          final successMessage =
                              _getCreateSuccessMessage(context);

                          Fluttertoast.showToast(
                            msg: widget.isForPurchase
                                ? "Purchase order successfully created!"
                                : successMessage,
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
                                context.router.popForced();
                                context.router.popForced();
                                ref.read(cartProvider.notifier).clearCart();
                                ref.read(salesProvider.notifier).clear();
                                context.router.push(PdfViewerRoute(
                                  pdfUrl: UrlResources.downloadSalesInvoice,
                                  pdfType: PDFType.salesInvoice,
                                  queryParameters: _getQueryParameters(success),
                                ));
                              },
                              onSecondaryTap: () {
                                ref.read(cartProvider.notifier).clearCart();
                                ref.read(salesProvider.notifier).clear();
                                context.router.popForced();
                                context.router.popForced();
                              },
                            ),
                          );
                        },
                        failure: (message) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message.error)),
                        ),
                      );
                    });

                    ref.listen(updateSalesNotifierProvider, (previous, next) {
                      next.mapOrNull(
                        success: (success) {
                          final successMessage =
                              _getUpdateSuccessMessage(context);

                          Fluttertoast.showToast(
                            msg: successMessage,
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
                    if (ref.read(cartProvider).isForUpdate == true) {
                      final state = ref.watch(updateSalesNotifierProvider);
                      return state.maybeWhen(
                        orElse: () => PrimaryButton(
                            label: ref.read(cartProvider).isForUpdate == true
                                ? context.translate(AppStrings.update)
                                : context.translate(AppStrings.save),
                            isLoading: false,
                            onPressed: () async =>
                                await _createUpdateSale(ref)),
                        loading: () => PrimaryButton(
                          label: context.translate(AppStrings.save),
                          isLoading: true,
                          onPressed: () {},
                        ),
                      );
                    } else {
                      final state = ref.watch(createSalesNotifierProvider);
                      return state.maybeWhen(
                        orElse: () => PrimaryButton(
                            label: ref.read(cartProvider).isForUpdate == true
                                ? context.translate(AppStrings.update)
                                : context.translate(AppStrings.save),
                            isLoading: false,
                            onPressed: () async =>
                                await _createUpdateSale(ref)),
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

  Map<String, dynamic> _getQueryParameters(dynamic success) {
    switch (widget.salesType) {
      case SalesType.salesInvoice:
        return {'SaleIDPK': success.salesIDPK};
      case SalesType.salesOrder:
        return {'SalesOrderIDPK': success.salesOrderIdpk};
      case SalesType.salesQuotation:
        return {'quotationIDPK': success.quotationIdpk};
      case SalesType.salesReturn:
        return {'SaleReturnIDPK': success.salesReturnIdpk};
    }
  }

  String _getCreateSuccessMessage(BuildContext context) {
    switch (widget.salesType) {
      case SalesType.salesInvoice:
        return "Sales invoice successfully created!";
      case SalesType.salesQuotation:
        return "Sales quotation successfully created!";
      case SalesType.salesReturn:
        return "Sales return successfully created!";
      case SalesType.salesOrder:
        return "Sales order successfully created!";
    }
  }

  String _getUpdateSuccessMessage(BuildContext context) {
    switch (widget.salesType) {
      case SalesType.salesInvoice:
        return "Sales invoice successfully updated!";
      case SalesType.salesQuotation:
        return "Sales quotation successfully updated!";
      case SalesType.salesReturn:
        return "Sales return successfully updated!";
      case SalesType.salesOrder:
        return "Sales order successfully updated!";
    }
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

  _createUpdateSale(WidgetRef ref) async {
    final salesPrvd = ref.read(salesProvider.notifier);
    salesPrvd.setSalesNo(widget.saleNoController.text);
    salesPrvd.setSalesMode(widget.salesModeNotifier.value ?? "");
    salesPrvd.setRefNo(widget.refNoController.text);
    if (salesPrvd.soldBy == null) {
      final salesman = ref.watch(salesManProvider.notifier).salesManList;
      if (salesman.isNotEmpty) {
        salesPrvd.setSoldBy(salesman.first);
      }
    }

    if (salesPrvd.salesMode.toLowerCase() == "credit" &&
        salesPrvd.selectedCustomer == null) {
      Fluttertoast.showToast(
          msg: context.translate(AppStrings.pleaseSelectACustomer));
    } else {
      switch (widget.salesType) {
        case SalesType.salesOrder:
          final newSaleOrder = await salesPrvd.createNewSaleOrder(ref);
          ref
              .read(createSalesNotifierProvider.notifier)
              .createSalesOrder(request: newSaleOrder);
          break;
        case SalesType.salesInvoice:
          final newSale = await salesPrvd.createNewSale(ref);
          if (ref.read(cartProvider).isForUpdate == true) {
            ref
                .read(updateSalesNotifierProvider.notifier)
                .updateSalesInvoice(request: newSale);
          } else {
            ref
                .read(createSalesNotifierProvider.notifier)
                .createSalesInvoice(request: newSale);
          }
          break;
        case SalesType.salesQuotation:
          final newSale = await salesPrvd.createNewSaleQuotation(ref);
          if (ref.read(salesProvider.notifier).isForEdit == true) {
            ref
                .read(updateSalesNotifierProvider.notifier)
                .updateSalesQuotation(request: newSale);
          } else {
            ref
                .read(createSalesNotifierProvider.notifier)
                .createSalesQuotation(request: newSale);
          }
          break;
        case SalesType.salesReturn:
          final newSaleReturn = await salesPrvd.createNewSaleReturn(ref);
          ref
              .read(createSalesNotifierProvider.notifier)
              .createSalesReturn(request: newSaleReturn);
          break;
      }
    }
  }
}
