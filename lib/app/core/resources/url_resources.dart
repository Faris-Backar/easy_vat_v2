class UrlResources {
  UrlResources._();

  static const String baseUrl = "https://devp.ddns.net/";

  //orders
  static const String getSalesOrders = "Order/Select/SelectAll";

  //sales
  static const String getSalesInvoice = "Sales/Select/BetweenDate";

  //customer
  static const String getCustomers = "Customer/Select/LoadCustomer";

  // items
  static const String getItems = "Item/Select/SelectAll";
  static const String searchItems = "Item/Select/SearchItem";
}
