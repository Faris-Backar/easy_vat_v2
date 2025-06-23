import 'dart:convert';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:intl/intl.dart';

class JournalParams {
  final String? journalIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  final String? entryMode;

  JournalParams(
      {this.journalIDPK,
      required this.fromDate,
      required this.toDate,
      this.entryMode});

  String _formateDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date.toUtc());
  }

  Map<String, dynamic> toMap() {
    return {
      "journalIDPK": journalIDPK ?? PrefResources.emptyGuid,
      "fromDate": _formateDate(fromDate),
      "toDate": _formateDate(toDate),
      "entryMode": entryMode
    };
  }

  String toJson() => json.encode(toMap());
}
