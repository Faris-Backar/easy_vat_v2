import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/utils/form_utils.dart';
import 'package:easy_vat_v2/app/features/auth/domain/usecase/params/login_params.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/providers/user_login/login_notifier.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/providers/user_login/login_state.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVisibilityNotifier = ValueNotifier(true);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 41.h,
                  ),
                  SizedBox(
                    height: 67.h,
                    width: 67.w,
                    child: Image.asset(Assets.images.logo.path),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    context.translate(AppStrings.loginToEasyVat),
                    style: context.textTheme.displaySmall?.copyWith(
                        fontSize: 28.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    context.translate(AppStrings.logicnSubtitle),
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomTextField(
                    label: context.translate(AppStrings.username),
                    controller: _usernameController,
                    fillColor: context.colorScheme.surface,
                    hint: context.translate(AppStrings.username),
                    validator: FormUtils.userNameValidator,
                    textInputAction: TextInputAction.next,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                    prefixIcon: Container(
                      width: 55.w,
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgIcon(
                            icon: Assets.icons.customer,
                            color: context.defaultTextColor,
                          ),
                          VerticalDivider(
                            endIndent: 0,
                            indent: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ValueListenableBuilder(
                    valueListenable: _passwordVisibilityNotifier,
                    builder:
                        (BuildContext context, bool isVisible, Widget? child) {
                      return CustomTextField(
                        label: context.translate(AppStrings.password),
                        controller: _passwordController,
                        hint: context.translate(AppStrings.password),
                        textInputAction: TextInputAction.done,
                        validator: FormUtils.passWordValidator,
                        fillColor: context.colorScheme.surface,
                        passwordvisibility: isVisible,
                        prefixIcon: Container(
                          width: 55.w,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              SvgIcon(
                                icon: Assets.icons.lock,
                                color: context.defaultTextColor,
                              ),
                              VerticalDivider(
                                endIndent: 0,
                                indent: 0,
                              )
                            ],
                          ),
                        ),
                        style: context.textTheme.bodyMedium?.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _passwordVisibilityNotifier.value =
                                  !_passwordVisibilityNotifier.value;
                            },
                            icon: isVisible
                                ? Icon(Icons.visibility_rounded)
                                : Icon(Icons.visibility_off_rounded)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical:8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TermsAndConditionsWidget(),
              SizedBox(
                height: 15.h,
              ),
              Consumer(builder: (context, WidgetRef ref, child) {
                final loginState = ref.watch(loginProvider);

                ref.listen<LoginState>(loginProvider, (previous, next) {
                  next.mapOrNull(
                    success: (loginDate) {
                      Fluttertoast.showToast(
                          msg: context.translate(AppStrings.loginSuccess));
                      context.router.pushNamed(AppRouter.pin);
                    },
                    failed: (error) {
                      Fluttertoast.showToast(msg: error.error);
                    },
                  );
                });

                return loginState.maybeWhen(
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
                      if (_formKey.currentState?.validate() == true) {
                        final params = LoginParams(
                            username: _usernameController.text,
                            password: _passwordController.text);
                        ref.read(loginProvider.notifier).login(params: params);
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
            ],
          ),
        ),
      ),
    );
  }
}

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
              fontSize: 12,
              color: context.defaultTextColor.withValues(alpha: 0.5)),
          children: <TextSpan>[
            TextSpan(
              text: context.translate(AppStrings.privacyLoginContent),
            ),
            TextSpan(
              text: context.translate(AppStrings.privacyPolicy),
              style: TextStyle(color: context.colorScheme.primary),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: " ${context.translate(AppStrings.and)} ",
            ),
            TextSpan(
              text: context.translate(AppStrings.termsAndCondition),
              style: TextStyle(color: context.colorScheme.primary),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: '.',
            ),
          ],
        ),
      ),
    );
  }
}
