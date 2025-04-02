import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "https://activationserver.ddns.net/";

class UrlResources {
  UrlResources._();

  static Future<String> getBaseUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final baseUrl = prefs.getString(PrefResources.baseUrl);
    return baseUrl ?? "";
  }

  //orders
  static const String getSalesOrders = "Order/Select/SelectAll";

  //sales
  static const String getSalesInvoice = "Sales/Select/BetweenDate";
  static const String createSalesInvoice = "Sales/Insert";

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

  //salesman
  static const String getSalesMan = "Salesman/Select/SelectAll";

  //purchase
  static const String getPurchaseInvoice = "Purchase/Select/SelectAll";
  static const String createPurchaseInvoice = "Purchase/Insert";

  //login
  static const String login = "LogIn/authentication/verifyuserlogin";
  static const String pinLogin = "LogIn/authentication/verifyuserPin";
  static const String serverLogin =
      "ServerLogIn/authentication/verifyuserlogin";
}
