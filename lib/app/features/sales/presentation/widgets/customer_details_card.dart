import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerDetailsCard extends StatelessWidget {
  final bool isExpanded;
  final CustomerEntity customer;
  const CustomerDetailsCard(
      {super.key, required this.isExpanded, required this.customer});

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
          _buildHeaderRow(context, customer.ledgerName ?? "-"),
          const SizedBox(height: 10),
          _buildDetailsRow([
            _buildCustomerDetail(context, AppStrings.outstanding,
                customer.openingBalance?.toStringAsFixed(2) ?? "-"),
            _buildCustomerDetail(context, AppStrings.creditLimit,
                customer.creditLimit?.toStringAsFixed(2) ?? "0.0"),
            _buildCustomerDetail(context, AppStrings.creditDays,
                customer.creditDays?.toString() ?? "0"),
            _buildCustomerDetail(
                context, AppStrings.status, customer.nature ?? "-"),
          ]),
          if (isExpanded) ...[
            const SizedBox(height: 12),
            _buildDetailsRow([
              _buildCustomerDetail(
                  context, AppStrings.address, customer.billingAddress ?? "-"),
              _buildCustomerDetail(
                  context, AppStrings.phoneNumber, customer.phone ?? "-"),
            ]),
            const SizedBox(height: 12),
            _buildDetailsRow([
              _buildCustomerDetail(
                  context, AppStrings.trn, customer.taxRegistrationNo ?? "-"),
              const SizedBox.shrink(),
            ]),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailsRow(List<Widget> children) {
    return Row(
        children: children.map((child) => Expanded(child: child)).toList());
  }

  Widget _buildCustomerDetail(
      BuildContext context, String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: context.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colorScheme.outline)),
        const SizedBox(height: 5),
        Text(content,
            style: context.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildHeaderRow(BuildContext context, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
        const Icon(Icons.keyboard_arrow_down_rounded),
      ],
    );
  }
}
