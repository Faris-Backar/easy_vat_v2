import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/usecase/params/dividend_params.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/create_dividend/create_dividend_notifier.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend/dividend_notifier.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend_cart/dividend_cart_provider.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/update_dividend/update_dividend_notifier.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/dividend_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDividendFooterWidget extends StatefulWidget {
  final TextEditingController dividendNoController;
  final TextEditingController refNoController;
  final TextEditingController issuedByController;
  final ValueNotifier<String?> paymentModeNotifier;
  const AddDividendFooterWidget(
      {super.key,
      required this.dividendNoController,
      required this.refNoController,
      required this.issuedByController,
      required this.paymentModeNotifier});

  @override
  State<AddDividendFooterWidget> createState() =>
      _AddDividendFooterWidgetState();
}

class _AddDividendFooterWidgetState extends State<AddDividendFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isCartNotEmptry =
            (ref.watch(dividendCartProvider).ledgerList?.length ?? 0) > 0;
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isCartNotEmptry ? 107.h : 67.h,
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
              if (isCartNotEmptry) ...[
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: Consumer(builder: (context, WidgetRef ref, child) {
                    ref.listen(createDividendNotifierProvider,
                        (previous, next) {
                      next.mapOrNull(
                          success: (success) {
                            final successMessage =
                                "Dividend successfully created!";

                            Fluttertoast.showToast(
                                msg: successMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);
                            ref
                                .read(dividendCartProvider.notifier)
                                .clearDividendCart();
                            context.router.popForced();
                            ref
                                .read(dividendNotifierProvider.notifier)
                                .fetchDividend(
                                    params: DividendParams(
                                        dividendIDPK: PrefResources.emptyGuid,
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

                    ref.listen(updateDividendNotifierProvider,
                        (previous, next) {
                      next.mapOrNull(
                          success: (success) {
                            final successMessage =
                                "Dividend successfully updated!";

                            Fluttertoast.showToast(
                                msg: successMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);

                            ref
                                .read(dividendCartProvider.notifier)
                                .clearDividendCart();
                            context.router.popForced();
                            ref
                                .read(dividendNotifierProvider.notifier)
                                .fetchDividend(
                                    params: DividendParams(
                                        dividendIDPK: PrefResources.emptyGuid,
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

                    if (ref.read(dividendCartProvider).isForUpdate == true) {
                      final state = ref.watch(updateDividendNotifierProvider);
                      return state.maybeWhen(
                        orElse: () => PrimaryButton(
                          label:
                              ref.read(dividendCartProvider).isForUpdate == true
                                  ? context.translate(AppStrings.update)
                                  : context.translate(AppStrings.save),
                          isLoading: false,
                          onPressed: () async =>
                              await _createUpdateDividend(ref),
                        ),
                        loading: () => PrimaryButton(
                          label: context.translate(AppStrings.save),
                          isLoading: true,
                          onPressed: () {},
                        ),
                      );
                    } else {
                      final state = ref.watch(createDividendNotifierProvider);

                      return state.maybeWhen(
                        orElse: () => PrimaryButton(
                          label:
                              ref.read(dividendCartProvider).isForUpdate == true
                                  ? context.translate(AppStrings.update)
                                  : context.translate(AppStrings.save),
                          isLoading: false,
                          onPressed: () async =>
                              await _createUpdateDividend(ref),
                        ),
                      );
                    }
                  }),
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
                showCapitalLedgerBottomSheet(context);
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

  _createUpdateDividend(WidgetRef ref) async {
    final divCartPrvd = ref.read(dividendCartProvider.notifier);
    divCartPrvd.setDividendNo(widget.dividendNoController.text);
    divCartPrvd.setRefNo(widget.refNoController.text);
    divCartPrvd.setPaymentMode(widget.paymentModeNotifier.value ?? "");
    divCartPrvd.setIssuedBy(widget.issuedByController.text);

    final newDividend = await divCartPrvd.createNewDividend();

    if (ref.read(dividendCartProvider).isForUpdate == true) {
      ref
          .read(updateDividendNotifierProvider.notifier)
          .updateDividend(request: newDividend);
    } else {
      ref
          .read(createDividendNotifierProvider.notifier)
          .createDividend(request: newDividend);
    }
  }
}
