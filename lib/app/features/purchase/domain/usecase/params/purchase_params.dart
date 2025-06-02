import 'dart:convert';
import 'package:intl/intl.dart';

class PurchaseParams {
  final String? purchaseIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  final String? supplierIDPK;
  final String? purchasedBy;
  final String? purchaseMode;

  PurchaseParams(
      {this.purchaseIDPK,
      required this.fromDate,
      required this.toDate,
      this.supplierIDPK,
      this.purchasedBy,
      this.purchaseMode});

  /// Converts DateTime to ISO 8601 string (e.g., "2025-02-26T14:26:31.476Z")
  String _formatDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  Map<String, dynamic> toMap() {
    return {
      if (purchaseIDPK != null)
        'PurchaseIDPK': purchaseIDPK ?? "00000000-0000-0000-0000-000000000000",
      'fromDate': _formatDate(fromDate),
      'toDate': _formatDate(toDate),
      if (supplierIDPK != null)
        'ledgerId': supplierIDPK ?? "00000000-0000-0000-0000-000000000000",
      if (purchaseMode != null) "purchaseMode": purchaseMode ?? "",
      if (purchasedBy != null) "purchasedBy": purchasedBy ?? ""
    };
  }

  String toJson() => json.encode(toMap());
}
