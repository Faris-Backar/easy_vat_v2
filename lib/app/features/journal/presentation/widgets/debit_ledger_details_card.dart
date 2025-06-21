import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:flutter/material.dart';

class DebitLedgerDetailsCard extends StatelessWidget {
  final bool isExpanded;
  final LedgerAccountEntity ledger;
  const DebitLedgerDetailsCard(
      {super.key, required this.isExpanded, required this.ledger});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
              color: isExpanded
                  ? context.colorScheme.secondary
                  : context.colorScheme.outline.withValues(alpha: 0.5)),
          color: AppUtils.isDarkMode(context)
              ? Color(0xFFF9F9F9)
              : const Color(0xFFF9f9f9)),
      child: Column(
        children: [
          _buildHeaderRow(context, ledger.ledgerName ?? "-"),
          const SizedBox(
            height: 10,
          ),
          _buildDetailRow([
            _buildLedgerDetail(context, context.translate(AppStrings.curBal),
                ledger.currentBalance?.toStringAsFixed(2) ?? "0.0")
          ])
        ],
      ),
    );
  }

  Widget _buildDetailRow(List<Widget> children) {
    return Row(
      children: children.map((child) => Expanded(child: child)).toList(),
    );
  }

  Widget _buildLedgerDetail(
      BuildContext context, String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w500, color: context.colorScheme.outline),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          content,
          style: context.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _buildHeaderRow(BuildContext context, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        AnimatedRotation(
          turns: isExpanded ? 0.5 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: const Icon(Icons.keyboard_arrow_down_rounded),
        )
      ],
    );
  }
}
