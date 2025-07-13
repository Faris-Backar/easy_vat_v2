import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/params/stock_transfer_params.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/create_stock_transfer/create_stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/fetch_stock_transfer/fetch_stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/update_stock_transfer/update_stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_bottom_model_sheet.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddStockTransferWidgert extends StatefulWidget {
  final TextEditingController stockTransferNoController;
  final TextEditingController refNoController;
  final ValueNotifier<String?> fromStoreNotifier;
  final ValueNotifier<String?> toStoreNotifier;
  const AddStockTransferWidgert(
      {super.key,
      required this.stockTransferNoController,
      required this.refNoController,
      required this.fromStoreNotifier,
      required this.toStoreNotifier});

  @override
  State<AddStockTransferWidgert> createState() =>
      _AddStockTransferWidgertState();
}

class _AddStockTransferWidgertState extends State<AddStockTransferWidgert> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isCartNotEmpty =
            (ref.watch(stockTransferProvider).itemList?.length ?? 0) > 0;
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
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: Consumer(
                    builder: (context, WidgetRef ref, child) {
                      ref.listen(createStockTransferNotifierProvider,
                          (previous, next) {
                        next.mapOrNull(
                            success: (success) {
                              final successMessage =
                                  "Stock Transfer successfully created!";

                              Fluttertoast.showToast(
                                  msg: successMessage,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM);
                              ref
                                  .read(stockTransferProvider.notifier)
                                  .clearCart();
                              context.router.popForced();
                              ref
                                  .read(fetchStockTransferNotifierProvider
                                      .notifier)
                                  .fetchStockTransfer(
                                      params: StockTransferParams(
                                          stockTransferIDPK:
                                              PrefResources.emptyGuid,
                                          fromDate: ref
                                              .read(dateRangeProvider)
                                              .fromDate,
                                          toDate: ref
                                              .read(dateRangeProvider)
                                              .toDate));
                            },
                            failure: (message) => ScaffoldMessenger.of(context)
                                .showSnackBar(
                                    SnackBar(content: Text(message.error))));
                      });

                      ref.listen(updateStockTransferNotifierProvider,
                          (previous, next) {
                        next.mapOrNull(
                            success: (success) {
                              final successMessage =
                                  "Stock Transfer successfully updated!";
                              Fluttertoast.showToast(
                                  msg: successMessage,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM);
                              ref
                                  .read(stockTransferProvider.notifier)
                                  .clearCart();
                              context.router.popForced();
                              ref
                                  .read(fetchStockTransferNotifierProvider
                                      .notifier)
                                  .fetchStockTransfer(
                                      params: StockTransferParams(
                                          stockTransferIDPK:
                                              PrefResources.emptyGuid,
                                          fromDate: ref
                                              .read(dateRangeProvider)
                                              .fromDate,
                                          toDate: ref
                                              .read(dateRangeProvider)
                                              .toDate));
                            },
                            failure: (message) => ScaffoldMessenger.of(context)
                                .showSnackBar(
                                    SnackBar(content: Text(message.error))));
                      });
                      if (ref.read(stockTransferProvider).isForUpdate == true) {
                        final state =
                            ref.watch(updateStockTransferNotifierProvider);
                        return state.maybeWhen(
                            orElse: () => PrimaryButton(
                                  label: ref
                                              .read(stockTransferProvider)
                                              .isForUpdate ==
                                          true
                                      ? context.translate(AppStrings.update)
                                      : context.translate(AppStrings.save),
                                  isLoading: false,
                                  onPressed: () async =>
                                      _createUpdateStockTransfer(ref),
                                ),
                            loading: () => PrimaryButton(
                                  label: context.translate(AppStrings.save),
                                  isLoading: true,
                                  onPressed: () {},
                                ));
                      } else {
                        final state =
                            ref.watch(createStockTransferNotifierProvider);
                        return state.maybeWhen(
                          orElse: () => PrimaryButton(
                            label:
                                ref.read(stockTransferProvider).isForUpdate ==
                                        true
                                    ? context.translate(AppStrings.update)
                                    : context.translate(AppStrings.save),
                            isLoading: false,
                            onPressed: () async =>
                                await _createUpdateStockTransfer(ref),
                          ),
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
                context.translate(AppStrings.addItem),
                () {
                  showStockTransferItemsBottomSheet(context);
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

  _createUpdateStockTransfer(WidgetRef ref) async {
    final cartPrvd = ref.read(stockTransferProvider.notifier);
    cartPrvd.setStockTransferNo(widget.stockTransferNoController.text);
    cartPrvd.setRefNo(widget.refNoController.text);

    final newStockTransfer = await cartPrvd.createNewStockTransfer();

    if (ref.read(stockTransferProvider).isForUpdate == true) {
      ref
          .read(updateStockTransferNotifierProvider.notifier)
          .updateStockTransfer(request: newStockTransfer);
    } else {
      ref
          .read(createStockTransferNotifierProvider.notifier)
          .createStockTransfer(request: newStockTransfer);
    }
  }
}
