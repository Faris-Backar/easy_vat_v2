import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: splash),
        AutoRoute(page: LoginRoute.page, path: login, initial: true),
        AutoRoute(
            guards: [AuthGuard()],
            page: MainRoute.page,
            path: main,
            children: [
              AutoRoute(page: DashBoardRoute.page, path: dashboard),
              AutoRoute(page: DayBookRoute.page, path: daybook),
              AutoRoute(page: HomeRoute.page, path: home, initial: true),
              AutoRoute(page: ReportRoute.page, path: report),
              AutoRoute(page: SettingsRoute.page, path: settings),
            ]),
        AutoRoute(page: PosRoute.page, path: pos),
        AutoRoute(page: AddNewSalesRoute.page, path: addNewSales),
        AutoRoute(page: SalesInvoiceRoute.page, path: salesInvoice),
        AutoRoute(page: CartRoute.page, path: cart),
        AutoRoute(page: PurchaseInvoiceRoute.page, path: purchaseInvoice),
        AutoRoute(page: PinRoute.page, path: pin),
      ];

  // Routes constants
  static const String splash = "/splash";
  static const String main = "/";
  static const String dashboard = "dashboard";
  static const String daybook = "daybook";
  static const String report = "report";
  static const String settings = "settings";
  static const String home = "home";
  static const String pos = "/pos";
  static const String addNewSales = "/add-new-sales";
  static const String salesInvoice = "/sales-invoice";
  static const String cart = "/cart";
  static const String purchaseInvoice = "/purchase-invoice";
  static const String addNewPurchase = "/add-new-purchase";
  static const String login = "/login";
  static const String pin = "/pin";
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated =
        prefs.getBool(PrefResources.isAuthenticated) ?? false;
    log("is Authenticated => $isAuthenticated");
    if (isAuthenticated) {
      resolver.next();
    } else {
      router.replace(LoginRoute());
    }
  }
}
