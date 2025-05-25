import 'dart:convert';
import 'package:intl/intl.dart';

class SalesParams {
  final String? salesIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  final String? customerID;

  SalesParams({
    this.salesIDPK,
    required this.fromDate,
    required this.toDate,
    this.customerID,
  });

  /// Converts DateTime to ISO 8601 string (e.g., "2025-02-26T14:26:31.476Z")
  String _formatDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  Map<String, dynamic> toMap() {
    return {
      'salesIDPK': salesIDPK,
      'fromDate': _formatDate(fromDate),
      'toDate': _formatDate(toDate),
      'customerID': customerID,
    };
  }

  String toJson() => json.encode(toMap());
}
