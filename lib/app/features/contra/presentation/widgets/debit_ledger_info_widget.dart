import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra_cart/contra_cart_provider.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/income_ledger_details_card.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_account_model.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/all_ledgers/all_ledgers_notifier.dart';
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

class DebitLedgerInfoWidget extends ConsumerStatefulWidget {
  const DebitLedgerInfoWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DebitLedgerInfoWidgetState();
}

class _DebitLedgerInfoWidgetState extends ConsumerState<DebitLedgerInfoWidget> {
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
    final selectedLedger = ref.read(contraCartProvider).selectedLedger;
    if (selectedLedger != null) {
      ref.read(contraCartProvider.notifier).setLedger(selectedLedger);
    }
    await ref.read(allLedgerNotifierProvider.notifier).fetchAllLedgers();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLedgetTabView(context);
  }

  Widget _buildLedgerBottomSheet(BuildContext context) {
    return Consumer(builder: (context, WidgetRef ref, child) {
      final ledgerState = ref.watch(allLedgerNotifierProvider);
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
                              .read(allLedgerNotifierProvider.notifier)
                              .fetchAllLedgers();
                        } else if (value.length > 3) {
                          ref
                              .read(allLedgerNotifierProvider.notifier)
                              .getLedgerById(value);
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
                      .read(allLedgerNotifierProvider.notifier)
                      .fetchAllLedgers();
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
                                        allLedgerNotifierProvider.notifier);
                                    final ledgers = ledgerNotifier.allLedgers;

                                    if (ledgers.isNotEmpty) {
                                      final selectedLedger =
                                          ledgers[_expansionNotifier.value!];
                                      ref
                                          .read(contraCartProvider.notifier)
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
          height: 120.h,
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
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            useSafeArea: true,
                            isScrollControlled: true,
                            backgroundColor: AppUtils.isDarkMode(context)
                                ? context.colorScheme.surfaceContainer
                                : context.colorScheme.surfaceContainerLowest,
                            builder: (context) =>
                                _buildLedgerBottomSheet(context)).whenComplete(
                            () {
                          _expansionNotifier.value = null;
                        });
                      },
                      child: Consumer(
                        builder: (context, ref, _) {
                          final selectedLedger =
                              ref.watch(contraCartProvider).selectedLedger;

                          final ledgerName =
                              selectedLedger?.ledgerName?.trim().isNotEmpty ==
                                      true
                                  ? selectedLedger?.ledgerName!
                                  : "Select a Ledger";

                          final currentBalance =
                              selectedLedger?.currentBalance != null
                                  ? selectedLedger!.currentBalance!
                                      .toStringAsFixed(2)
                                  : '0.0';

                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ledgerName ?? "",
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (selectedLedger?.currentBalance != null)
                                    Text(
                                      "${context.translate(AppStrings.curBal)} : $currentBalance",
                                      style: context.textTheme.bodySmall,
                                    ),
                                ],
                              ));
                        },
                      ),
                    )
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
