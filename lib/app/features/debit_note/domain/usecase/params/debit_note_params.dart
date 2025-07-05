import 'dart:convert';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:intl/intl.dart';

class DebitNoteParams {
  final String? debitNoteIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  final String? paymentMode;
  final String? supplierID;
  DebitNoteParams(
      {this.debitNoteIDPK,
      required this.fromDate,
      this.paymentMode,
      required this.toDate,
      this.supplierID});

  String _formateDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date.toUtc());
  }

  Map<String, dynamic> toMap() {
    return {
      "debitNoteIDPK": debitNoteIDPK ?? PrefResources.emptyGuid,
      "fromDate": _formateDate(fromDate),
      "toDate": _formateDate(toDate)
    };
  }

  String toJson() => json.encode(toMap());
}
