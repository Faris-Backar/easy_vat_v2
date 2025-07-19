import 'dart:developer';

import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/country/presentation/provider/country/country_notifier.dart';
import 'package:easy_vat_v2/app/features/country/presentation/provider/country_state/country_states_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LedgerAddressContactForm extends ConsumerStatefulWidget {
  final ValueNotifier<String?> countryNotifier;
  final ValueNotifier<String?> stateNotifier;
  const LedgerAddressContactForm(
      {super.key, required this.countryNotifier, required this.stateNotifier});

  @override
  ConsumerState<LedgerAddressContactForm> createState() =>
      _LedgerAddressContactFormState();
}

class _LedgerAddressContactFormState
    extends ConsumerState<LedgerAddressContactForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final country = ref.watch(countryProvider);
    final countryState = ref.watch(countryStateProvider);

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
                context.translate(AppStrings.addressContact),
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: context.translate(AppStrings.mailingName),
                      controller: SearchController(),
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    label: context.translate(AppStrings.address),
                    controller: SearchController(),
                    maxLines: 5,
                    labelAndTextfieldGap: 2,
                  ))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              country.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                error: (message) => Text("Error: $message"),
                loaded: (countries) {
                  final countryNames = countries
                      .map((country) => country.countryName ?? "")
                      .toSet()
                      .toList();
                  return Row(
                    children: [
                      Expanded(
                        child: DropdownField(
                            label: context.translate(AppStrings.country),
                            valueNotifier: widget.countryNotifier,
                            items: countryNames,
                            backgroundColor: AppUtils.isDarkMode(context)
                                ? context.colorScheme.tertiaryContainer
                                : context.surfaceColor,
                            onChanged: (selectedCountry) {
                              widget.countryNotifier.value = selectedCountry;
                              widget.stateNotifier.value = null;
                              ref
                                  .read(countryStateProvider.notifier)
                                  .getCountryState();
                            }),
                      )
                    ],
                  );
                },
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: DropdownField(
              //         label: context.translate(AppStrings.country),
              //         valueNotifier: ValueNotifier(null),
              //         items: [],
              //         onChanged: (value) {},
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(
                height: 10.h,
              ),
              countryState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => DropdownField(
                  label: context.translate(AppStrings.emirates),
                  valueNotifier: ValueNotifier(null),
                  items: [],
                  onChanged: (value) {},
                ),
                // loading: () => const Center(
                //   child: CircularProgressIndicator.adaptive(),
                // ),
                error: (message) => Text("Error: $message"),
                loaded: (states) {
                  final countryStates = states
                      .map((countryStates) => countryStates.statName ?? "")
                      .toList();

                  final isUAE = widget.countryNotifier.value?.toLowerCase() ==
                      "united arab emirates";
                  log("uae: $isUAE");
                  return Row(
                    children: [
                      Expanded(
                        child: DropdownField(
                            label: context.translate(AppStrings.emirates),
                            valueNotifier: widget.stateNotifier,
                            items: countryStates,
                            backgroundColor: AppUtils.isDarkMode(context)
                                ? context.colorScheme.tertiaryContainer
                                : context.surfaceColor,
                            enabled: isUAE,
                            onChanged: (selectedCountryState) {
                              widget.stateNotifier.value = selectedCountryState;
                            }),
                      )
                    ],
                  );
                },
              )
              // Row(
              //   children: [
              //     Expanded(
              //       child: DropdownField(
              //         label: context.translate(AppStrings.emirates),
              //         valueNotifier: ValueNotifier(null),
              //         items: [],
              //         onChanged: (value) {},
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
