import 'dart:convert';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';

class LedgerParams {
  final String? ledgerIDPK;
  LedgerParams({this.ledgerIDPK});

  Map<String, dynamic> toMap() {
    return {
      if (ledgerIDPK != null)
        "ledgerIDPK": ledgerIDPK ?? PrefResources.emptyGuid
    };
  }

  String toJson() => json.encode(toMap());
}
