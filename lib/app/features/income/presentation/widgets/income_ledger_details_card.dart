import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:flutter/material.dart';

class IncomeLedgerDetailsCard extends StatelessWidget {
  final LedgerAccountEntity ledger;
  const IncomeLedgerDetailsCard({super.key, required this.ledger});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppUtils.isDarkMode(context)
            ? Color(0xFF2B2E30)
            : const Color(0xFFF9F9F9),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  ledger.ledgerName ?? "",
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: _buildContents(
                      context,
                      context.translate(AppStrings.ledgerCode),
                      ledger.ledgerCode ?? "")),
              Expanded(
                  child: _buildContents(
                      context,
                      context.translate(AppStrings.group),
                      ledger.groupName ?? "")),
              Expanded(
                  child: _buildContents(
                      context,
                      context.translate(AppStrings.nature),
                      ledger.nature ?? "")),
              Expanded(
                  child: _buildContents(
                      context,
                      context.translate(AppStrings.opBal),
                      ledger.openingBalance?.toStringAsFixed(2) ?? "0.0")),
              Expanded(
                  child: _buildContents(
                      context,
                      context.translate(AppStrings.curBal),
                      "${(ledger.currentBalance ?? 0.0).toStringAsFixed(2)} ${ledger.currentBalanceType ?? ""}",
                      textColor: (ledger.currentBalance ?? 0.0) >= 0
                          ? Colors.green
                          : context.errorColor))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContents(BuildContext context, String label, String content,
      {Color? textColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textColor ??
                  context.defaultTextColor.withValues(alpha: 0.32)),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          content,
          style: context.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textColor ??
                  context.defaultTextColor.withValues(alpha: 0.75)),
        )
      ],
    );
  }
}
