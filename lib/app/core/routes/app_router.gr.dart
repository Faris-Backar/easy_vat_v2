// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i40;
import 'package:easy_vat_v2/app/features/auth/presentation/pages/login_screen.dart'
    as _i23;
import 'package:easy_vat_v2/app/features/auth/presentation/pages/pin_screen.dart'
    as _i27;
import 'package:easy_vat_v2/app/features/barcode_scan/presentation/pages/barcode_scanner_screen.dart'
    as _i11;
import 'package:easy_vat_v2/app/features/cart/presentation/pages/cart_screen.dart'
    as _i12;
import 'package:easy_vat_v2/app/features/contra/presentation/pages/add_new_contra_screen.dart'
    as _i1;
import 'package:easy_vat_v2/app/features/contra/presentation/pages/contra_screen.dart'
    as _i13;
import 'package:easy_vat_v2/app/features/credit_note/presentation/pages/add_new_credit_note_screen.dart'
    as _i2;
import 'package:easy_vat_v2/app/features/credit_note/presentation/pages/credit_note_screen.dart'
    as _i14;
import 'package:easy_vat_v2/app/features/dahsboard/presentation/pages/dashboard_screen.dart'
    as _i15;
import 'package:easy_vat_v2/app/features/daybook/presentation/pages/daybook_screen.dart'
    as _i16;
import 'package:easy_vat_v2/app/features/debit_note/presentation/pages/add_new_debit_note_screen.dart'
    as _i3;
import 'package:easy_vat_v2/app/features/debit_note/presentation/pages/debit_note_screen.dart'
    as _i17;
import 'package:easy_vat_v2/app/features/dividend/presentation/pages/add_new_dividend_screen.dart'
    as _i4;
import 'package:easy_vat_v2/app/features/dividend/presentation/pages/dividend_screen.dart'
    as _i18;
import 'package:easy_vat_v2/app/features/expense/presentation/pages/add_new_expense_screen.dart'
    as _i5;
import 'package:easy_vat_v2/app/features/expense/presentation/pages/expense_screen.dart'
    as _i19;
import 'package:easy_vat_v2/app/features/income/presentation/pages/add_new_income_screen.dart'
    as _i6;
import 'package:easy_vat_v2/app/features/income/presentation/pages/income_screen.dart'
    as _i21;
import 'package:easy_vat_v2/app/features/journal/presentation/pages/add_new_journal_screen.dart'
    as _i7;
import 'package:easy_vat_v2/app/features/journal/presentation/pages/journal_screen.dart'
    as _i22;
import 'package:easy_vat_v2/app/features/main/presentation/pages/home_screen.dart'
    as _i20;
import 'package:easy_vat_v2/app/features/main/presentation/pages/main_screen.dart'
    as _i24;
import 'package:easy_vat_v2/app/features/no_internet/presentation/pages/no_internet_screen.dart'
    as _i25;
import 'package:easy_vat_v2/app/features/pdf_viewer/pdf_viewer_screen.dart'
    as _i26;
import 'package:easy_vat_v2/app/features/pos/presentation/pages/pos_screen.dart'
    as _i28;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/add_new_purchase_screen.dart'
    as _i8;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_invoice.dart'
    as _i29;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_order_screen.dart'
    as _i30;
import 'package:easy_vat_v2/app/features/purchase/presentation/pages/purchase_return_screen.dart'
    as _i31;
import 'package:easy_vat_v2/app/features/report/presentation/pages/report_screen.dart'
    as _i32;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/add_new_sales_screen.dart'
    as _i9;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_invoice_screen.dart'
    as _i33;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_order_screen.dart'
    as _i34;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_quatation_screen.dart'
    as _i35;
import 'package:easy_vat_v2/app/features/sales/presentation/pages/sales_return_screen.dart'
    as _i36;
import 'package:easy_vat_v2/app/features/settings/presentation/pages/settings_screen.dart'
    as _i37;
import 'package:easy_vat_v2/app/features/splash/presentation/pages/splash_screen.dart'
    as _i38;
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/pages/add_new_stock_transfer_screen.dart'
    as _i10;
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/pages/stock_transfer_screen.dart'
    as _i39;
import 'package:flutter/foundation.dart' as _i42;
import 'package:flutter/material.dart' as _i41;

