// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:easy_vat_v2/app/features/auth/presentation/pages/login_screen.dart'
    as _i10;
import 'package:easy_vat_v2/app/features/auth/presentation/pages/pin_screen.dart'
    as _i13;
import 'package:easy_vat_v2/app/features/barcode_scan/presentation/pages/barcode_scanner_screen.dart'
    as _i3;
import 'package:easy_vat_v2/app/features/cart/presentation/pages/cart_screen.dart'
    as _i4;
import 'package:easy_vat_v2/app/features/dahsboard/presentation/pages/dashboard_screen.dart'
    as _i5;
import 'package:easy_vat_v2/app/features/daybook/presentation/pages/daybook_screen.dart'
    as _i6;
import 'package:easy_vat_v2/app/features/expense/presentation/pages/add_new_expense_screen.dart'
    as _i1;
import 'package:easy_vat_v2/app/features/expense/presentation/pages/expense_invoice_screen.dart'
    as _i7;
import 'package:easy_vat_v2/app/features/expense/presentation/pages/expense_screen.dart'
    as _i8;
import 'package:easy_vat_v2/app/features/main/presentation/pages/home_screen.dart'
    as _i9;
import 'package:easy_vat_v2/app/features/main/presentation/pages/main_screen.dart'
    as _i11;
import 'package:easy_vat_v2/app/features/pdf_viewer/pdf_viewer_screen.dart'
    as _i12;
import 'package:easy_vat_v2/app/features/pos/presentation/pages/pos_screen.dart'
    as _i14;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_invoice.dart'
    as _i15;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_order_screen.dart'
    as _i16;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_return_screen.dart'
    as _i17;
import 'package:easy_vat_v2/app/features/report/presentation/pages/report_screen.dart'
    as _i18;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/add_new_sales_screen.dart'
    as _i2;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_invoice_screen.dart'
    as _i19;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_order_screen.dart'
    as _i20;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_quatation_screen.dart'
    as _i21;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_return_screen.dart'
    as _i22;
import 'package:easy_vat_v2/app/features/settings/presentation/pages/settings_screen.dart'
    as _i23;
import 'package:easy_vat_v2/app/features/splash/presentation/pages/splash_screen.dart'
    as _i24;
import 'package:flutter/material.dart' as _i26;

/// generated route for
/// [_i1.AddNewExpenseScreen]
class AddNewExpenseRoute extends _i25.PageRouteInfo<AddNewExpenseRouteArgs> {
  AddNewExpenseRoute({
    _i26.Key? key,
    String? tittle,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         AddNewExpenseRoute.name,
         args: AddNewExpenseRouteArgs(key: key, tittle: tittle),
         initialChildren: children,
       );

  static const String name = 'AddNewExpenseRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewExpenseRouteArgs>(
        orElse: () => const AddNewExpenseRouteArgs(),
      );
      return _i1.AddNewExpenseScreen(key: args.key, tittle: args.tittle);
    },
  );
}

class AddNewExpenseRouteArgs {
  const AddNewExpenseRouteArgs({this.key, this.tittle});

  final _i26.Key? key;

  final String? tittle;

  @override
  String toString() {
    return 'AddNewExpenseRouteArgs{key: $key, tittle: $tittle}';
  }
}

/// generated route for
/// [_i2.AddNewSalesScreen]
class AddNewSalesRoute extends _i25.PageRouteInfo<AddNewSalesRouteArgs> {
  AddNewSalesRoute({
    _i26.Key? key,
    bool isForPurchase = false,
    String? title,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         AddNewSalesRoute.name,
         args: AddNewSalesRouteArgs(
           key: key,
           isForPurchase: isForPurchase,
           title: title,
         ),
         initialChildren: children,
       );

  static const String name = 'AddNewSalesRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewSalesRouteArgs>(
        orElse: () => const AddNewSalesRouteArgs(),
      );
      return _i2.AddNewSalesScreen(
        key: args.key,
        isForPurchase: args.isForPurchase,
        title: args.title,
      );
    },
  );
}

class AddNewSalesRouteArgs {
  const AddNewSalesRouteArgs({
    this.key,
    this.isForPurchase = false,
    this.title,
  });

  final _i26.Key? key;

  final bool isForPurchase;

  final String? title;

  @override
  String toString() {
    return 'AddNewSalesRouteArgs{key: $key, isForPurchase: $isForPurchase, title: $title}';
  }
}

/// generated route for
/// [_i3.BarcodeScannerScreen]
class BarcodeScannerRoute extends _i25.PageRouteInfo<void> {
  const BarcodeScannerRoute({List<_i25.PageRouteInfo>? children})
    : super(BarcodeScannerRoute.name, initialChildren: children);

  static const String name = 'BarcodeScannerRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i3.BarcodeScannerScreen();
    },
  );
}

/// generated route for
/// [_i4.CartScreen]
class CartRoute extends _i25.PageRouteInfo<void> {
  const CartRoute({List<_i25.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i4.CartScreen();
    },
  );
}

/// generated route for
/// [_i5.DashBoardScreen]
class DashBoardRoute extends _i25.PageRouteInfo<void> {
  const DashBoardRoute({List<_i25.PageRouteInfo>? children})
    : super(DashBoardRoute.name, initialChildren: children);

  static const String name = 'DashBoardRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i5.DashBoardScreen();
    },
  );
}

/// generated route for
/// [_i6.DayBookScreen]
class DayBookRoute extends _i25.PageRouteInfo<void> {
  const DayBookRoute({List<_i25.PageRouteInfo>? children})
    : super(DayBookRoute.name, initialChildren: children);

  static const String name = 'DayBookRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i6.DayBookScreen();
    },
  );
}

