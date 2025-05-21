import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesTransactionCard extends StatelessWidget {
  final SalesInvoiceListEntity salesInvoice;
  final ValueNotifier<bool> isSelectedNotifier;
  final bool isTaxEnabled;

  const SalesTransactionCard(
      {super.key,
      required this.salesInvoice,
      required this.isSelectedNotifier,
      this.isTaxEnabled = false});

  Color _getStatusColor(BuildContext context) {
    final status = "paid";
    switch (status) {
      case 'paid':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      case 'draft':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isSelectedNotifier.value = !isSelectedNotifier.value,
      child: ValueListenableBuilder<bool>(
        valueListenable: isSelectedNotifier,
        builder: (context, isSelected, _) {
          return Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: AppUtils.isDarkMode(context)
                      ? const Color(0xFF2B2E30)
                      : const Color(0xFFF9F9F9),
                  border: isSelected
                      ? Border.all(
                          color: Theme.of(context).primaryColor, width: 1.5)
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopRow(context),
                    SizedBox(height: 10.h),
                    _buildCustomerRow(context),
                    if (isSelected) ...[
                      SizedBox(height: 10.h),
                      Divider(
                        color: context.defaultTextColor.withValues(alpha: 0.1),
                        thickness: 1,
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              if (isTaxEnabled) ...[
                                Text(
                                    "${context.translate(AppStrings.subTotal)} : ",
                                    style: context.textTheme.bodySmall),
                                Text(
                                  salesInvoice.grossAmount
                                          ?.toStringAsFixed(2) ??
                                      "0.00",
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                              if (isTaxEnabled) ...[
                                Text(
                                    "${context.translate(AppStrings.totalTax)} : ",
                                    style: context.textTheme.bodySmall),
                                Text(
                                  salesInvoice.tax?.toStringAsFixed(2) ??
                                      "0.00",
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                              Row(
                                children: [
                                  Text(
                                      "${context.translate(AppStrings.discount)} : ",
                                      style: context.textTheme.bodySmall),
                                  Text(
                                    salesInvoice.discount?.toStringAsFixed(2) ??
                                        "0.00",
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                      "${context.translate(AppStrings.total)} : ",
                                      style: context.textTheme.bodySmall),
                                  Text(
                                    salesInvoice.netTotal?.toStringAsFixed(2) ??
                                        "0.00",
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CustomPaint(
                  painter:
                      TriangleStatusPainter(color: _getStatusColor(context)),
                  size: const Size(24, 24),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoColumn(
          context,
          label: AppStrings.salesNo,
          value: salesInvoice.salesOrderNo ?? "",
        ),
        _buildInfoColumn(
          context,
          label: AppStrings.salesDate,
          value: DateFormatUtils.getFormettedTime(
            date: salesInvoice.saleDate ?? DateTime.now(),
          ),
        ),
        _buildInfoColumn(
          context,
          label: AppStrings.soldBy,
          value: salesInvoice.soldBy ?? "",
        ),
        _buildInfoColumn(
          context,
          label: AppStrings.netTotal,
          value: salesInvoice.netTotal?.toStringAsFixed(2) ?? "",
        ),
      ],
    );
  }

  Widget _buildCustomerRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.translate(AppStrings.customer),
          style: context.textTheme.bodySmall?.copyWith(
            color: context.defaultTextColor.withValues(alpha: 0.32),
          ),
        ),
        Text(
          salesInvoice.customerName ?? "-",
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: context.defaultTextColor.withValues(alpha: 0.75),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoColumn(BuildContext context,
      {required String label, required String value}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.translate(label),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.defaultTextColor.withValues(alpha: 0.32),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: context.defaultTextColor.withValues(alpha: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the triangle
class TriangleStatusPainter extends CustomPainter {
  final Color color;

  TriangleStatusPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(size.width, 0); // Top right corner
    path.lineTo(0, 0); // Top left corner of the triangle
    path.lineTo(size.width, size.height); // Bottom right corner
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is TriangleStatusPainter && oldDelegate.color != color;
  }
}