/// generated route for
/// [_i1.AddNewContraScreen]
class AddNewContraRoute extends _i40.PageRouteInfo<AddNewContraRouteArgs> {
  AddNewContraRoute({
    _i41.Key? key,
    String? title,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewContraRoute.name,
         args: AddNewContraRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AddNewContraRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewContraRouteArgs>(
        orElse: () => const AddNewContraRouteArgs(),
      );
      return _i1.AddNewContraScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewContraRouteArgs {
  const AddNewContraRouteArgs({this.key, this.title});

  final _i41.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewContraRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.AddNewCreditNoteScreen]
class AddNewCreditNoteRoute
    extends _i40.PageRouteInfo<AddNewCreditNoteRouteArgs> {
  AddNewCreditNoteRoute({
    _i41.Key? key,
    String? title,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewCreditNoteRoute.name,
         args: AddNewCreditNoteRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AddNewCreditNoteRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewCreditNoteRouteArgs>(
        orElse: () => const AddNewCreditNoteRouteArgs(),
      );
      return _i2.AddNewCreditNoteScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewCreditNoteRouteArgs {
  const AddNewCreditNoteRouteArgs({this.key, this.title});

  final _i41.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewCreditNoteRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.AddNewDebitNoteScreen]
class AddNewDebitNoteRoute
    extends _i40.PageRouteInfo<AddNewDebitNoteRouteArgs> {
  AddNewDebitNoteRoute({
    _i41.Key? key,
    String? title,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewDebitNoteRoute.name,
         args: AddNewDebitNoteRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AddNewDebitNoteRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewDebitNoteRouteArgs>(
        orElse: () => const AddNewDebitNoteRouteArgs(),
      );
      return _i3.AddNewDebitNoteScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewDebitNoteRouteArgs {
  const AddNewDebitNoteRouteArgs({this.key, this.title});

  final _i41.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewDebitNoteRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i4.AddNewDividendScreen]
class AddNewDividendRoute extends _i40.PageRouteInfo<AddNewDividendRouteArgs> {
  AddNewDividendRoute({
    _i41.Key? key,
    String? title,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewDividendRoute.name,
         args: AddNewDividendRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AddNewDividendRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewDividendRouteArgs>(
        orElse: () => const AddNewDividendRouteArgs(),
      );
      return _i4.AddNewDividendScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewDividendRouteArgs {
  const AddNewDividendRouteArgs({this.key, this.title});

  final _i41.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewDividendRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i5.AddNewExpenseScreen]
class AddNewExpenseRoute extends _i40.PageRouteInfo<AddNewExpenseRouteArgs> {
  AddNewExpenseRoute({
    _i41.Key? key,
    String? tittle,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewExpenseRoute.name,
         args: AddNewExpenseRouteArgs(key: key, tittle: tittle),
         initialChildren: children,
       );

  static const String name = 'AddNewExpenseRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewExpenseRouteArgs>(
        orElse: () => const AddNewExpenseRouteArgs(),
      );
      return _i5.AddNewExpenseScreen(key: args.key, tittle: args.tittle);
    },
  );
}

class AddNewExpenseRouteArgs {
  const AddNewExpenseRouteArgs({this.key, this.tittle});

  final _i41.Key? key;

  final String? tittle;

  @override
  String toString() {
    return 'AddNewExpenseRouteArgs{key: $key, tittle: $tittle}';
  }
}

/// generated route for
/// [_i6.AddNewIncomeScreen]
class AddNewIncomeRoute extends _i40.PageRouteInfo<AddNewIncomeRouteArgs> {
  AddNewIncomeRoute({
    _i41.Key? key,
    String? title,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewIncomeRoute.name,
         args: AddNewIncomeRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AddNewIncomeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewIncomeRouteArgs>(
        orElse: () => const AddNewIncomeRouteArgs(),
      );
      return _i6.AddNewIncomeScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewIncomeRouteArgs {
  const AddNewIncomeRouteArgs({this.key, this.title});

  final _i41.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewIncomeRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i7.AddNewJournalScreen]
class AddNewJournalRoute extends _i40.PageRouteInfo<AddNewJournalRouteArgs> {
  AddNewJournalRoute({
    _i41.Key? key,
    String? title,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewJournalRoute.name,
         args: AddNewJournalRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AddNewJournalRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewJournalRouteArgs>(
        orElse: () => const AddNewJournalRouteArgs(),
      );
      return _i7.AddNewJournalScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewJournalRouteArgs {
  const AddNewJournalRouteArgs({this.key, this.title});

  final _i41.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewJournalRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i8.AddNewPurchaseScreen]
class AddNewPurchaseRoute extends _i40.PageRouteInfo<AddNewPurchaseRouteArgs> {
  AddNewPurchaseRoute({
    _i41.Key? key,
    String? title,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewPurchaseRoute.name,
         args: AddNewPurchaseRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AddNewPurchaseRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewPurchaseRouteArgs>(
        orElse: () => const AddNewPurchaseRouteArgs(),
      );
      return _i8.AddNewPurchaseScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewPurchaseRouteArgs {
  const AddNewPurchaseRouteArgs({this.key, this.title});

  final _i41.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewPurchaseRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i9.AddNewSalesScreen]
class AddNewSalesRoute extends _i40.PageRouteInfo<AddNewSalesRouteArgs> {
  AddNewSalesRoute({
    _i39.Key? key,
    required _i9.SalesType salesType,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         AddNewSalesRoute.name,
         args: AddNewSalesRouteArgs(key: key, salesType: salesType),
         initialChildren: children,
       );

  static const String name = 'AddNewSalesRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewSalesRouteArgs>();
      return _i9.AddNewSalesScreen(key: args.key, salesType: args.salesType);
    },
  );
}

class AddNewSalesRouteArgs {
  const AddNewSalesRouteArgs({this.key, required this.salesType});

  final _i41.Key? key;

  final _i9.SalesType salesType;

  @override
  String toString() {
    return 'AddNewSalesRouteArgs{key: $key, salesType: $salesType}';
  }
}

/// generated route for
/// [_i10.AddNewStockTransferScreen]
class AddNewStockTransferRoute
    extends _i40.PageRouteInfo<AddNewStockTransferRouteArgs> {
  AddNewStockTransferRoute({
    _i41.Key? key,
    String? title,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AddNewStockTransferRoute.name,
         args: AddNewStockTransferRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AddNewStockTransferRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewStockTransferRouteArgs>(
        orElse: () => const AddNewStockTransferRouteArgs(),
      );
      return _i10.AddNewStockTransferScreen(key: args.key, title: args.title);
    },
  );
}

class AddNewStockTransferRouteArgs {
  const AddNewStockTransferRouteArgs({this.key, this.title});

  final _i41.Key? key;

  final String? title;

  @override
  String toString() {
    return 'AddNewStockTransferRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i11.BarcodeScannerScreen]
class BarcodeScannerRoute extends _i40.PageRouteInfo<void> {
  const BarcodeScannerRoute({List<_i40.PageRouteInfo>? children})
    : super(BarcodeScannerRoute.name, initialChildren: children);

  static const String name = 'BarcodeScannerRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i11.BarcodeScannerScreen();
    },
  );
}

/// generated route for
/// [_i12.CartScreen]
class CartRoute extends _i40.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i41.Key? key,
    required _i12.CartScreenType screenType,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         CartRoute.name,
         args: CartRouteArgs(key: key, screenType: screenType),
         initialChildren: children,
       );

  static const String name = 'CartRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CartRouteArgs>();
      return _i12.CartScreen(key: args.key, screenType: args.screenType);
    },
  );
}

class CartRouteArgs {
  const CartRouteArgs({this.key, required this.screenType});

  final _i41.Key? key;

  final _i12.CartScreenType screenType;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, screenType: $screenType}';
  }
}

/// generated route for
/// [_i13.ContraScreen]
class ContraRoute extends _i40.PageRouteInfo<void> {
  const ContraRoute({List<_i40.PageRouteInfo>? children})
    : super(ContraRoute.name, initialChildren: children);

  static const String name = 'ContraRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i13.ContraScreen();
    },
  );
}

/// generated route for
/// [_i14.CreditNoteScreen]
class CreditNoteRoute extends _i40.PageRouteInfo<void> {
  const CreditNoteRoute({List<_i40.PageRouteInfo>? children})
    : super(CreditNoteRoute.name, initialChildren: children);

  static const String name = 'CreditNoteRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i14.CreditNoteScreen();
    },
  );
}

/// generated route for
/// [_i15.DashBoardScreen]
class DashBoardRoute extends _i40.PageRouteInfo<void> {
  const DashBoardRoute({List<_i40.PageRouteInfo>? children})
    : super(DashBoardRoute.name, initialChildren: children);

  static const String name = 'DashBoardRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i15.DashBoardScreen();
    },
  );
}

/// generated route for
/// [_i16.DayBookScreen]
class DayBookRoute extends _i40.PageRouteInfo<void> {
  const DayBookRoute({List<_i40.PageRouteInfo>? children})
    : super(DayBookRoute.name, initialChildren: children);

  static const String name = 'DayBookRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i16.DayBookScreen();
    },
  );
}

/// generated route for
/// [_i17.DebitNoteScreen]
class DebitNoteRoute extends _i40.PageRouteInfo<void> {
  const DebitNoteRoute({List<_i40.PageRouteInfo>? children})
    : super(DebitNoteRoute.name, initialChildren: children);

  static const String name = 'DebitNoteRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i17.DebitNoteScreen();
    },
  );
}

/// generated route for
/// [_i18.DividendScreen]
class DividendRoute extends _i40.PageRouteInfo<void> {
  const DividendRoute({List<_i40.PageRouteInfo>? children})
    : super(DividendRoute.name, initialChildren: children);

  static const String name = 'DividendRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i18.DividendScreen();
    },
  );
}

