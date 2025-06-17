// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:easy_vat_v2/app/features/auth/presentation/pages/login_screen.dart'
    as _i12;
import 'package:easy_vat_v2/app/features/auth/presentation/pages/pin_screen.dart'
    as _i16;
import 'package:easy_vat_v2/app/features/barcode_scan/presentation/pages/barcode_scanner_screen.dart'
    as _i5;
import 'package:easy_vat_v2/app/features/cart/presentation/pages/cart_screen.dart'
    as _i6;
import 'package:easy_vat_v2/app/features/dahsboard/presentation/pages/dashboard_screen.dart'
    as _i7;
import 'package:easy_vat_v2/app/features/daybook/presentation/pages/daybook_screen.dart'
    as _i8;
import 'package:easy_vat_v2/app/features/expense/presentation/pages/add_new_expense_screen.dart'
    as _i1;
import 'package:easy_vat_v2/app/features/expense/presentation/pages/expense_screen.dart'
    as _i9;
import 'package:easy_vat_v2/app/features/income/presentation/pages/add_new_income_screen.dart'
    as _i2;
import 'package:easy_vat_v2/app/features/income/presentation/pages/income_screen.dart'
    as _i11;
import 'package:easy_vat_v2/app/features/main/presentation/pages/home_screen.dart'
    as _i10;
import 'package:easy_vat_v2/app/features/main/presentation/pages/main_screen.dart'
    as _i13;
import 'package:easy_vat_v2/app/features/no_internet/presentation/pages/no_internet_screen.dart'
    as _i14;
import 'package:easy_vat_v2/app/features/pdf_viewer/pdf_viewer_screen.dart'
    as _i15;
import 'package:easy_vat_v2/app/features/pos/presentation/pages/pos_screen.dart'
    as _i17;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/add_new_purchase_screen.dart'
    as _i3;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_invoice.dart'
    as _i18;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_order_screen.dart'
    as _i19;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_return_screen.dart'
    as _i20;
import 'package:easy_vat_v2/app/features/report/presentation/pages/report_screen.dart'
    as _i21;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/add_new_sales_screen.dart'
    as _i4;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_invoice_screen.dart'
    as _i22;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_order_screen.dart'
    as _i23;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_quatation_screen.dart'
    as _i24;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_return_screen.dart'
    as _i25;
import 'package:easy_vat_v2/app/features/settings/presentation/pages/settings_screen.dart'
    as _i26;
import 'package:flutter/foundation.dart' as _i29;

import 'package:easy_vat_v2/app/features/splash/presentation/pages/splash_screen.dart'
    as _i27;
import 'package:flutter/material.dart' as _i30;

/// generated route for
/// [_i1.AddNewExpenseScreen]
class AddNewExpenseRoute extends _i28.PageRouteInfo<AddNewExpenseRouteArgs> {
  AddNewExpenseRoute({
    _i29.Key? key,
    String? tittle,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          AddNewExpenseRoute.name,
          args: AddNewExpenseRouteArgs(key: key, tittle: tittle),
          initialChildren: children,
        );

  static const String name = 'AddNewExpenseRoute';

  static _i28.PageInfo page = _i28.PageInfo(
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

  final _i29.Key? key;

  final String? tittle;

  @override
  String toString() {
    return 'AddNewExpenseRouteArgs{key: $key, tittle: $tittle}';
  }
}

/// generated route for
/// [_i2.AddNewIncomeScreen]
class AddNewIncomeRoute extends _i28.PageRouteInfo<AddNewIncomeRouteArgs> {
  AddNewIncomeRoute({
    _i29.Key? key,
    String? title,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          AddNewIncomeRoute.name,
          args: AddNewIncomeRouteArgs(key: key, title: title),
          initialChildren: children,
        );

  static const String name = 'AddNewIncomeRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewIncomeRouteArgs>(
        orElse: () => const AddNewIncomeRouteArgs(),
      );
      return _i2.AddNewIncomeScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewIncomeRouteArgs {
  const AddNewIncomeRouteArgs({this.key, this.title});

  final _i29.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewIncomeRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.AddNewPurchaseScreen]
class AddNewPurchaseRoute extends _i28.PageRouteInfo<AddNewPurchaseRouteArgs> {
  AddNewPurchaseRoute({
    _i29.Key? key,
    String? title,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          AddNewPurchaseRoute.name,
          args: AddNewPurchaseRouteArgs(key: key, title: title),
          initialChildren: children,
        );

  static const String name = 'AddNewPurchaseRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewPurchaseRouteArgs>(
        orElse: () => const AddNewPurchaseRouteArgs(),
      );
      return _i3.AddNewPurchaseScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewPurchaseRouteArgs {
  const AddNewPurchaseRouteArgs({this.key, this.title});

  final _i29.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewPurchaseRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i4.AddNewSalesScreen]
class AddNewSalesRoute extends _i28.PageRouteInfo<AddNewSalesRouteArgs> {
  AddNewSalesRoute({
    _i29.Key? key,
    bool isForPurchase = false,
    String? title,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          AddNewSalesRoute.name,
          args: AddNewSalesRouteArgs(
              key: key, title: title, isForPurchase: isForPurchase),
          initialChildren: children,
        );

  static const String name = 'AddNewSalesRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewSalesRouteArgs>(
        orElse: () => const AddNewSalesRouteArgs(),
      );
      return _i4.AddNewSalesScreen(
        key: args.key,
        isForPurchase: args.isForPurchase,
        title: args.title,
      );
    },
  );
}

class AddNewSalesRouteArgs {
  const AddNewSalesRouteArgs(
      {this.key, this.title, this.isForPurchase = false});

  final _i29.Key? key;
  final String? title;
  final bool isForPurchase;

  @override
  String toString() {
    return 'AddNewSalesRouteArgs{key: $key, title: $title, isForPurchase: $isForPurchase}';
  }
}

/// generated route for
/// [_i5.BarcodeScannerScreen]
class BarcodeScannerRoute extends _i28.PageRouteInfo<void> {
  const BarcodeScannerRoute({List<_i28.PageRouteInfo>? children})
      : super(BarcodeScannerRoute.name, initialChildren: children);

  static const String name = 'BarcodeScannerRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i5.BarcodeScannerScreen();
    },
  );
}

