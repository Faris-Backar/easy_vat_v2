import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "https://easyvatapi.microzys.in/";

class UrlResources {
  UrlResources._();
  static const String serverBaseUrl = "https://easyvatserverapi.microzys.in/";

  static Future<String> getBaseUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final baseUrl = prefs.getString(PrefResources.baseUrl);
    return baseUrl ?? "";
  }

  //salesInvoice
  static const String getSalesInvoice = "Sales/Select/BetweenDate";
  static const String createSalesInvoice = "Sales/Insert";
  static const String updateSalesInvoice = "Sales/Update";
  static const String deleteSalesInvoice = "Sales/Delete";
  static const String downloadSalesInvoice = "Sales/DownloadInvoice";

  //salesOrder
  static const String getSalesOrder = "SalesOrder/Select/BetweenDate";
  static const String createSalesOrder = "SalesOrder/Insert";
  static const String updateSalesOrder = "SalesOrder/Update";
  static const String deleteSalesOrder = "SalesOrder/Delete";

  //salesReturn
  static const String getSalesReturn = "SalesReturn/Select/BetweenDate";
  static const String createSalesReturn = "SalesReturn/Insert";
  static const String updateSalesReturn = "SalesReturn/Update";
  static const String deleteSalesReturn = "SalesReturn/Delete";

  //salesQuotation
  static const String getSalesQuotation = "Quotation/Select/BetweenDate";
  static const String createSalesQuotation = "Quotation/Insert";
  static const String updateSalesQuotation = "Quotation/Update";
  static const String deleteSalesQuotation = "Quotation/Delete";

  //customer
  static const String getCustomers = "Customer/Select/LoadCustomer";
  static const String searchCustomers = "Customer/Select/SearchCustomer";

  // items
  static const String getItems = "Item/Select/SelectAll";
  static const String searchItems = "Item/Select/SearchItem";

  //employee
  static const String getEmployees = "Employee/Select/SelectAll";

  //paymentMode
  static const String paymentMode = "PaymentMode/Select/SalesPaymnetMode";

  //ledgers
  static const String getCAshAccount = "Ledger/Select/GetCashLedger";
  static const String getSalesAccount = "Ledger/Select/GetSalesLedger";
  static const String getBankAccount = "Ledger/Select/GetBankLedger";
  static const String getExpenseAccount = "Ledger/Select/GetExpenseLedger";
  static const String getLedgerAccount = "Ledger/Select/GetIncomeLedger";

  //salesman
  static const String getSalesMan = "Salesman/Select/SelectAll";

  //purchase
  static const String getPurchaseInvoice = "Purchase/Select/BetweenDate";
  static const String createPurchaseInvoice = "Purchase/Insert";
  static const String updatePurchaseInvoice = "Purchase/Update";
  static const String deletePurchaseInvoice = "Purchase/Delete";
  static const String downloadPurchaseInvoice = "Purchase/DownloadInvoice";

  //purchaseOrder
  static const String getPurchaseOrder = "PurchaseOrder/Select/SelectAll";
  static const String createPurchaseOrder = "PurchaseOrder/Insert";
  static const String updatePurchaseOrder = "PurchaseOrder/Update";
  static const String deletePurchaseOrder = "PurchaseOrder/Delete";

  //purchaseReturn
  static const String getPurchaseReturn = "PurchaseReturn/Select/BetweenDate";
  static const String createPurchaseReturn = "PurchaseReturn/Insert";
  static const String updatePurchaseReturn = "PurchaseReturn/Update";
  static const String deletePurchaseReturn = "PurchaseReturn/Delete";

  //login
  static const String login = "LogIn/authentication/verifyuserlogin";
  static const String pinLogin = "LogIn/authentication/verifyuserPin";
  static const String serverLogin =
      "ServerLogIn/authentication/verifyuserlogin";

  //expense
  static const String getExpense = "Expense/Select/BetweenDate";
  static const String createExpense = "Expense/Insert";
  static const String updateExpense = "Expense/Update";
  static const String deleteExpense = "Expense/Delete";
  static const String downloadExpense = "Expense/DownloadInvoice";

  //supplier
  static const String getSuppliers = "/Supplier/Select/LoadSupplier";
  static const String searchSupplier = "/Supplier/Select/SearchSupplier";

  //income
  static const String getIncome = "Income/Select/BetweenDate";
  static const String createIncome = "Income/Insert";
  static const String updateIncome = "Income/Update";
  static const String deleteIncome = "Income/Delete";
  static const String downloadIncome = "Income/DownloadInvoice";
}
