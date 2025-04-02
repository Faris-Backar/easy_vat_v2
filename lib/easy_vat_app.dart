import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/theme/app_theme.dart';
import 'package:easy_vat_v2/app/features/settings/presentation/notifiers/locale_notifiers.dart';
import 'package:easy_vat_v2/app/features/settings/presentation/notifiers/theme_notifier.dart';
import 'package:easy_vat_v2/app/core/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EasyVatApp extends StatelessWidget {
  EasyVatApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Consumer(
          builder: (context, ref, child) {
            final themeMode = ref.watch(themeNotifierProvider);
            final currentLocale = ref.watch(localeProvider);
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: _appRouter.config(),
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeMode,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: currentLocale,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              builder: (context, child) {
                return Directionality(
                  textDirection: _getTextDirection(currentLocale),
                  child: child!,
                );
              },
            );
          },
        );
      },
    );
  }

  TextDirection _getTextDirection(Locale locale) {
    if (locale.languageCode == 'ar') {
      return TextDirection.rtl; // For Arabic
    } else {
      return TextDirection.ltr; // For English and other languages
    }
  }
}
