import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/contra/domain/usecase/params/contra_params.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra/contra_notifier.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra/contra_state.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra_cart/contra_cart_provider.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/delete_contra/delete_contra_notifier.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/contra_appbar.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/contra_card.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/all_ledgers/all_ledgers_notifier.dart';
import 'package:easy_vat_v2/app/features/pdf_viewer/pdf_viewer_screen.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_confirmation_dialog.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class ContraScreen extends ConsumerStatefulWidget {
  const ContraScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContraScreenState();
}

class _ContraScreenState extends ConsumerState<ContraScreen> {
  final _searchBarController = TextEditingController();
  late ContraState contraState;

  @override
  void initState() {
    super.initState();
    contraState = ref.read(contraNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(allLedgerNotifierProvider.notifier).fetchAllLedgers();
      ref.read(contraNotifierProvider.notifier).fetchContra(
          params: ContraParams(
              contraIDPK: PrefResources.emptyGuid,
              fromDate: DateTime.now(),
              toDate: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final contraState = ref.watch(contraNotifierProvider);
    return Scaffold(
      appBar: ContraAppbar(
          searchController: _searchBarController, config: ContraAppBarConfig()),
      backgroundColor: context.surfaceColor,
      body: Consumer(builder: (context, ref, child) {
        ref.listen(deleteContraNotifierProvider, (previous, next) {
          next.maybeWhen(
            success: () {
              Fluttertoast.showToast(
                  msg: context
                      .translate(AppStrings.deleteContraConfirmationMessage),
                  backgroundColor: Colors.white,
                  textColor: Colors.black);
              ref.read(contraNotifierProvider.notifier).fetchContra(
                  params: ContraParams(
                      fromDate: ref.read(dateRangeProvider).fromDate,
                      toDate: ref.read(dateRangeProvider).toDate));
            },
            failure: (error) {
              Fluttertoast.showToast(
                  msg: error,
                  backgroundColor: Colors.red,
                  textColor: Colors.white);
            },
            orElse: () {},
          );
        });
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: contraState.maybeWhen(
            success: (contraData, totalAmount) {
              if (contraData.isEmpty == true) {
                return Center(
                  child: Container(
                    height: 0.5.sh,
                    width: 0.8.sw,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.images.noDataFound.path))),
                  ),
                );
              }
              return ListView.builder(
                itemCount: contraData.length,
                itemBuilder: (context, index) {
                  final contra = contraData[index];
                  final notifier = ValueNotifier<bool>(false);
                  if (contraData.isEmpty == true) {
                    return Center(
                      child: Text(context.translate(AppStrings.noDataIsFound)),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
                        Expanded(
                          child: _buildSlidingAction(
                            color: AppUtils.isDarkMode(context)
                                ? CustomColors.getTransactionSkyBlueColor(
                                    context)
                                : CustomColors.getTransactionSkyBlueColor(
                                        context)
                                    .withValues(alpha: 0.2),
                            borderRadiusBottomLeft: 10.0,
                            borderRadiusTopLeft: 10.0,
                            icon: Assets.icons.print,
                            iconColor: AppUtils.isDarkMode(context)
                                ? context.onPrimaryColor
                                : null,
                            onTap: () async {
                              context.router.push(PdfViewerRoute(
                                  pdfType: PDFType.contra,
                                  queryParameters: {
                                    "ContraIDPK": contra.contraIDPK ?? ""
                                  },
                                  pdfName: contra.contraIDPK));
                            },
                          ),
                        ),
                        Expanded(
                          child: _buildSlidingAction(
                            color: AppUtils.isDarkMode(context)
                                ? CustomColors.getTransactionCardBlueColor(
                                    context)
                                : CustomColors.getTransactionCardBlueColor(
                                        context)
                                    .withValues(alpha: 0.2),
                            borderRadiusBottomRight: 10.0,
                            borderRadiusTopRight: 10.0,
                            icon: Assets.icons.view,
                            iconColor: AppUtils.isDarkMode(context)
                                ? context.onPrimaryColor
                                : null,
                            onTap: () async {
                              await ref
                                  .read(contraCartProvider.notifier)
                                  .reinsertContraForm(contra, ref);
                              if (mounted) {
                                context.router.push(AddNewContraRoute(
                                    title: context
                                        .translate(AppStrings.addNewContra)));
                              }
                            },
                          ),
                        )
                      ]),
                      startActionPane: ActionPane(
                          motion: ScrollMotion(),
                          extentRatio: 0.25,
                          children: [
                            Expanded(
                              child: _buildSlidingAction(
                                color: AppUtils.isDarkMode(context)
                                    ? CustomColors.getTransactionCardRedColor(
                                        context)
                                    : CustomColors.getTransactionCardRedColor(
                                            context)
                                        .withValues(alpha: 0.2),
                                icon: Assets.icons.delete,
                                borderRadiusTopLeft: 10.0,
                                borderRadiusBottomLeft: 10.0,
                                borderRadiusBottomRight: 10.0,
                                borderRadiusTopRight: 10.0,
                                iconColor: AppUtils.isDarkMode(context)
                                    ? context.onPrimaryColor
                                    : null,
                                iconHeight: 24.0,
                                iconWidth: 24.0,
                                onTap: () => _showDeleteDialog(
                                  context,
                                  contraIDPK: contra.contraIDPK ?? "",
                                ),
                              ),
                            )
                          ]),
                      child: ContraCard(
                          contra: contra, isSelectedNotifier: notifier),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            failure: (message) => Center(
              child: Text(message),
            ),
            orElse: () => Text(context.translate(AppStrings.noDataIsFound)),
          ),
        );
      }),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiaryContainer
              : context.surfaceColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.translate(AppStrings.total),
                    style: context.textTheme.bodyMedium?.copyWith(
                        color:
                            context.defaultTextColor.withValues(alpha: 0.32)),
                  ),
                  contraState.maybeWhen(
                    success: (contra, totalAmount) => Text(
                      totalAmount?.toStringAsFixed(2) ?? "",
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    orElse: () => Text(
                      ref
                          .watch(contraCartProvider)
                          .totalAmount
                          .toStringAsFixed(2),
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                onPressed: () => context.router.push(AddNewContraRoute(
                    title: context.translate(AppStrings.addNewContra))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      context.translate(AppStrings.addNew),
                      style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlidingAction(
      {required Function()? onTap,
      required Color? color,
      required String icon,
      required Color? iconColor,
      double? borderRadiusTopLeft,
      double? borderRadiusTopRight,
      double? borderRadiusBottomLeft,
      double? borderRadiusBottomRight,
      double? width,
      double? iconHeight,
      double? iconWidth}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
                topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
                bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
                bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0))),
        padding: const EdgeInsets.all(18.0),
        child: SvgIcon(
          height: iconHeight ?? 18,
          width: iconWidth ?? 18,
          icon: icon,
          color: iconColor,
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, {required String contraIDPK}) {
    showDialog(
        context: context,
        builder: (context) => CustomConfirmationDialog(
              title: context.translate(AppStrings.delete),
              message: context.translate(AppStrings.deleteConfirmationInCart),
              primaryButtonLabel: context.translate(AppStrings.delete),
              secondaryButtonLabel: context.translate(AppStrings.cancel),
              onPrimaryTap: () {
                ref.read(deleteContraNotifierProvider.notifier).deleteContra(
                        request: ContraParams(
                      fromDate: ref.read(dateRangeProvider).fromDate,
                      toDate: ref.read(dateRangeProvider).toDate,
                      contraIDPK: contraIDPK,
                    ));
                context.router.popForced();
              },
              onSecondaryTap: () => context.router.popForced(),
            ));
  }
}
