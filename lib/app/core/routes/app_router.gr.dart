// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:easy_vat_v2/app/features/auth/presentation/pages/login_screen.dart'
    as _i6;
import 'package:easy_vat_v2/app/features/auth/presentation/pages/pin_screen.dart'
    as _i8;
import 'package:easy_vat_v2/app/features/cart/presentation/pages/cart_screen.dart'
    as _i2;
import 'package:easy_vat_v2/app/features/dahsboard/presentation/pages/dashboard_screen.dart'
    as _i3;
import 'package:easy_vat_v2/app/features/daybook/presentation/pages/daybook_screen.dart'
    as _i4;
import 'package:easy_vat_v2/app/features/main/presentation/pages/home_screen.dart'
    as _i5;
import 'package:easy_vat_v2/app/features/main/presentation/pages/main_screen.dart'
    as _i7;
import 'package:easy_vat_v2/app/features/pos/presentation/pages/pos_screen.dart'
    as _i9;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_invoice.dart'
    as _i10;
import 'package:easy_vat_v2/app/features/report/presentation/pages/report_screen.dart'
    as _i11;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/add_new_sales_screen.dart'
    as _i1;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_invoice_screen.dart'
    as _i12;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_return_screen.dart'
    as _i13;
import 'package:easy_vat_v2/app/features/settings/presentation/pages/settings_screen.dart'
    as _i14;
import 'package:easy_vat_v2/app/features/splash/presentation/pages/splash_screen.dart'
    as _i15;
import 'package:flutter/material.dart' as _i17;

/// generated route for
/// [_i1.AddNewSalesScreen]
class AddNewSalesRoute extends _i16.PageRouteInfo<AddNewSalesRouteArgs> {
  AddNewSalesRoute({
    _i17.Key? key,
    bool isForPurchase = false,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         AddNewSalesRoute.name,
         args: AddNewSalesRouteArgs(key: key, isForPurchase: isForPurchase),
         initialChildren: children,
       );

  static const String name = 'AddNewSalesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewSalesRouteArgs>(
        orElse: () => const AddNewSalesRouteArgs(),
      );
      return _i1.AddNewSalesScreen(
        key: args.key,
        isForPurchase: args.isForPurchase,
      );
    },
  );
}

class AddNewSalesRouteArgs {
  const AddNewSalesRouteArgs({this.key, this.isForPurchase = false});

  final _i17.Key? key;

  final bool isForPurchase;

  @override
  String toString() {
    return 'AddNewSalesRouteArgs{key: $key, isForPurchase: $isForPurchase}';
  }
}

/// generated route for
/// [_i2.CartScreen]
class CartRoute extends _i16.PageRouteInfo<void> {
  const CartRoute({List<_i16.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.CartScreen();
    },
  );
}

/// generated route for
/// [_i3.DashBoardScreen]
class DashBoardRoute extends _i16.PageRouteInfo<void> {
  const DashBoardRoute({List<_i16.PageRouteInfo>? children})
    : super(DashBoardRoute.name, initialChildren: children);

  static const String name = 'DashBoardRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashBoardScreen();
    },
  );
}

/// generated route for
/// [_i4.DayBookScreen]
class DayBookRoute extends _i16.PageRouteInfo<void> {
  const DayBookRoute({List<_i16.PageRouteInfo>? children})
    : super(DayBookRoute.name, initialChildren: children);

  static const String name = 'DayBookRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.DayBookScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainScreen();
    },
  );
}

/// generated route for
/// [_i8.PinScreen]
class PinRoute extends _i16.PageRouteInfo<void> {
  const PinRoute({List<_i16.PageRouteInfo>? children})
    : super(PinRoute.name, initialChildren: children);

  static const String name = 'PinRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.PinScreen();
    },
  );
}

/// generated route for
/// [_i9.PosScreen]
class PosRoute extends _i16.PageRouteInfo<void> {
  const PosRoute({List<_i16.PageRouteInfo>? children})
    : super(PosRoute.name, initialChildren: children);

  static const String name = 'PosRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.PosScreen();
    },
  );
}

/// generated route for
/// [_i10.PurchaseInvoiceScreen]
class PurchaseInvoiceRoute extends _i16.PageRouteInfo<void> {
  const PurchaseInvoiceRoute({List<_i16.PageRouteInfo>? children})
    : super(PurchaseInvoiceRoute.name, initialChildren: children);

  static const String name = 'PurchaseInvoiceRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.PurchaseInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i11.ReportScreen]
class ReportRoute extends _i16.PageRouteInfo<void> {
  const ReportRoute({List<_i16.PageRouteInfo>? children})
    : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.ReportScreen();
    },
  );
}

/// generated route for
/// [_i12.SalesInvoiceScreen]
class SalesInvoiceRoute extends _i16.PageRouteInfo<void> {
  const SalesInvoiceRoute({List<_i16.PageRouteInfo>? children})
    : super(SalesInvoiceRoute.name, initialChildren: children);

  static const String name = 'SalesInvoiceRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.SalesInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i13.SalesReturnScreen]
class SalesReturnRoute extends _i16.PageRouteInfo<void> {
  const SalesReturnRoute({List<_i16.PageRouteInfo>? children})
    : super(SalesReturnRoute.name, initialChildren: children);

  static const String name = 'SalesReturnRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.SalesReturnScreen();
    },
  );
}

/// generated route for
/// [_i14.SettingsScreen]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i15.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.SplashScreen();
    },
  );
}
