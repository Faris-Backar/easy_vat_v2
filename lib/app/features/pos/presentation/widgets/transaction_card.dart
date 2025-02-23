import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCard extends StatelessWidget {
  final String salesOrderNumber;
  final DateTime salesDate;
  final String customerName;
  final String soldBy;
  final double netTotal;
  final String status;

  const TransactionCard(
      {super.key,
      required this.salesOrderNumber,
      required this.salesDate,
      required this.customerName,
      required this.soldBy,
      required this.netTotal,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(
          context: context,
          label: AppStrings.saleNo,
          value: AppStrings.salesDate,
          leftBoxColor: context.colorScheme.tertiary,
          rightBoxColor: context.colorScheme.tertiary,
          isHeader: true,
        ),
        _buildRow(
          context: context,
          label: salesOrderNumber,
          value:
              "${DateFormatUtils.getDateOnly(date: DateTime.now())} \u2022 ${DateFormatUtils.getFormettedTime(date: DateTime.now())}",
          leftBoxColor: CustomColors.getTransactionCardGreyColor(context),
          rightBoxColor: CustomColors.getTransactionCardGreyColor(context),
        ),
        _buildRow(
          context: context,
          label: AppStrings.customer,
          value: customerName,
          leftBoxColor: CustomColors.getTransactionCardDarkGreyColor(context),
          rightBoxColor: CustomColors.getTransactionCardGreyColor(context),
        ),
        _buildRow(
          context: context,
          label: AppStrings.soldBy,
          value: soldBy,
          leftBoxColor: CustomColors.getTransactionCardDarkGreyColor(context),
          rightBoxColor: CustomColors.getTransactionCardGreyColor(context),
        ),
        _buildRow(
          context: context,
          label: AppStrings.netTotal,
          value: "\$ $netTotal",
          leftBoxColor: CustomColors.getTransactionCardDarkGreyColor(context),
          rightBoxColor: CustomColors.getTransactionCardGreyColor(context),
        ),
        _buildFooter(context)
      ],
    );
  }

  Widget _buildBox(
      {required BuildContext context,
      required String text,
      required Color color,
      bool isBold = false,
      bool isHeader = false,
      bool isRightHeader = false,
      bool isLeftHeader = false}) {
    return Container(
      height: 34.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: isHeader
              ? BorderRadius.only(
                  topLeft: isLeftHeader ? Radius.circular(12.r) : Radius.zero,
                  topRight: isRightHeader ? Radius.circular(12.r) : Radius.zero)
              : null),
      child: Text(
        text,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
          color: isBold ? context.colorScheme.onPrimary : null,
        ),
      ),
    );
  }

  Widget _buildRow({
    required BuildContext context,
    required String label,
    required String value,
    required Color leftBoxColor,
    required Color rightBoxColor,
    bool isHeader = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildBox(
              context: context,
              text: label,
              color: leftBoxColor,
              isBold: isHeader,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            flex: 4,
            child: _buildBox(
              context: context,
              text: value,
              color: rightBoxColor,
              isBold: isHeader,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader({
    required BuildContext context,
    required String label,
    required String value,
    required Color leftBoxColor,
    required Color rightBoxColor,
    bool isHeader = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildBox(
                context: context,
                text: label,
                color: leftBoxColor,
                isBold: isHeader,
                isHeader: true,
                isLeftHeader: true),
          ),
          SizedBox(width: 4.w),
          Expanded(
            flex: 4,
            child: _buildBox(
                context: context,
                text: value,
                color: rightBoxColor,
                isBold: isHeader,
                isHeader: true,
                isRightHeader: true),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    Color footerColor;
    footerColor = switch (status) {
      AppStrings.unPaid => CustomColors.getTransactionCardRedColor(context),
      AppStrings.cash => CustomColors.getTransactionCardGreenColor(context),
      AppStrings.bank => CustomColors.getTransactionCardBlueColor(context),
      AppStrings.card => CustomColors.getTransactionSkyBlueColor(context),
      _ => CustomColors.getTransactionCardGreenColor(context),
    };

    return Container(
      height: 26.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
        color: footerColor.withValues(alpha: 0.2),
      ),
      alignment: Alignment.center,
      child: Text(
        status,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: footerColor,
        ),
      ),
    );
  }
}
