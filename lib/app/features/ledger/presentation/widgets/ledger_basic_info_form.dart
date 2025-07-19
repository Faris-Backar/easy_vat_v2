// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/group/presentation/provider/group/group_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LedgerBasicInfoForm extends ConsumerStatefulWidget {
  final ValueNotifier<String?> underGroupNotifier;
  const LedgerBasicInfoForm({super.key, required this.underGroupNotifier});

  @override
  ConsumerState<LedgerBasicInfoForm> createState() =>
      _LedgerBasicInfoFormState();
}

class _LedgerBasicInfoFormState extends ConsumerState<LedgerBasicInfoForm> {
  bool isActive = true;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final underGroup = ref.watch(groupProvider);
    return Padding(
      padding: EdgeInsets.zero,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.translate(AppStrings.basicInformation),
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      label: context.translate(AppStrings.ledCode),
                      controller: SearchController(),
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      value: isActive,
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          isActive = value ?? false;
                        });
                      },
                    ),
                  ),
                  Text(
                    context.translate(
                      AppStrings.active,
                    ),
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: context.translate(AppStrings.ledgerName),
                      controller: SearchController(),
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              underGroup.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => DropdownField(
                        label: context.translate(AppStrings.underGroup),
                        valueNotifier: ValueNotifier(null),
                        items: [],
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : context.surfaceColor,
                        onChanged: (value) {},
                      ),
                  error: (message) => Text("Error: $message"),
                  loaded: (group) {
                    final List<DropdownMenuItem<String>> items = [
                      DropdownMenuItem<String>(
                        value: null,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                context.translate(AppStrings.groupName),
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                context.translate(AppStrings.underGroup),
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...group.map((g) {
                        return DropdownMenuItem<String>(
                          value: g.groupName,
                          child: Row(
                            children: [
                              Expanded(child: Text(g.groupName ?? "")),
                              Expanded(child: Text(g.underGroup ?? "")),
                            ],
                          ),
                        );
                      }).toList(),
                    ];

                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.translate(AppStrings.underGroup),
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 38.h,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: context.colorScheme.outline
                                        .withValues(alpha: 0.4),
                                  ),
                                  color: AppUtils.isDarkMode(context)
                                      ? context.colorScheme.tertiaryContainer
                                      : context.surfaceColor,
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: widget.underGroupNotifier.value,
                                  hint: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                              context.translate(
                                                  AppStrings.groupName),
                                              style: context
                                                  .textTheme.bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600))),
                                      Expanded(
                                          child: Text(
                                              context.translate(
                                                  AppStrings.underGroup),
                                              style: context
                                                  .textTheme.bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600))),
                                    ],
                                  ),
                                  items: items,
                                  onChanged: (value) {
                                    widget.underGroupNotifier.value = value;
                                  },
                                  underline: SizedBox(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      label: context.translate(AppStrings.openBal),
                      controller: SearchController(),
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DropdownField(
                      label: "",
                      valueNotifier: ValueNotifier(null),
                      items: ["Dr", "Cr"],
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : context.surfaceColor,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      label: context.translate(AppStrings.currentBal),
                      controller: SearchController(),
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                      enabled: false,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextField(
                      label: "",
                      controller: SearchController(),
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                      enabled: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
