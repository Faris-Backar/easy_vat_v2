class UrlResources {
  UrlResources._();

  static const String baseUrl = "https://devp.ddns.net/";

  //orders
  static const String getSalesOrders = "Order/Select/SelectAll";

  //sales
  static const String getSalesInvoice = "Sales/Select/BetweenDate";
  static const String createSalesInvoice = "Sales/Insert";

  //customer
  static const String getCustomers = "Customer/Select/LoadCustomer";

  // items
  static const String getItems = "Item/Select/SelectAll";
  static const String searchItems = "Item/Select/SearchItem";

  //employee
  static const String getEmployees = "Employee/Select/SelectAll";

  //paymentMode
  static const String paymentMode = "PaymentMode/Select/SalesPaymnetMode";

  //cash account
  static const String getCAshAccount = "Ledger/Select/GetCashLedger";

  //salesAccout
  static const String getSalesAccount = "Ledger/Select/GetSalesLedger";
}
