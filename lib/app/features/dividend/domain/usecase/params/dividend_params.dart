import 'dart:convert';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:intl/intl.dart';

class DividendParams {
  final String? dividendIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  DividendParams(
      {this.dividendIDPK, required this.fromDate, required this.toDate});

  String _formateDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date.toUtc());
  }

  Map<String, dynamic> toMap() {
    return {
      "dividendIDPK": dividendIDPK ?? PrefResources.emptyGuid,
      "fromDate": _formateDate(fromDate),
      "toDate": _formateDate(toDate)
    };
  }

  String toJson() => json.encode(toMap());
}
