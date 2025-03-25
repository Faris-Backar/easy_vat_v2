import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerAddressInfo extends StatelessWidget {
  final String address;
  final TextEditingController textEditingController;
  final VoidCallback onSubmitted;
  final String hint;
  final String label;
  const CustomerAddressInfo(
      {super.key,
      required this.address,
      required this.textEditingController,
      required this.onSubmitted,
      required this.hint,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate(AppStrings.address),
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colorScheme.outline,
          ),
        ),
        SizedBox(
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  address,
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(width: 10.0.w),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                        height: 200.h,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              label: context
                                  .translate(AppStrings.enterShippingAddress),
                              controller: textEditingController,
                              hint: context.translate(AppStrings.address),
                              maxLines: 4,
                              fillColor: AppUtils.isDarkMode(context)
                                  ? context.surfaceColor
                                  : null,
                              validator: (value) {
                                if (value?.isEmpty == true ||
                                    (value?.length ?? 0) < 5) {
                                  return "Please enter a valid address";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              height: 40.h,
                              width: double.infinity,
                              child: PrimaryButton(
                                label: context.translate(AppStrings.submit),
                                onPressed: onSubmitted,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: SvgIcon(
                  icon: Assets.icons.edit,
                  color: AppUtils.isDarkMode(context)
                      ? context.defaultTextColor
                      : null,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
