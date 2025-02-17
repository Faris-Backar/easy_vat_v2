import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: splash),
        AutoRoute(page: MainRoute.page, path: main, initial: true, children: [
          AutoRoute(page: DashBoardRoute.page, path: dashboard),
          AutoRoute(page: DayBookRoute.page, path: daybook),
          AutoRoute(page: HomeRoute.page, path: home),
          AutoRoute(page: ReportRoute.page, path: report),
          AutoRoute(page: SettingsRoute.page, path: settings),
        ]),
      ];

  @override
  List<AutoRouteGuard> get guards => [];

  //pages
  static const String splash = "/splash";
  static const String main = "/";
  static const String dashboard = "dashboard";
  static const String daybook = "daybook";
  static const String report = "report";
  static const String settings = "settings";
  static const String home = "home";
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated =
        prefs.getBool(PrefResources.isAuthenticated) ?? false;
    if (isAuthenticated) {
      resolver.next();
    } else {
      // router.replaceNamed(AppRouter.loginScreen);
    }
  }
}
