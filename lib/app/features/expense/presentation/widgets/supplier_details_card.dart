import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplierDetailsCard extends StatelessWidget {
  final bool isExpanded;
  final SupplierEntity supplier;
  const SupplierDetailsCard(
      {super.key, required this.isExpanded, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isExpanded ? 190.h : 89.h,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isExpanded
              ? context.colorScheme.secondary
              : context.colorScheme.outline.withValues(alpha: 0.5),
        ),
        color: AppUtils.isDarkMode(context)
            ? Color(0xFF2B2E30)
            : const Color(0xFFF9F9F9),
      ),
      child: Column(
        children: [
          // supplier ledger name,
          _buildHeaderRow(context, supplier.ledgerName ?? "-"),
          const SizedBox(
            height: 10,
          ),
          _buildDetailsRow([
            _buildSupplierDetail(
                context,
                context.translate(AppStrings.outstanding),
                supplier.openingBalance?.toStringAsFixed(2) ?? "-"),
            _buildSupplierDetail(
                context,
                context.translate(AppStrings.creditLimit),
                supplier.creditLimit?.toStringAsFixed(2) ?? "-"),
            _buildSupplierDetail(
                context,
                context.translate(AppStrings.creditDays),
                supplier.creditDays?.toStringAsFixed(2) ?? "-"),
          ]),
          if (isExpanded) ...[
            const SizedBox(
              height: 12,
            ),
            _buildDetailsRow([
              _buildSupplierDetail(
                  context,
                  context.translate(AppStrings.address),
                  supplier.billingAddress ?? "-"),
              _buildSupplierDetail(
                  context,
                  context.translate(AppStrings.phoneNumber),
                  supplier.phone ?? "-"),
            ]),
            const SizedBox(
              height: 12,
            ),
            _buildDetailsRow([
              _buildSupplierDetail(context, context.translate(AppStrings.trn),
                  supplier.taxRegistrationNo ?? "-"),
              const SizedBox.shrink()
            ])
          ]
        ],
      ),
    );
  }

  Widget _buildDetailsRow(List<Widget> children) {
    return Row(
      children: children
          .map((child) => Expanded(
                child: child,
              ))
          .toList(),
    );
  }

  Widget _buildSupplierDetail(
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
        Text(
          name,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const Icon(Icons.keyboard_arrow_down_rounded)
      ],
    );
  }
}