/// generated route for
/// [_i19.ExpenseScreen]
class ExpenseRoute extends _i40.PageRouteInfo<void> {
  const ExpenseRoute({List<_i40.PageRouteInfo>? children})
    : super(ExpenseRoute.name, initialChildren: children);

  static const String name = 'ExpenseRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i19.ExpenseScreen();
    },
  );
}

/// generated route for
/// [_i20.HomeScreen]
class HomeRoute extends _i40.PageRouteInfo<void> {
  const HomeRoute({List<_i40.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i20.HomeScreen();
    },
  );
}

/// generated route for
/// [_i21.IncomeScreen]
class IncomeRoute extends _i40.PageRouteInfo<void> {
  const IncomeRoute({List<_i40.PageRouteInfo>? children})
    : super(IncomeRoute.name, initialChildren: children);

  static const String name = 'IncomeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i21.IncomeScreen();
    },
  );
}

/// generated route for
/// [_i22.JournalScreen]
class JournalRoute extends _i40.PageRouteInfo<void> {
  const JournalRoute({List<_i40.PageRouteInfo>? children})
    : super(JournalRoute.name, initialChildren: children);

  static const String name = 'JournalRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i22.JournalScreen();
    },
  );
}

/// generated route for
/// [_i23.LoginScreen]
class LoginRoute extends _i40.PageRouteInfo<void> {
  const LoginRoute({List<_i40.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i23.LoginScreen();
    },
  );
}