/// generated route for
/// [_i6.CartScreen]
class CartRoute extends _i28.PageRouteInfo<void> {
  const CartRoute({List<_i28.PageRouteInfo>? children})
      : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i6.CartScreen();
    },
  );
}

/// generated route for
/// [_i7.DashBoardScreen]
class DashBoardRoute extends _i28.PageRouteInfo<void> {
  const DashBoardRoute({List<_i28.PageRouteInfo>? children})
      : super(DashBoardRoute.name, initialChildren: children);

  static const String name = 'DashBoardRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i7.DashBoardScreen();
    },
  );
}

/// generated route for
/// [_i8.DayBookScreen]
class DayBookRoute extends _i28.PageRouteInfo<void> {
  const DayBookRoute({List<_i28.PageRouteInfo>? children})
      : super(DayBookRoute.name, initialChildren: children);

  static const String name = 'DayBookRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i8.DayBookScreen();
    },
  );
}

/// generated route for
/// [_i9.ExpenseScreen]
class ExpenseRoute extends _i28.PageRouteInfo<void> {
  const ExpenseRoute({List<_i28.PageRouteInfo>? children})
      : super(ExpenseRoute.name, initialChildren: children);

  static const String name = 'ExpenseRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i9.ExpenseScreen();
    },
  );
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i28.PageRouteInfo<void> {
  const HomeRoute({List<_i28.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i10.HomeScreen();
    },
  );
}

/// generated route for
/// [_i11.IncomeScreen]
class IncomeRoute extends _i28.PageRouteInfo<void> {
  const IncomeRoute({List<_i28.PageRouteInfo>? children})
      : super(IncomeRoute.name, initialChildren: children);

  static const String name = 'IncomeRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i11.IncomeScreen();
    },
  );
}

/// generated route for
/// [_i12.LoginScreen]
class LoginRoute extends _i28.PageRouteInfo<void> {
  const LoginRoute({List<_i28.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i12.LoginScreen();
    },
  );
}

/// generated route for
/// [_i13.MainScreen]
class MainRoute extends _i28.PageRouteInfo<void> {
  const MainRoute({List<_i28.PageRouteInfo>? children})
      : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i13.MainScreen();
    },
  );
}

/// generated route for
/// [_i14.NoInternetScreen]
class NoInternetRoute extends _i28.PageRouteInfo<void> {
  const NoInternetRoute({List<_i28.PageRouteInfo>? children})
      : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i14.NoInternetScreen();
    },
  );
}

/// generated route for
/// [_i15.PdfViewerScreen]
class PdfViewerRoute extends _i28.PageRouteInfo<PdfViewerRouteArgs> {
  PdfViewerRoute({
    _i30.Key? key,
    required String pdfUrl,
    required _i15.PDFType pdfType,
    String? pdfName,
    required Map<String, dynamic> queryParameters,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          PdfViewerRoute.name,
          args: PdfViewerRouteArgs(
            key: key,
            pdfUrl: pdfUrl,
            pdfName: pdfName,
            queryParameters: queryParameters,
            pdfType: pdfType,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfViewerRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewerRouteArgs>();
      return _i15.PdfViewerScreen(
        key: args.key,
        pdfUrl: args.pdfUrl,
        pdfType: args.pdfType,
        pdfName: args.pdfName,
        queryParameters: args.queryParameters,
      );
    },
  );
}

class PdfViewerRouteArgs {
  const PdfViewerRouteArgs({
    this.key,
    required this.pdfUrl,
    required this.pdfType,
    this.pdfName,
    required this.queryParameters,
  });

