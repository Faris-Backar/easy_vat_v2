import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend_cart/dividend_cart_provider.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/income_ledger_details_card.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_account_model.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/expense_ledger/expense_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/refresh_button.dart';
import 'package:easy_vat_v2/app/features/widgets/search_debouncer.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseLedgerInfoWidget extends ConsumerStatefulWidget {
  const ExpenseLedgerInfoWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpenseLedgerInfoWidgetState();
}

class _ExpenseLedgerInfoWidgetState
    extends ConsumerState<ExpenseLedgerInfoWidget> {
  final _searchController = TextEditingController();
  final _expansionNotifier = ValueNotifier<int?>(null);
  final searchDebouncer = SearchDebouncer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchAndSelectLedger();
    });
  }

  Future<void> _fetchAndSelectLedger() async {
    final selectedLedger = ref.read(dividendCartProvider).selectedLedger;
    if (selectedLedger != null) {
      ref.read(dividendCartProvider.notifier).setLedger(selectedLedger);
    }
    await ref
        .read(expenseLedgerNotifierProvider.notifier)
        .fetchExpenseLedgers();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLedgetTabView(context);
  }

  Widget _buildLedgerBottomSheet(BuildContext context) {
    return Consumer(builder: (context, WidgetRef ref, child) {
      final ledgerState = ref.watch(expenseLedgerNotifierProvider);
      final isLoaded = ledgerState.maybeWhen(
        loaded: (_) => true,
        orElse: () => false,
      );
      return Container(
        height: 1.sh,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: context.surfaceColor,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Expanded(
                  child: TextInputFormField(
                    controller: _searchController,
                    prefixIcon: const Icon(Icons.search_rounded),
                    hint: AppStrings.search,
                    height: 36.h,
                    fillColor: AppUtils.isDarkMode(context)
                        ? Theme.of(context).scaffoldBackgroundColor
                        : null,
                    onChanged: (value) {
                      searchDebouncer.run(() {
                        if (value.isEmpty) {
                          ref
                              .read(expenseLedgerNotifierProvider.notifier)
                              .fetchExpenseLedgers();
                        } else if (value.length > 3) {
                          ref
                              .read(expenseLedgerNotifierProvider.notifier)
                              .getLedgetById(value);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                RefreshButton(onTap: () {
                  _searchController.text = "";
                  ref
                      .read(expenseLedgerNotifierProvider.notifier)
                      .fetchExpenseLedgers();
                })
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            if (isLoaded)
              Expanded(
                child: ValueListenableBuilder<int?>(
                    valueListenable: _expansionNotifier,
                    builder: (_, expandedIndex, __) {
                      final ledgers = ledgerState.maybeWhen(
                        loaded: (ledgers) => ledgers,
                        orElse: () => [],
                      );
                      return ListView.separated(
                          itemBuilder: (_, index) {
                            final ledger = ledgers[index];
                            return InkWell(
                              onTap: () {},
                              child: _buildLedgerCard(
                                  index, expandedIndex, ledger),
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: ledgers.length);
                    }),
              ),
            Container(
              height: 67,
              width: double.infinity,
              color: AppUtils.isDarkMode(context)
                  ? context.surfaceColor
                  : context.colorScheme.surfaceContainerLowest,
              child: Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {},
                      label: context.translate(AppStrings.addLedger),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgIcon(
                            icon: Assets.icons.ledger,
                            color: AppUtils.isDarkMode(context)
                                ? context.defaultTextColor
                                : null,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            context.translate(AppStrings.addLedger),
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppUtils.isDarkMode(context)
                                    ? context.defaultTextColor
                                    : context.colorScheme.primary),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: _expansionNotifier,
                        builder: (context, int? value, child) {
                          return PrimaryButton(
                            label: context.translate(AppStrings.submit),
                            bgColor: context.colorScheme.primary,
                            onPressed: value != null
                                ? () {
                                    final ledgerNotifier = ref.read(
                                        expenseLedgerNotifierProvider.notifier);
                                    final ledgers =
                                        ledgerNotifier.expenseLedgers;

                                    if (ledgers.isNotEmpty) {
                                      final selectedLedger =
                                          ledgers[_expansionNotifier.value!];
                                      ref
                                          .read(dividendCartProvider.notifier)
                                          .setLedger(selectedLedger);
                                      context.router.popForced();
                                    }
                                  }
                                : null,
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _buildLedgerCard(
      int index, int? expandedIndex, LedgerAccountModel ledger) {
    final isExpanded = expandedIndex == index;
    return InkWell(
      onTap: () => _expansionNotifier.value = isExpanded ? null : index,
      child: IncomeLedgerDetailsCard(isExpanded: isExpanded, ledger: ledger),
    );
  }

  Widget _buildLedgetTabView(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Container(
          height: 185.h,
          decoration: BoxDecoration(
              border: Border.all(
                  color: context.colorScheme.outline.withValues(alpha: 0.5)),
              color: AppUtils.isDarkMode(context)
                  ? context.colorScheme.tertiaryContainer
                  : const Color(0xFFFDFBFF),
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildTabBar(context, ref),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  children: [
                    InkWell(onTap: () {
                      showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              isScrollControlled: true,
                              backgroundColor: AppUtils.isDarkMode(context)
                                  ? context.colorScheme.surfaceContainer
                                  : context.colorScheme.surfaceContainerLowest,
                              builder: (context) =>
                                  _buildLedgerBottomSheet(context))
                          .whenComplete(() {
                        _expansionNotifier.value = null;
                      });
                    }, child: Consumer(
                      builder: (context, ref, _) {
                        final selectedLedger =
                            ref.watch(dividendCartProvider).selectedLedger;

                        final ledgerName =
                            selectedLedger?.ledgerName?.trim().isNotEmpty ==
                                    true
                                ? selectedLedger!.ledgerName!
                                : "Select a Ledger";

                        final currentBalance = selectedLedger?.currentBalance !=
                                null
                            ? selectedLedger!.currentBalance!.toStringAsFixed(2)
                            : null;

                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              isScrollControlled: true,
                              backgroundColor: AppUtils.isDarkMode(context)
                                  ? context.colorScheme.surfaceContainer
                                  : context.colorScheme.surfaceContainerLowest,
                              builder: (context) =>
                                  _buildLedgerBottomSheet(context),
                            ).whenComplete(() {
                              _expansionNotifier.value = null;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      ledgerName,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  if (selectedLedger != null &&
                                      (selectedLedger.ledgerName?.isNotEmpty ??
                                          false))
                                    InkWell(
                                      onTap: () {
                                        ref
                                            .read(dividendCartProvider.notifier)
                                            .removeLedger();
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        margin: const EdgeInsets.only(left: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: context.colorScheme.error
                                              .withValues(alpha: 0.1),
                                          border: Border.all(
                                            color: context.colorScheme.error
                                                .withValues(alpha: 0.3),
                                            width: 1,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.close_rounded,
                                          size: 16,
                                          color: context.colorScheme.error,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              if (currentBalance != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    "${context.translate(AppStrings.curBal)}: $currentBalance",
                                    style: context.textTheme.bodySmall,
                                  ),
                                )
                            ],
                          ),
                        );
                      },
                    ))
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}

Widget _buildTabBar(BuildContext context, WidgetRef ref) {
  return Align(
      alignment: Alignment.topLeft,
      child: TabBar(
        labelColor: AppUtils.isDarkMode(context)
            ? Color(0xFF8B62F1)
            : context.colorScheme.secondary,
        unselectedLabelColor: context.colorScheme.onSurface,
        indicatorColor: AppUtils.isDarkMode(context)
            ? Color(0xFF8B62F1)
            : context.colorScheme.secondary,
        dividerColor: Colors.transparent,
        padding: EdgeInsets.zero,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                width: 2.0,
                color: AppUtils.isDarkMode(context)
                    ? Color(0xFF8B62F1)
                    : context.colorScheme.secondary)),
        labelStyle: context.textTheme.bodySmall
            ?.copyWith(fontSize: 11, fontWeight: FontWeight.w600),
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        tabs: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(context.translate(AppStrings.selectedLedger)),
          ),
        ],
      ));
}