/// generated route for
/// [_i24.MainScreen]
class MainRoute extends _i40.PageRouteInfo<void> {
  const MainRoute({List<_i40.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i24.MainScreen();
    },
  );
}

/// generated route for
/// [_i25.NoInternetScreen]
class NoInternetRoute extends _i40.PageRouteInfo<void> {
  const NoInternetRoute({List<_i40.PageRouteInfo>? children})
    : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i25.NoInternetScreen();
    },
  );
}

/// generated route for
/// [_i26.PdfViewerScreen]
class PdfViewerRoute extends _i40.PageRouteInfo<PdfViewerRouteArgs> {
  PdfViewerRoute({
    _i42.Key? key,
    required String pdfUrl,
    required _i26.PDFType pdfType,
    String? pdfName,
    required Map<String, dynamic> queryParameters,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         PdfViewerRoute.name,
         args: PdfViewerRouteArgs(
           key: key,
           pdfUrl: pdfUrl,
           pdfType: pdfType,
           pdfName: pdfName,
           queryParameters: queryParameters,
         ),
         initialChildren: children,
       );

  static const String name = 'PdfViewerRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewerRouteArgs>();
      return _i26.PdfViewerScreen(
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

  final _i42.Key? key;

  final String pdfUrl;

  final _i26.PDFType pdfType;

  final String? pdfName;

  final Map<String, dynamic> queryParameters;

  @override
  String toString() {
    return 'PdfViewerRouteArgs{key: $key, pdfUrl: $pdfUrl, pdfType: $pdfType, pdfName: $pdfName, queryParameters: $queryParameters}';
  }
}

/// generated route for
/// [_i27.PinScreen]
class PinRoute extends _i40.PageRouteInfo<void> {
  const PinRoute({List<_i40.PageRouteInfo>? children})
    : super(PinRoute.name, initialChildren: children);

  static const String name = 'PinRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i27.PinScreen();
    },
  );
}

