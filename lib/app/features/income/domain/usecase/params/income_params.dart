import 'dart:convert';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:intl/intl.dart';

class IncomeParams {
  final String? incomeIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  final String? paymentMode;
  final String? customerID;

  IncomeParams(
      {this.incomeIDPK,
      required this.fromDate,
      required this.toDate,
      this.paymentMode,
      this.customerID});

  String _formateDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date.toUtc());
  }

  Map<String, dynamic> toMap() {
    return {
      "incomeIDPK": incomeIDPK ?? PrefResources.emptyGuid,
      "fromDate": _formateDate(fromDate),
      "toDate": _formateDate(toDate),
      "paymentMode": paymentMode,
      "customerID": customerID
    };
  }

  String toJson() => json.encode(toMap());
}
