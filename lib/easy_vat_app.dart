import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
            theme: ThemeData(fontFamily: FontFamily.inter),
          );
        });
  }
}
