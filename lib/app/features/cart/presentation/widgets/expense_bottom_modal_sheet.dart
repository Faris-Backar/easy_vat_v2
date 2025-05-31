import 'package:auto_route/auto_route.dart';
import 'dart:developer';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/expense_ledger/expense_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_add_dialog.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_details_card.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/refresh_button.dart';
import 'package:easy_vat_v2/app/features/widgets/search_debouncer.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseBottomModalSheet extends ConsumerStatefulWidget {
  const ExpenseBottomModalSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpenseBottomModalSheetState();
}

class _ExpenseBottomModalSheetState
    extends ConsumerState<ExpenseBottomModalSheet> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<int?> expenseDetailsExpansionNotifier =
      ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(expenseLedgerNotifierProvider); // expense ledger provider
    log('Fetching data from repository...', name: 'ExpenseLedger');
    return Container(
      height: 1.sh,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          _buildSearchField(context, ref),
          const SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: state.map(
              loaded: (expenseList) => expenseList.ledgers.isEmpty
                  ? Center(
                      child: Text(context.translate(AppStrings.noDataIsFound)),
                    )
                  : _buildExpenseList(expenseList.ledgers),
              loading: (_) => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              error: (message) => Center(
                child: Text(""),
              ),
              initial: (_) => const SizedBox.shrink(),
            ),
          ),
          _buildSubmitButton(context, ref),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, WidgetRef ref) {
    final searchDebouncer = SearchDebouncer();

    return Row(
      children: [
        IconButton(
            onPressed: () => context.router.popForced(),
            icon: Icon(Icons.adaptive.arrow_back)),
        Expanded(
          child: TextInputFormField(
            controller: searchController,
            maxLines: 1,
            textInputAction: TextInputAction.done,
            fillColor:
                AppUtils.isDarkMode(context) ? context.surfaceColor : null,
            onChanged: (value) {
              searchDebouncer.run(() {
                if (value.isEmpty) {
                  ref
                      .read(expenseLedgerNotifierProvider.notifier)
                      .fetchExpenseLedgers();
                  log('Fetching data from repository...',
                      name: 'ExpenseLedger');
                } else {
                  // search expense
                }
              });
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgIcon(icon: Assets.icons.search),
            ),
            suffixIcon: SizedBox(
              width: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: searchController.text.isNotEmpty
                          ? InkWell(
                              onTap: () => searchController.clear(),
                              child: Icon(Icons.close_rounded),
                            )
                          : const SizedBox.shrink())
                ],
              ),
            ),
            hint: AppStrings.search,
            height: 36.h,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        RefreshButton(onTap: () {
          searchController.text = "";
          ref
              .read(expenseLedgerNotifierProvider.notifier)
              .fetchExpenseLedgers();
          log('Fetching data from repository...', name: 'ExpenseLedger');
        })
      ],
    );
  }

  Widget _buildExpenseList(List<LedgerAccountEntity> ledgerList) {
    return ListView.builder(
      itemCount: ledgerList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            if ((ledgerList[index].currentBalance ?? 0.0) > 0) {
              expenseDetailsExpansionNotifier.value = index;
              showDialog(
                  context: context,
                  builder: (context) =>
                      LedgerAddDialog(ledger: ledgerList[index]));
            } else {
              AppUtils.showToast(context, AppStrings.ledgerCurrentlyNotActive);
            }
          },
          child: ValueListenableBuilder<int?>(
              valueListenable: expenseDetailsExpansionNotifier,
              builder: (context, value, child) {
                return LedgerDetailsCard(ledger: ledgerList[index]);
              }),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: PrimaryButton(
        label: AppStrings.submit,
        onPressed: () {
          final selectedIndex = expenseDetailsExpansionNotifier.value;
          if (selectedIndex != null) {
            context.router.popForced();
          }
        },
      ),
    );
  }
}

Future<void> showExpenseBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppUtils.isDarkMode(context)
          ? context.colorScheme.tertiaryContainer
          : context.colorScheme.surfaceContainerLowest,
      builder: (context) {
        return ExpenseBottomModalSheet();
      });
}
