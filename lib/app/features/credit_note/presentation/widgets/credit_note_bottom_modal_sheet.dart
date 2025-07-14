import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note_cart/credit_note_cart_provider.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/widgets/credit_note_add_dialog.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/widgets/credit_note_ledger_details_card.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/all_ledgers/all_ledgers_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/refresh_button.dart';
import 'package:easy_vat_v2/app/features/widgets/search_debouncer.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditNoteBottomModalSheet extends ConsumerStatefulWidget {
  const CreditNoteBottomModalSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreditNoteBottomModalSheetState();
}

class _CreditNoteBottomModalSheetState
    extends ConsumerState<CreditNoteBottomModalSheet> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<int?> creditNoteDetailsExpansionNotifier =
      ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(allLedgerNotifierProvider);
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
                  loaded: (creditNoteList) => creditNoteList.ledgers.isEmpty
                      ? Center(
                          child:
                              Text(context.translate(AppStrings.noDataIsFound)),
                        )
                      : _buildCreditNoteList(creditNoteList.ledgers),
                  error: (_) => const SizedBox.shrink())),
          _buildSubmitButton(context, ref)
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, WidgetRef ref) {
    final seatchDebouncer = SearchDebouncer();

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
              seatchDebouncer.run(() {
                if (value.isEmpty) {
                  ref
                      .read(allLedgerNotifierProvider.notifier)
                      .fetchAllLedgers();
                } else {}
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
        RefreshButton(
          onTap: () {
            searchController.text = "";
            ref.read(allLedgerNotifierProvider.notifier).fetchAllLedgers();
          },
        )
      ],
    );
  }

  Widget _buildCreditNoteList(List<LedgerAccountEntity> ledgerList) {
    final selectedIndex = creditNoteDetailsExpansionNotifier.value;
    final addedLedgers = ref.watch(creditNoteCartProvider).ledgerList ?? [];

    return ListView.builder(
        itemCount: ledgerList.length,
        itemBuilder: (context, index) {
          final ledger = ledgerList[index];
          final isSelected = selectedIndex == index;
          final isAdded =
              addedLedgers.any((l) => l.ledger.ledgerIdpk == ledger.ledgerIdpk);
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () {
                if ((ledgerList[index].isActive ?? false)) {
                  creditNoteDetailsExpansionNotifier.value = index;
                  showDialog(
                      context: context,
                      builder: (context) =>
                          CreditNoteAddDialog(ledger: ledgerList[index]));
                } else {
                  AppUtils.showToast(
                      context, AppStrings.ledgerCurrentlyNotActive);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isAdded
                        ? Colors.green
                        : isSelected
                            ? context.colorScheme.onPrimary
                            : Colors.transparent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: CreditNoteLedgerDetailsCard(ledger: ledger),
              ),
            ),
          );
        });
  }

  Widget _buildSubmitButton(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 50.h,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: PrimaryButton(
              label: AppStrings.submit,
              onPressed: () {
                final selectedIndex = creditNoteDetailsExpansionNotifier.value;
                if (selectedIndex != null) {
                  context.router.popForced();
                }
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
              onPressed: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: Badge.count(
                backgroundColor: CustomColors.inActiveRedColor(context),
                textColor: Colors.white,
                count:
                    ref.watch(creditNoteCartProvider).ledgerList?.length ?? 0,
                child: SvgIcon(
                  icon: Assets.icons.cart,
                  color: context.defaultTextColor,
                ),
              )),
        )
      ],
    );
  }
}

Future<void> showCreditNoteBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppUtils.isDarkMode(context)
          ? context.colorScheme.tertiaryContainer
          : context.colorScheme.surfaceContainerLowest,
      builder: (context) {
        return CreditNoteBottomModalSheet();
      });
}
