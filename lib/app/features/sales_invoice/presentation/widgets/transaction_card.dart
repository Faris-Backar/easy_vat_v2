import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/entities/sales_invoice_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCard extends StatelessWidget {
  final String salesOrderNumber;
  final DateTime salesDate;
  final String customerName;
  final String soldBy;
  final double netTotal;
  final String status;
  final String refNo;
  final List<SoldItemEntity> soldItems;

  const TransactionCard(
      {super.key,
      required this.salesOrderNumber,
      required this.salesDate,
      required this.customerName,
      required this.soldBy,
      required this.netTotal,
      required this.status,
      required this.refNo,
      required this.soldItems});

  @override
  Widget build(BuildContext context) {
    final Color greyColor = CustomColors.getTransactionCardGreyColor(context);
    final Color darkGreyColor =
        CustomColors.getTransactionCardDarkGreyColor(context);

    return Column(
      children: [
        _buildCell(context, AppStrings.saleNo, AppStrings.salesDate,
            context.colorScheme.tertiary, context.colorScheme.tertiary,
            isBold: true, isHeader: true),
        _buildCell(
          context,
          salesOrderNumber,
          "${DateFormatUtils.getDateOnly(date: salesDate)} \u2022 ${DateFormatUtils.getFormettedTime(date: salesDate)}",
          greyColor,
          greyColor,
        ),
        _buildCell(context, AppStrings.customer, customerName, darkGreyColor,
            greyColor),
        _buildThreeColumnRow(
            context, AppStrings.refNo, refNo, AppStrings.netTotal, ""),
        _buildThreeColumnRow(
            context, AppStrings.soldBy, soldBy, "", "\$ $netTotal"),
        _buildFooter(context),
      ],
    );
  }

  Widget _buildCell(
    BuildContext context,
    String label,
    String value,
    Color leftColor,
    Color rightColor, {
    bool isBold = false,
    bool isHeader = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildBox(context, label, leftColor,
                isBold: isBold, isHeader: isHeader, isLeftHeader: isHeader),
          ),
          SizedBox(width: 4.w),
          Expanded(
            flex: 4,
            child: _buildBox(context, value, rightColor,
                isBold: isBold, isHeader: isHeader, isRightHeader: isHeader),
          ),
        ],
      ),
    );
  }

  Widget _buildThreeColumnRow(
    BuildContext context,
    String leftText,
    String middleText,
    String rightText,
    String rightValue,
  ) {
    final Color greyColor = CustomColors.getTransactionCardGreyColor(context);
    final Color darkGreyColor =
        CustomColors.getTransactionCardDarkGreyColor(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildBox(context, leftText, darkGreyColor),
          ),
          SizedBox(width: 4.w),
          Expanded(
            flex: 2,
            child: _buildBox(context, middleText, greyColor),
          ),
          SizedBox(width: 4.w),
          Expanded(
            flex: 2,
            child: _buildBox(
                context,
                rightText.isEmpty ? rightValue : rightText,
                rightText.isEmpty ? greyColor : darkGreyColor),
          ),
        ],
      ),
    );
  }

  Widget _buildBox(
    BuildContext context,
    String text,
    Color color, {
    bool isBold = false,
    bool isHeader = false,
    bool isLeftHeader = false,
    bool isRightHeader = false,
  }) {
    return Container(
      height: 34.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: isHeader
            ? BorderRadius.only(
                topLeft: isLeftHeader ? Radius.circular(12.r) : Radius.zero,
                topRight: isRightHeader ? Radius.circular(12.r) : Radius.zero,
              )
            : null,
      ),
      child: Text(
        text,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
          color: isBold ? context.colorScheme.onPrimary : null,
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final Color footerColor = switch (status) {
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
        color: AppUtils.isDarkMode(context)
            ? footerColor
            : footerColor.withAlpha(50),
      ),
      alignment: Alignment.center,
      child: Text(
        status,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppUtils.isDarkMode(context)
              ? context.onPrimaryColor
              : footerColor,
        ),
      ),
    );
  }
}
