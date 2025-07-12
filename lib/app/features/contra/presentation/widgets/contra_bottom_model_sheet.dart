import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/contra_add_dialog.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/income_ledger_details_card.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_bank_ledgers/cash_bank_ledger_notfier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/refresh_button.dart';
import 'package:easy_vat_v2/app/features/widgets/search_debouncer.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContraBottomModelSheet extends ConsumerStatefulWidget {
  final LedgerAccountEntity? ledger;
  const ContraBottomModelSheet({super.key, this.ledger});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContraBottomModalSheetState();
}

class _ContraBottomModalSheetState
    extends ConsumerState<ContraBottomModelSheet> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<int?> contraDetailsExpansionNotifier =
      ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cashBankLedgerNotifierProvider);
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
                initial: (_) => const SizedBox.shrink(),
                loading: (_) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                loaded: (ledgerList) => ledgerList.ledgers.isEmpty
                    ? Center(
                        child:
                            Text(context.translate(AppStrings.noDataIsFound)),
                      )
                    : _buildAllLedgerList(ledgerList.ledgers),
                error: (_) => const SizedBox.shrink()),
          ),
          _buildSubmitButton(context, ref)
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
                      .read(cashBankLedgerNotifierProvider.notifier)
                      .fetchCashBankLedgers();
                } else {}
              });
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgIcon(
                icon: Assets.icons.search,
              ),
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
              .read(cashBankLedgerNotifierProvider.notifier)
              .fetchCashBankLedgers();
        })
      ],
    );
  }

  Widget _buildAllLedgerList(List<LedgerAccountEntity> ledgerList) {
    return ListView.builder(
      itemCount: ledgerList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            if ((ledgerList[index].isActive ?? false)) {
              contraDetailsExpansionNotifier.value = index;
              showDialog(
                  context: context,
                  builder: (context) => ContraAddDialog(
                        ledger: ledgerList[index],
                      ));
            } else {
              AppUtils.showToast(context, AppStrings.ledgerCurrentlyNotActive);
            }
          },
          child: ValueListenableBuilder(
              valueListenable: contraDetailsExpansionNotifier,
              builder: (context, value, child) {
                return IncomeLedgerDetailsCard(ledger: ledgerList[index]);
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
          final selectedIndex = contraDetailsExpansionNotifier.value;
          if (selectedIndex != null) {
            context.router.popForced();
          }
        },
      ),
    );
  }
}

Future<void> showLedgerBottomSheet(
  BuildContext context,
) async {
  await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppUtils.isDarkMode(context)
          ? context.colorScheme.tertiaryContainer
          : context.colorScheme.surfaceContainerLowest,
      builder: (context) {
        return ContraBottomModelSheet();
      });
}
