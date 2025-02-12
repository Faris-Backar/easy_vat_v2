import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: splash, initial: true),
      ];

  @override
  List<AutoRouteGuard> get guards => [];

  //pages
  static const String splash = "/";
}
