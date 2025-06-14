import 'dart:convert';
import 'package:intl/intl.dart';

class SalesParams {
  final String? salesIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  final String? customerID;
  final String? soldBy;
  final String? salesMode;
  final String? salesReturnIdpk;

  SalesParams(
      {this.salesIDPK,
      required this.fromDate,
      required this.toDate,
      this.customerID,
      this.soldBy,
      this.salesMode,
      this.salesReturnIdpk});

  /// Converts DateTime to ISO 8601 string (e.g., "2025-02-26T14:26:31.476Z")
  String _formatDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  Map<String, dynamic> toMap() {
    return {
      if (salesIDPK != null)
        'salesIDPK': salesIDPK ?? "00000000-0000-0000-0000-000000000000",
      'fromDate': _formatDate(fromDate),
      'toDate': _formatDate(toDate),
      if (customerID != null)
        'customerID': customerID ?? "00000000-0000-0000-0000-000000000000",
      if (salesMode != null) "saleMode": salesMode,
      if (soldBy != null) "soldBy": soldBy,
      if (salesReturnIdpk != null) "salesReturnIDPK": salesReturnIdpk
    };
  }

  String toJson() => json.encode(toMap());
}
