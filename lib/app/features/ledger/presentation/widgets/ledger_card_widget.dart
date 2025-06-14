import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_cart_entity.dart';
import 'package:flutter/material.dart';

class LedgerCardWidget extends StatefulWidget {
  final ExpenseCartEntity ledger;
  final int index;
  const LedgerCardWidget(
      {super.key, required this.ledger, required this.index});

  @override
  State<LedgerCardWidget> createState() => _LedgerCardWidgetState();
}

class _LedgerCardWidgetState extends State<LedgerCardWidget> {
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
            color:
                textColor ?? context.defaultTextColor.withValues(alpha: 0.32),
          ),
          textAlign: textAlign,
        ));
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
                    Expanded(
                        child: Text(
                            "${widget.index + 1} - ${widget.ledger.ledgerName}",
                            style: context.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600))),
                    const SizedBox(
                      width: 8,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderText(
                      context.translate(AppStrings.ledgerCode),
                      flex: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildHeaderText(
                      context.translate(AppStrings.group),
                      flex: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildHeaderText(
                      context.translate(AppStrings.nature),
                      flex: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildHeaderText(
                      context.translate(AppStrings.opBal),
                      flex: 2,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    _buildHeaderText(
                      context.translate(AppStrings.curBal),
                      textColor: (widget.ledger.currentBalance) >= 0
                          ? Colors.green
                          : context.errorColor,
                      flex: 2,
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    _buildValueText(
                      widget.ledger.ledgerCode.toString(),
                      flex: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildValueText(
                      widget.ledger.groupName,
                      flex: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildValueText(
                      widget.ledger.nature,
                      flex: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildValueText(
                      widget.ledger.openingBalance.toStringAsFixed(2),
                      flex: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _buildValueText(
                        "${widget.ledger.currentBalance.toStringAsFixed(2)} ${widget.ledger.currentBalanceType}",
                        textColor: (widget.ledger.currentBalance) >= 0
                            ? Colors.green
                            : context.errorColor,
                        flex: 2)
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
                                context.translate(AppStrings.taxPercentage),
                                flex: 2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              _buildHeaderText(
                                  context.translate(AppStrings.taxAmount),
                                  flex: 2),
                              const SizedBox(
                                width: 8,
                              ),
                              _buildHeaderText(
                                  context.translate(AppStrings.grossTotal),
                                  flex: 2),
                              const SizedBox(
                                width: 8,
                              ),
                              _buildHeaderText(
                                  context.translate(AppStrings.netTotal),
                                  flex: 2),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              _buildValueText(
                                widget.ledger.taxPercentage.toStringAsFixed(2),
                                flex: 2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              _buildValueText(
                                widget.ledger.taxAmount.toStringAsFixed(2),
                                flex: 2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              _buildValueText(
                                  widget.ledger.grossTotal.toStringAsFixed(2),
                                  flex: 2),
                              const SizedBox(
                                width: 8,
                              ),
                              _buildValueText(
                                  widget.ledger.netTotal.toStringAsFixed(2),
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
