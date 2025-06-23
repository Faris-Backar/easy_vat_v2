import 'dart:convert';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:intl/intl.dart';

class ContraParams {
  final String? contraIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  final String? entryMode;

  ContraParams({
    this.contraIDPK,
    required this.fromDate,
    required this.toDate,
    this.entryMode,
  });

  String _formateDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date.toUtc());
  }

  Map<String, dynamic> toMap() {
    return {
      "contraIDPK": contraIDPK ?? PrefResources.emptyGuid,
      "fromDate": _formateDate(fromDate),
      "toDate": _formateDate(toDate),
      "entryMode": entryMode,
    };
  }

  String toJson() => json.encode(toMap());
}
