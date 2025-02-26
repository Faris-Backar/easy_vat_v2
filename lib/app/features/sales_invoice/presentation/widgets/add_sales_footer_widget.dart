import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSalesFooterWidget extends StatefulWidget {
  const AddSalesFooterWidget({super.key});

  @override
  State<AddSalesFooterWidget> createState() => _AddSalesFooterWidgetState();
}

class _AddSalesFooterWidgetState extends State<AddSalesFooterWidget> {
  final _itemNameController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _itemCodeController = TextEditingController();
  final _costController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.5),
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTotalRow(context),
          SizedBox(height: 10.h),
          _buildButtonsRow(context),
        ],
      ),
    );
  }

  /// Builds the "Net Total" row
  Widget _buildTotalRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _styledText(context, AppStrings.netTotal,
            isBold: true, isOutline: true),
        _styledText(context, "\$ 0", isBold: true),
      ],
    );
  }

  /// Builds the action buttons row
  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _buildActionButton(
          context,
          Icons.add_circle_outline_rounded,
          AppStrings.addItem,
          () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.addItem,
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    CustomTextField(
                      label: AppStrings.itemName,
                      controller: _itemNameController,
                      hint: AppStrings.itemName,
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: AppStrings.barcode,
                            controller: _barcodeController,
                            hint: AppStrings.barcode,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            label: AppStrings.itemcode,
                            controller: _itemCodeController,
                            hint: AppStrings.itemcode,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: AppStrings.cost,
                            controller: _costController,
                            hint: AppStrings.cost,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            label: AppStrings.price,
                            controller: _priceController,
                            hint: AppStrings.price,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        )),
        SizedBox(width: 8.w),
        Expanded(
            child: _buildActionButton(
                context, Assets.icons.barcode, AppStrings.scan, () {},
                isSvg: true)),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context, dynamic icon, String label, VoidCallback onPressed,
      {bool isSvg = false}) {
    return SecondaryButton(
      onPressed: onPressed,
      label: "",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSvg ? SvgIcon(icon: icon) : Icon(icon, size: 18),
          SizedBox(width: 6.w),
          _styledText(context, label, isPrimary: true),
        ],
      ),
    );
  }

  Widget _styledText(BuildContext context, String text,
      {bool isBold = false, bool isOutline = false, bool isPrimary = false}) {
    return Text(
      text,
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
        color: isOutline
            ? context.colorScheme.outline
            : (isPrimary ? context.colorScheme.primary : null),
      ),
    );
  }
}