/// generated route for
/// [_i28.PosScreen]
class PosRoute extends _i40.PageRouteInfo<void> {
  const PosRoute({List<_i40.PageRouteInfo>? children})
    : super(PosRoute.name, initialChildren: children);

  static const String name = 'PosRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i28.PosScreen();
    },
  );
}

/// generated route for
/// [_i29.PurchaseInvoiceScreen]
class PurchaseInvoiceRoute extends _i40.PageRouteInfo<void> {
  const PurchaseInvoiceRoute({List<_i40.PageRouteInfo>? children})
    : super(PurchaseInvoiceRoute.name, initialChildren: children);

  static const String name = 'PurchaseInvoiceRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i29.PurchaseInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i30.PurchaseOrderScreen]
class PurchaseOrderRoute extends _i40.PageRouteInfo<void> {
  const PurchaseOrderRoute({List<_i40.PageRouteInfo>? children})
    : super(PurchaseOrderRoute.name, initialChildren: children);

  static const String name = 'PurchaseOrderRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i30.PurchaseOrderScreen();
    },
  );
}

/// generated route for
/// [_i31.PurchaseReturnScreen]
class PurchaseReturnRoute extends _i40.PageRouteInfo<void> {
  const PurchaseReturnRoute({List<_i40.PageRouteInfo>? children})
    : super(PurchaseReturnRoute.name, initialChildren: children);

  static const String name = 'PurchaseReturnRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i31.PurchaseReturnScreen();
    },
  );
}

/// generated route for
/// [_i32.ReportScreen]
class ReportRoute extends _i40.PageRouteInfo<void> {
  const ReportRoute({List<_i40.PageRouteInfo>? children})
    : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i32.ReportScreen();
    },
  );
}

/// generated route for
/// [_i33.SalesInvoiceScreen]
class SalesInvoiceRoute extends _i40.PageRouteInfo<void> {
  const SalesInvoiceRoute({List<_i40.PageRouteInfo>? children})
    : super(SalesInvoiceRoute.name, initialChildren: children);

  static const String name = 'SalesInvoiceRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i33.SalesInvoiceScreen();
    },
  );
}

/// generated route for
/// [_i34.SalesOrderScreen]
class SalesOrderRoute extends _i40.PageRouteInfo<void> {
  const SalesOrderRoute({List<_i40.PageRouteInfo>? children})
    : super(SalesOrderRoute.name, initialChildren: children);

  static const String name = 'SalesOrderRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i34.SalesOrderScreen();
    },
  );
}

/// generated route for
/// [_i35.SalesQuatationScreen]
class SalesQuatationRoute extends _i40.PageRouteInfo<void> {
  const SalesQuatationRoute({List<_i40.PageRouteInfo>? children})
    : super(SalesQuatationRoute.name, initialChildren: children);

  static const String name = 'SalesQuatationRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i35.SalesQuatationScreen();
    },
  );
}

/// generated route for
/// [_i36.SalesReturnScreen]
class SalesReturnRoute extends _i40.PageRouteInfo<void> {
  const SalesReturnRoute({List<_i40.PageRouteInfo>? children})
    : super(SalesReturnRoute.name, initialChildren: children);

  static const String name = 'SalesReturnRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i36.SalesReturnScreen();
    },
  );
}

/// generated route for
/// [_i37.SettingsScreen]
class SettingsRoute extends _i40.PageRouteInfo<void> {
  const SettingsRoute({List<_i40.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i37.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i38.SplashScreen]
class SplashRoute extends _i40.PageRouteInfo<void> {
  const SplashRoute({List<_i40.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i38.SplashScreen();
    },
  );
}

/// generated route for
/// [_i39.StockTransferScreen]
class StockTransferRoute extends _i40.PageRouteInfo<void> {
  const StockTransferRoute({List<_i40.PageRouteInfo>? children})
    : super(StockTransferRoute.name, initialChildren: children);

  static const String name = 'StockTransferRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i39.StockTransferScreen();
    },
  );
}
