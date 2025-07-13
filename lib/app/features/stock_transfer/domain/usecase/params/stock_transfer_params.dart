import 'dart:convert';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:intl/intl.dart';

class StockTransferParams {
  final String? stockTransferIDPK;
  final DateTime fromDate;
  final DateTime toDate;
  StockTransferParams(
      {this.stockTransferIDPK, required this.fromDate, required this.toDate});

  String _formatDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  Map<String, dynamic> toMap() {
    return {
      if (stockTransferIDPK != null)
        "stockTransferIDPK": stockTransferIDPK ?? PrefResources.emptyGuid,
      "fromDate": _formatDate(fromDate),
      "toDate": _formatDate(toDate)
    };
  }

  String toJson() => json.encode(toMap());
}
