import 'package:flutter/material.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';

class ExpenseCard extends StatelessWidget {
  final ExpenseListEntity expense;
  const ExpenseCard({super.key, required this.expense});

  Color _getStatusColor(BuildContext context) {
    final status = "paid"; // You can replace this with expense.status
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
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppUtils.isDarkMode(context)
                ? const Color(0xFF2B2E30)
                : const Color(0xFFF9F9F9),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expense No
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.expenseNo),
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: context.defaultTextColor
                                .withValues(alpha: 0.75),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          expense.expenseNo?.toStringAsFixed(2) ?? "",
                          style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: context.defaultTextColor
                                  .withValues(alpha: 0.75)),
                        ),
                      ],
                    ),
                  ),

                  // Reference No
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.refNo),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.defaultTextColor
                                .withValues(alpha: 0.32),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          expense.referenceNo ?? "",
                          style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: context.defaultTextColor
                                  .withValues(alpha: 0.75)),
                        )
                      ],
                    ),
                  ),
                  // Supplier Invoice No
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.supInvNo),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.defaultTextColor
                                .withValues(alpha: 0.32),
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          expense.supplierInvoiceNo ?? "",
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: context.defaultTextColor
                                .withValues(alpha: 0.75),
                          ),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  // Supplier
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.supplier),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.defaultTextColor
                                .withValues(alpha: 0.32),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          expense.supplierName ?? "",
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: context.defaultTextColor
                                .withValues(alpha: 0.75),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Net Total
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.translate(AppStrings.netTotal),
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.defaultTextColor
                                  .withValues(alpha: 0.32),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            expense.netTotal?.toStringAsFixed(2) ?? "",
                            style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: context.defaultTextColor
                                    .withValues(alpha: 0.75)),
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: CustomPaint(
            painter: TriangleStatusPainter(color: _getStatusColor(context)),
            size: const Size(24, 24),
          ),
        ),
      ],
    );
  }
}

class TriangleStatusPainter extends CustomPainter {
  final Color color;
  TriangleStatusPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is TriangleStatusPainter && oldDelegate.color != color;
  }
}
