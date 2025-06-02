import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_state.freezed.dart';

@freezed
class PurchaseState with _$PurchaseState {
  const factory PurchaseState({
    String? purchaseNo,
    required DateTime purchaseDate,
    String? supInvNo,
    LedgerAccountEntity? cashAccount,
    LedgerAccountEntity? purchaseAccount,
    String? notes,
    String? purchaseMode,
    SalesManEntity? purchasedBy,
    required bool isForUpdate,
    String? purchaseIdpk,
    SupplierEntity? selectedSupplier,
  }) = _PurchaseState;

  factory PurchaseState.initial() => PurchaseState(
        purchaseNo: "",
        cashAccount: null,
        selectedSupplier: null,
        purchasedBy: null,
        isForUpdate: false,
        notes: "",
        purchaseAccount: null,
        purchaseDate: DateTime.now(),
        purchaseIdpk: PrefResources.emptyGuid,
        purchaseMode: "",
        supInvNo: null,
      );
}
