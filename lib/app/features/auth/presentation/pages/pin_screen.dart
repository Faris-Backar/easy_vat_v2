import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/providers/pin_login/pin_login_notifier.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/providers/pin_login/pin_login_state.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: context.colorScheme.surfaceContainerLowest,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Text(
              context.translate(AppStrings.enterYouEmployeeCode),
              style: context.textTheme.displaySmall
                  ?.copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16.h,
            ),
            Pinput(
              controller: _pinController,
              enabled: true,
              length: 6,
              defaultPinTheme: PinTheme(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: context.colorScheme.tertiary,
                  border: Border.all(
                      color:
                          context.colorScheme.primary.withValues(alpha: 0.12),
                      style: BorderStyle.solid),
                ),
                height: 46.h,
                width: 50.w,
              ),
              crossAxisAlignment: CrossAxisAlignment.center,
              onTapOutside: (event) {
                FocusScopeNode().unfocus();
              },
              obscureText: true,
              focusedPinTheme: PinTheme(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: context.colorScheme.tertiary,
                  border: Border.all(
                    color: context.colorScheme.primary,
                  ),
                ),
                height: 46.h,
                width: 50.w,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Text(
                  context.translate(AppStrings.whatIsMyCode),
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: context.defaultTextColor.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  context.translate(AppStrings.connectAdmin),
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: context.defaultTextColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 32.0),
        child: Consumer(builder: (context, WidgetRef ref, child) {
          final pinLoginState = ref.watch(pinLoginProvider);

          ref.listen<PinLoginState>(pinLoginProvider, (previous, next) {
            next.mapOrNull(
              success: (loginData) {
                Fluttertoast.showToast(
                    msg: context.translate(AppStrings.loginSuccess));
                context.router.pushAndPopUntil(
                  const MainRoute(),
                  predicate: (_) => false,
                );
              },
              failed: (error) {
                Fluttertoast.showToast(msg: error.error);
              },
            );
          });

          return pinLoginState.maybeWhen(
            loading: () => PrimaryButton(
              width: double.infinity,
              height: 38.h,
              onPressed: () {},
              isLoading: true,
            ),
            orElse: () => PrimaryButton(
              width: double.infinity,
              height: 38.h,
              onPressed: () {
                if (_pinController.text.length == 6) {
                  ref
                      .read(pinLoginProvider.notifier)
                      .pinLogin(params: _pinController.text);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isRtl)
                    Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  Text(
                    context.translate(AppStrings.continueKey),
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  if (!isRtl)
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
