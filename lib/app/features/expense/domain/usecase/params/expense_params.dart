import 'dart:convert';
import 'package:intl/intl.dart';

class ExpenseParams {
  final int? expenseNo;
  final String? referenceNo;
  final DateTime? expenseDate;
  final String? paymentMode;
  final String? purchasedBy;
  final Null supplierName;

  ExpenseParams(
      {this.expenseNo,
      this.referenceNo,
      this.expenseDate,
      this.paymentMode,
      this.purchasedBy,
      this.supplierName});

  String _formatDate(DateTime date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(date.toUtc());
  }

  Map<String, dynamic> toMap() {
    return {
      "expenseNo": expenseNo,
      "referenceNo": referenceNo,
      "expenseDate": expenseDate,
      "paymentMode": paymentMode,
      "purchasedBy": purchasedBy,
      "supplierName": supplierName
    };
  }

  String toJson() => json.encode(toMap());
}
