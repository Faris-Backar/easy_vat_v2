import 'dart:convert';
import 'package:intl/intl.dart';

class ExpenseParams {
  final String? expenseIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  final String? supplierID;

  ExpenseParams(
      {this.expenseIDPK,
      required this.fromDate,
      required this.toDate,
      this.supplierID});

  String _formatDate(DateTime date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(date.toUtc());
  }

  Map<String, dynamic> toMap() {
    return {
      "expenseIDPK": expenseIDPK,
      "fromDate": _formatDate(fromDate),
      "toDate": _formatDate(toDate),
      "supplierID": supplierID,
    };
  }

  String toJson() => json.encode(toMap());
}
