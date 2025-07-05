import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DebitLedgerInfoTabContext extends StatelessWidget {
  final String ledgerName;
  final String currentBalance;
  const DebitLedgerInfoTabContext(
      {super.key, required this.ledgerName, required this.currentBalance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate(AppStrings.ledger),
              style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.defaultTextColor.withValues(alpha: 0.5)),
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 5,
                  child: SizedBox(
                    height: 40.h,
                    child: Text(
                      ledgerName,
                      style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.clip),
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    if (ledgerName.toLowerCase() != "ledger") {
                      return Flexible(
                        fit: FlexFit.loose,
                        flex: 1,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: context.colorScheme.error
                                    .withValues(alpha: 0.1),
                                border: Border.all(
                                  color: context.colorScheme.error
                                      .withValues(alpha: 0.3),
                                  width: 1,
                                )),
                            child: Icon(
                              Icons.close_rounded,
                              size: 16,
                              color: context.colorScheme.error,
                            ),
                          ),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                )
              ],
            ),
            _buildTransactionsHeaders(context,
                label: currentBalance,
                content: context.translate(AppStrings.curBal))
          ],
        )
      ],
    );
  }

  _buildTransactionsHeaders(BuildContext context,
      {required String label, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.defaultTextColor.withValues(alpha: 0.5)),
        ),
        Text(
          content,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
