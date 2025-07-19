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
        AutoRoute(page: SplashRoute.page, path: splash, initial: true),
        AutoRoute(page: LoginRoute.page, path: login),
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
        AutoRoute(page: SalesReturnRoute.page, path: salesReturn),
        AutoRoute(page: SalesOrderRoute.page, path: salesOrder),
        AutoRoute(page: SalesQuatationRoute.page, path: salesQuatation),
        AutoRoute(page: PurchaseReturnRoute.page, path: purchaseReturn),
        AutoRoute(page: PurchaseOrderRoute.page, path: purchaseOrder),
        AutoRoute(page: BarcodeScannerRoute.page, path: barcodeScanner),
        AutoRoute(page: PdfViewerRoute.page, path: pdfViewer),
        AutoRoute(page: NoInternetRoute.page, path: noInternet),
        AutoRoute(page: ExpenseRoute.page, path: expense),
        AutoRoute(page: AddNewExpenseRoute.page, path: addNewExpense),
        AutoRoute(page: PdfViewerRoute.page, path: pdfViewer),
        AutoRoute(page: ExpenseRoute.page, path: expense),
        AutoRoute(page: ExpenseRoute.page, path: expense),
        AutoRoute(page: AddNewExpenseRoute.page, path: expense),
        AutoRoute(page: AddNewPurchaseRoute.page, path: addNewPurchase),
        AutoRoute(page: IncomeRoute.page, path: income),
        AutoRoute(page: AddNewIncomeRoute.page, path: addNewIncome),
        AutoRoute(page: JournalRoute.page, path: journal),
        AutoRoute(page: AddNewJournalRoute.page, path: addNewJournal),
        AutoRoute(page: CreditNoteRoute.page, path: creditNote),
        AutoRoute(page: AddNewCreditNoteRoute.page, path: addNewCreditNote),
        AutoRoute(page: DebitNoteRoute.page, path: debitNote),
        AutoRoute(page: AddNewDebitNoteRoute.page, path: addNewDebitNote),
        AutoRoute(page: ContraRoute.page, path: contra),
        AutoRoute(page: AddNewContraRoute.page, path: addNewContra),
        AutoRoute(page: DividendRoute.page, path: dividend),
        AutoRoute(page: AddNewDividendRoute.page, path: addNewDividend),
        AutoRoute(page: StockTransferRoute.page, path: stockTransfer),
        AutoRoute(
            page: AddNewStockTransferRoute.page,
            path: addNewStockTransferScreen),
        AutoRoute(page: LedgerGroupRoute.page, path: ledgerGroup),
        AutoRoute(page: AddNewLedgerGroupRoute.page, path: addNewLedgerGroup),
        AutoRoute(page: LedgerRoute.page, path: ledger),
        AutoRoute(page: AddNewLedgerRoute.page, path: addNewLedger),
        AutoRoute(page: CustomerRoute.page, path: customer),
        AutoRoute(page: AddNewCustomerRoute.page, path: addNewCustomer),
        AutoRoute(page: SupplierRoute.page, path: supplier),
        AutoRoute(page: AddNewSupplier.page, path: addNewSupplier),
        AutoRoute(page: BankRoute.page, path: bank),
        AutoRoute(page: AddNewBankRoute.page, path: addNewBank),
        AutoRoute(page: ItemRoute.page, path: item),
        AutoRoute(page: AddNewItemRoute.page, path: addNewItem),
        AutoRoute(page: StoreRoute.page, path: store),
        AutoRoute(page: AddNewStoreRoute.page, path: addNewStore),
        AutoRoute(page: ServiceJobRoute.page, path: serviceJob),
        AutoRoute(page: AddNewServiceJobRoute.page, path: addNewServiceJob),
        AutoRoute(
            page: VehicleRegistrationRoute.page, path: vehicleRegistration),
        AutoRoute(
            page: AddNewVehicleRegistration.page,
            path: addNewVehicleRegistration)
      ];

  // Routes constants
  static const String splash = "/splash";
  static const String main = "/main";
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
  static const String salesReturn = "/salesReturn";
  static const String salesQuatation = "/salesQuotation";
  static const String salesOrder = "/salesOrder";
  static const String purchaseReturn = "/purchaseReturn";
  static const String purchaseOrder = "/purchaseOrder";
  static const String expenseInvoice = "/expenseInvoice";
  static const String barcodeScanner = "/barcodeScanner";
  static const String pdfViewer = "/pdfViewer";
  static const String noInternet = "/noInternet";
  static const String expense = "/expense";
  static const String addNewExpense = "/addNewExpense";
  static const String income = "/income";
  static const String addNewIncome = "/addNewIncome";
  static const String journal = "/journal";
  static const String addNewJournal = "/addNewJournal";
  static const String creditNote = "/creditNote";
  static const String addNewCreditNote = "/addNewCreditNote";
  static const String debitNote = "/debitNote";
  static const String addNewDebitNote = "/addNewDebitNote";
  static const String contra = "/contra";
  static const String addNewContra = "/addNewContra";
  static const String dividend = "/dividend";
  static const String addNewDividend = "/addNewDividend";
  static const String stockTransfer = "/stockTransfer";
  static const String addNewStockTransferScreen = "/addNewStockTransferScreen";
  static const String ledgerGroup = "/ledgerGroup";
  static const String addNewLedgerGroup = "/addNewLedgerGroup";
  static const String ledger = "/ledger";
  static const String addNewLedger = "/addNewLedger";
  static const String customer = "/customer";
  static const String addNewCustomer = "/addNewCustomer";
  static const String supplier = "/supplier";
  static const String addNewSupplier = "/addNewSupplier";
  static const String bank = "/bank";
  static const String addNewBank = "/addNewBank";
  static const String item = "/item";
  static const String addNewItem = "/addNewItem";
  static const String store = "/store";
  static const String addNewStore = "/addNewStore";
  static const String serviceJob = "/serviceJob";
  static const String addNewServiceJob = "/addNewServiceJob";
  static const String vehicleRegistration = "/vehicleRegistration";
  static const String addNewVehicleRegistration = "/addNewVehicleRegistration";
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
      router.replace(LoginRoute());
    }
  }
}
