import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_cart_entity.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContraLedgerCardWidget extends ConsumerStatefulWidget {
  final ContraCartEntity ledger;
  final int index;

  const ContraLedgerCardWidget(
      {super.key, required this.ledger, required this.index});

  @override
  ConsumerState<ContraLedgerCardWidget> createState() =>
      _ContraLedgerCardWidgetState();
}

class _ContraLedgerCardWidgetState
    extends ConsumerState<ContraLedgerCardWidget> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  Widget _buildHeaderText(String text,
      {TextAlign textAlign = TextAlign.start, int flex = 1, Color? textColor}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: context.textTheme.bodySmall?.copyWith(
          color: textColor ?? context.defaultTextColor.withValues(alpha: 0.32),
        ),
        textAlign: textAlign,
      ),
    );
  }

  Widget _buildValueText(String value,
      {TextAlign textAlign = TextAlign.start, int flex = 1, Color? textColor}) {
    return Expanded(
      flex: flex,
      child: Text(
        value,
        style: context.textTheme.bodySmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: textColor ?? context.defaultTextColor.withValues(alpha: 0.75),
        ),
        textAlign: textAlign,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final entryMode = ref.watch(entryModeProvider);
    final ledgerMode =
        ref.watch(ledgerModeProvider(widget.ledger.ledger.ledgerIdpk ?? ""));
    return ValueListenableBuilder(
        valueListenable: _isExpanded,
        builder: (context, isExpanded, child) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppUtils.isDarkMode(context)
                    ? const Color(0xFF2B2E30)
                    : const Color(0xFFF9F9F9)),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child: Text(
                        "${widget.index + 1} - ",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.ledger.ledger.ledgerName ?? "",
                            style: context.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "${context.translate(AppStrings.ledgerBal)} : ${widget.ledger.currentBalance}",
                            style: context.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: widget.ledger.currentBalance >= 0
                                    ? Colors.green
                                    : context.errorColor),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () => _isExpanded.value = !_isExpanded.value,
                        icon: AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: const Icon(Icons.keyboard_arrow_down),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        return entryMode.when(
                            singleEntry: () => _buildHeaderText(
                                  context.translate(AppStrings.totalAmount),
                                  flex: 2,
                                  textAlign: TextAlign.end,
                                ),
                            doubleEntry: () => Consumer(
                                  builder: (context, ref, child) {
                                    return ledgerMode.when(
                                      debitLedger: () => _buildHeaderText(
                                        context.translate(AppStrings.drAmount),
                                        flex: 2,
                                        textAlign: TextAlign.end,
                                      ),
                                      creditLedger: () => _buildHeaderText(
                                        context.translate(AppStrings.crAmount),
                                        flex: 2,
                                        textAlign: TextAlign.end,
                                      ),
                                    );
                                  },
                                ));
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        return entryMode.when(
                            singleEntry: () => _buildValueText(
                                  widget.ledger.netTotal.toStringAsFixed(2),
                                  flex: 2,
                                  textAlign: TextAlign.end,
                                ),
                            doubleEntry: () => Consumer(
                                  builder: (context, ref, child) {
                                    return ledgerMode.when(
                                      debitLedger: () => _buildValueText(
                                        widget.ledger.drAmount
                                            .toStringAsFixed(2),
                                        flex: 2,
                                        textAlign: TextAlign.end,
                                      ),
                                      creditLedger: () => _buildValueText(
                                        widget.ledger.crAmount
                                            .toStringAsFixed(2),
                                        flex: 2,
                                        textAlign: TextAlign.end,
                                      ),
                                    );
                                  },
                                ));
                      },
                    )
                  ],
                ),
                AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          const Divider(
                            height: 1,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              _buildHeaderText(
                                  context.translate(AppStrings.description),
                                  flex: 2)
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              _buildValueText(widget.ledger.description,
                                  flex: 2)
                            ],
                          )
                        ],
                      ),
                    ),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300))
              ],
            ),
          );
        });
  }
}
