import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/journal/domain/usecase/params/journal_params.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/create_journal/create_journal_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal/journal_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal_cart/journal_cart_provider.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/update_journal/update_journal_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/widgets/journal_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddJournalFooterWidget extends StatefulWidget {
  final TextEditingController journalNoController;
  final TextEditingController refNoController;
  final TextEditingController descriptionController;

  const AddJournalFooterWidget(
      {super.key,
      required this.journalNoController,
      required this.refNoController,
      required this.descriptionController});

  @override
  State<AddJournalFooterWidget> createState() => _AddJournalFooterWidgetState();
}

class _AddJournalFooterWidgetState extends State<AddJournalFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final isCartNotEmpty =
          (ref.watch(journalCartProvider).ledgerList?.length ?? 0) > 0;
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: double.infinity,
        height: isCartNotEmpty ? 107.h : 67.h,
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
                child: Consumer(builder: (context, WidgetRef ref, child) {
                  ref.listen(createJournalNotifierProvider, (previous, next) {
                    next.mapOrNull(
                      success: (success) {
                        final successMessage = "Journal successfully created!";

                        Fluttertoast.showToast(
                            msg: successMessage,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM);
                        ref
                            .read(journalCartProvider.notifier)
                            .clearJournalCart();
                        context.router.popForced();
                        ref.read(journalNotifierProvider.notifier).fetchJournal(
                            params: JournalParams(
                                journalIDPK: PrefResources.emptyGuid,
                                fromDate: ref.read(dateRangeProvider).fromDate,
                                toDate: ref.read(dateRangeProvider).toDate));
                      },
                      failure: (message) => ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message.error))),
                    );
                  });

                  ref.listen(updateJournalNotifierProvider, (previous, next) {
                    next.mapOrNull(
                        success: (success) {
                          final successMessage =
                              "Journal successfully updated!";

                          Fluttertoast.showToast(
                              msg: successMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                          ref
                              .read(journalCartProvider.notifier)
                              .clearJournalCart();
                          context.router.popForced();
                          ref
                              .read(journalNotifierProvider.notifier)
                              .fetchJournal(
                                  params: JournalParams(
                                      journalIDPK: PrefResources.emptyGuid,
                                      fromDate:
                                          ref.read(dateRangeProvider).fromDate,
                                      toDate:
                                          ref.read(dateRangeProvider).toDate));
                        },
                        failure: (message) => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text(message.error))));
                  });
                  if (ref.read(journalCartProvider).isForUpdate == true) {
                    final state = ref.watch(updateJournalNotifierProvider);
                    return state.maybeWhen(
                      orElse: () => PrimaryButton(
                        label: ref.read(journalCartProvider).isForUpdate == true
                            ? context.translate(AppStrings.update)
                            : context.translate(AppStrings.save),
                        isLoading: false,
                        onPressed: () async => await _createUpdateJournal(ref),
                      ),
                      loading: () => PrimaryButton(
                        label: context.translate(AppStrings.save),
                        isLoading: true,
                        onPressed: () {},
                      ),
                    );
                  } else {
                    final state = ref.watch(createJournalNotifierProvider);

                    return state.maybeWhen(
                      orElse: () => PrimaryButton(
                        label: ref.read(journalCartProvider).isForUpdate == true
                            ? context.translate(AppStrings.update)
                            : context.translate(AppStrings.save),
                        isLoading: false,
                        onPressed: () async => await _createUpdateJournal(ref),
                      ),
                    );
                  }
                }),
              )
            ]
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
                  context.translate(AppStrings.addLedger), () {
                showLedgerBottomSheet(
                  context,
                );
              });
            },
          ),
        )
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
      {bool isOutline = false, bool isPrimary = false, bool isBold = false}) {
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

  _createUpdateJournal(WidgetRef ref) async {
    final cartPrvd = ref.read(journalCartProvider.notifier);

    final entryMode = ref.read(entryModeProvider);

    if (entryMode == EntryModeState.doubleEntry()) {
      final cartState = ref.read(journalCartProvider);
      if (cartState.drAmount != cartState.crAmount) {
        Fluttertoast.showToast(
            msg: "Debit amount and Credit amount must be equal!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
        return;
      }
    }

    cartPrvd.setJournalNo(widget.journalNoController.text);
    cartPrvd.setRefNo(widget.refNoController.text);
    cartPrvd.setDescription(widget.descriptionController.text);

    final newJournal = await cartPrvd.createNewJournal();

    if (ref.read(journalCartProvider).isForUpdate == true) {
      ref
          .read(updateJournalNotifierProvider.notifier)
          .updateJournal(request: newJournal);
    } else {
      ref
          .read(createJournalNotifierProvider.notifier)
          .createJournal(request: newJournal);
    }
  }
}