  final _i30.Key? key;

  final String pdfUrl;

  final _i15.PDFType pdfType;

  final String? pdfName;

  final Map<String, dynamic> queryParameters;

  @override
  String toString() {
    return 'PdfViewerRouteArgs{key: $key, pdfUrl: $pdfUrl, pdfType: $pdfType, pdfName: $pdfName, queryParameters: $queryParameters}';
  }
}

/// generated route for
/// [_i16.PinScreen]
class PinRoute extends _i28.PageRouteInfo<void> {
  const PinRoute({List<_i28.PageRouteInfo>? children})
      : super(PinRoute.name, initialChildren: children);

  static const String name = 'PinRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i16.PinScreen();
    },
  );
}

/// generated route for
/// [_i17.PosScreen]
class PosRoute extends _i28.PageRouteInfo<void> {
  const PosRoute({List<_i28.PageRouteInfo>? children})
      : super(PosRoute.name, initialChildren: children);

  static const String name = 'PosRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i17.PosScreen();
    },
  );
}

/// generated route for
/// [_i18.PurchaseInvoiceScreen]
class PurchaseInvoiceRoute extends _i28.PageRouteInfo<void> {
  const PurchaseInvoiceRoute({List<_i28.PageRouteInfo>? children})
      : super(PurchaseInvoiceRoute.name, initialChildren: children);

  static const String name = 'PurchaseInvoiceRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i18.PurchaseInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i19.PurchaseOrderScreen]
class PurchaseOrderRoute extends _i28.PageRouteInfo<void> {
  const PurchaseOrderRoute({List<_i28.PageRouteInfo>? children})
      : super(PurchaseOrderRoute.name, initialChildren: children);

  static const String name = 'PurchaseOrderRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i19.PurchaseOrderScreen();
    },
  );
}

/// generated route for/// [_i20.PurchaseReturnScreen]
class PurchaseReturnRoute extends _i28.PageRouteInfo<void> {
  const PurchaseReturnRoute({List<_i28.PageRouteInfo>? children})
      : super(PurchaseReturnRoute.name, initialChildren: children);

  static const String name = 'PurchaseReturnRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i20.PurchaseReturnScreen();
    },
  );
}

/// generated route for
/// [_i21.ReportScreen]
class ReportRoute extends _i28.PageRouteInfo<void> {
  const ReportRoute({List<_i28.PageRouteInfo>? children})
      : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i21.ReportScreen();
    },
  );
}

/// generated route for
/// [_i22.SalesInvoiceScreen]
class SalesInvoiceRoute extends _i28.PageRouteInfo<void> {
  const SalesInvoiceRoute({List<_i28.PageRouteInfo>? children})
      : super(SalesInvoiceRoute.name, initialChildren: children);

  static const String name = 'SalesInvoiceRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i22.SalesInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i23.SalesOrderScreen]
class SalesOrderRoute extends _i28.PageRouteInfo<void> {
  const SalesOrderRoute({List<_i28.PageRouteInfo>? children})
      : super(SalesOrderRoute.name, initialChildren: children);

  static const String name = 'SalesOrderRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i23.SalesOrderScreen();
    },
  );
}

/// generated route for
/// [_i24.SalesQuatationScreen]
class SalesQuatationRoute extends _i28.PageRouteInfo<void> {
  const SalesQuatationRoute({List<_i28.PageRouteInfo>? children})
      : super(SalesQuatationRoute.name, initialChildren: children);

  static const String name = 'SalesQuatationRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i24.SalesQuatationScreen();
    },
  );
}

/// generated route for
/// [_i25.SalesReturnScreen]
class SalesReturnRoute extends _i28.PageRouteInfo<void> {
  const SalesReturnRoute({List<_i28.PageRouteInfo>? children})
      : super(SalesReturnRoute.name, initialChildren: children);

  static const String name = 'SalesReturnRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i25.SalesReturnScreen();
    },
  );
}

/// generated route for
/// [_i26.SettingsScreen]
class SettingsRoute extends _i28.PageRouteInfo<void> {
  const SettingsRoute({List<_i28.PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i26.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i27.SplashScreen]
class SplashRoute extends _i28.PageRouteInfo<void> {
  const SplashRoute({List<_i28.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i28.PageInfo page = _i28.PageInfo(
    name,
    builder: (data) {
      return const _i27.SplashScreen();
    },
  );
}