/// generated route for
/// [_i7.ExpenseInvoiceScreen]
class ExpenseInvoiceRoute extends _i25.PageRouteInfo<void> {
  const ExpenseInvoiceRoute({List<_i25.PageRouteInfo>? children})
    : super(ExpenseInvoiceRoute.name, initialChildren: children);

  static const String name = 'ExpenseInvoiceRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i7.ExpenseInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i8.ExpenseScreen]
class ExpenseRoute extends _i25.PageRouteInfo<void> {
  const ExpenseRoute({List<_i25.PageRouteInfo>? children})
    : super(ExpenseRoute.name, initialChildren: children);

  static const String name = 'ExpenseRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i8.ExpenseScreen();
    },
  );
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i25.PageRouteInfo<void> {
  const HomeRoute({List<_i25.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomeScreen();
    },
  );
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoginScreen();
    },
  );
}

/// generated route for
/// [_i11.MainScreen]
class MainRoute extends _i25.PageRouteInfo<void> {
  const MainRoute({List<_i25.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i11.MainScreen();
    },
  );
}

/// generated route for
/// [_i12.PdfViewerScreen]
class PdfViewerRoute extends _i25.PageRouteInfo<PdfViewerRouteArgs> {
  PdfViewerRoute({
    _i26.Key? key,
    required String pathUrl,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         PdfViewerRoute.name,
         args: PdfViewerRouteArgs(key: key, pathUrl: pathUrl),
         initialChildren: children,
       );

  static const String name = 'PdfViewerRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewerRouteArgs>();
      return _i12.PdfViewerScreen(key: args.key, pathUrl: args.pathUrl);
    },
  );
}

class PdfViewerRouteArgs {
  const PdfViewerRouteArgs({this.key, required this.pathUrl});

  final _i26.Key? key;

  final String pathUrl;

  @override
  String toString() {
    return 'PdfViewerRouteArgs{key: $key, pathUrl: $pathUrl}';
  }
}

/// generated route for
/// [_i13.PinScreen]
class PinRoute extends _i25.PageRouteInfo<void> {
  const PinRoute({List<_i25.PageRouteInfo>? children})
    : super(PinRoute.name, initialChildren: children);

  static const String name = 'PinRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i13.PinScreen();
    },
  );
}

/// generated route for
/// [_i14.PosScreen]
class PosRoute extends _i25.PageRouteInfo<void> {
  const PosRoute({List<_i25.PageRouteInfo>? children})
    : super(PosRoute.name, initialChildren: children);

  static const String name = 'PosRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i14.PosScreen();
    },
  );
}

/// generated route for
/// [_i15.PurchaseInvoiceScreen]
class PurchaseInvoiceRoute extends _i25.PageRouteInfo<void> {
  const PurchaseInvoiceRoute({List<_i25.PageRouteInfo>? children})
    : super(PurchaseInvoiceRoute.name, initialChildren: children);

  static const String name = 'PurchaseInvoiceRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i15.PurchaseInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i16.PurchaseOrderScreen]
class PurchaseOrderRoute extends _i25.PageRouteInfo<void> {
  const PurchaseOrderRoute({List<_i25.PageRouteInfo>? children})
    : super(PurchaseOrderRoute.name, initialChildren: children);

  static const String name = 'PurchaseOrderRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i16.PurchaseOrderScreen();
    },
  );
}

/// generated route for
/// [_i17.PurchaseReturnScreen]
class PurchaseReturnRoute extends _i25.PageRouteInfo<void> {
  const PurchaseReturnRoute({List<_i25.PageRouteInfo>? children})
    : super(PurchaseReturnRoute.name, initialChildren: children);

  static const String name = 'PurchaseReturnRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i17.PurchaseReturnScreen();
    },
  );
}

/// generated route for
/// [_i18.ReportScreen]
class ReportRoute extends _i25.PageRouteInfo<void> {
  const ReportRoute({List<_i25.PageRouteInfo>? children})
    : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i18.ReportScreen();
    },
  );
}

/// generated route for
/// [_i19.SalesInvoiceScreen]
class SalesInvoiceRoute extends _i25.PageRouteInfo<void> {
  const SalesInvoiceRoute({List<_i25.PageRouteInfo>? children})
    : super(SalesInvoiceRoute.name, initialChildren: children);

  static const String name = 'SalesInvoiceRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i19.SalesInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i20.SalesOrderScreen]
class SalesOrderRoute extends _i25.PageRouteInfo<void> {
  const SalesOrderRoute({List<_i25.PageRouteInfo>? children})
    : super(SalesOrderRoute.name, initialChildren: children);

  static const String name = 'SalesOrderRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i20.SalesOrderScreen();
    },
  );
}

/// generated route for
/// [_i21.SalesQuatationScreen]
class SalesQuatationRoute extends _i25.PageRouteInfo<void> {
  const SalesQuatationRoute({List<_i25.PageRouteInfo>? children})
    : super(SalesQuatationRoute.name, initialChildren: children);

  static const String name = 'SalesQuatationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i21.SalesQuatationScreen();
    },
  );
}

/// generated route for
/// [_i22.SalesReturnScreen]
class SalesReturnRoute extends _i25.PageRouteInfo<void> {
  const SalesReturnRoute({List<_i25.PageRouteInfo>? children})
    : super(SalesReturnRoute.name, initialChildren: children);

  static const String name = 'SalesReturnRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i22.SalesReturnScreen();
    },
  );
}

/// generated route for
/// [_i23.SettingsScreen]
class SettingsRoute extends _i25.PageRouteInfo<void> {
  const SettingsRoute({List<_i25.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i23.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i24.SplashScreen]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i24.SplashScreen();
    },
  );
}
