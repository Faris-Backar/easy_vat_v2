import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      await _checkAuthStatus();
    });
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated =
        prefs.getBool(PrefResources.isAuthenticated) ?? false;

    if (mounted) {
      if (isAuthenticated) {
        context.router.replaceAll([HomeRoute()], updateExistingRoutes: true);
      } else {
        context.router.replaceAll([LoginRoute()], updateExistingRoutes: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250.h,
          width: 250.w,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Image(
            image: AssetImage(Assets.images.logo.path), // Asset image
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
