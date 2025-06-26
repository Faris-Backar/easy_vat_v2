import 'dart:developer';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/contra/data/model/contra_request_model.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_cart_entity.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra_cart/contra_cart_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contraCartProvider =
    StateNotifierProvider<ContraCartNotifier, ContraCartState>((ref) {
  return ContraCartNotifier();
});

class ContraCartNotifier extends StateNotifier<ContraCartState> {
  ContraCartNotifier() : super(ContraCartState.initial());

  List<ContraCartEntity> detailList = [];
  double totalAmount = 0.0;
  double drAmount = 0.0;
  double crAmount = 0.0;
  String contraNo = "";
  String refNo = "";
  DateTime contraDate = DateTime.now();
  String notes = "";
  String description = "";
  LedgerAccountEntity? allAccount;
  String toAccount = "";
  String entryMode = "";
  bool isForEdit = false;
  String contraIDPK = PrefResources.emptyGuid;

  void addLedgerIntoJournalCart({required ContraCartEntity ledger}) {
    detailList.add(ledger);
    _getRateSplitUp(ledger: ledger, entryMode: entryMode);
    state = state.copyWith(ledgerList: detailList);
  }

  void removeLedgerFromJournalCart({required int index}) {
    if (index >= 0 && index < detailList.length) {
      final ContraCartEntity removeLedger = detailList[index];
      _decreaseRateSplitUp(ledger: removeLedger, entryMode: entryMode);
      detailList.removeAt(index);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  void updateJournalCartLedger({required ContraCartEntity cartLedger}) {
    final index = detailList
        .indexWhere((ledger) => cartLedger.ledgerId == ledger.ledgerId);

    if (index != -1) {
      final oldLedger = detailList[index];
      _decreaseRateSplitUp(ledger: oldLedger, entryMode: entryMode);

      final netTotal = cartLedger.netTotal;
      final drAmount = cartLedger.drAmount;
      final crAmount = cartLedger.crAmount;

      final updatedLedger = ContraCartEntity(
          ledgerId: cartLedger.ledgerId,
          ledger: cartLedger.ledger,
          currentBalance: cartLedger.currentBalance,
          netTotal: netTotal,
          drAmount: drAmount,
          crAmount: crAmount,
          description: cartLedger.description);

      detailList[index] = updatedLedger;
      _getRateSplitUp(ledger: updatedLedger, entryMode: entryMode);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  setContraNo(String contraNo) {
    this.contraNo = contraNo;
    state = state.copyWith(contraNo: contraNo);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setContraIDPK(String contraIDPK) {
    this.contraIDPK = contraIDPK;
  }

  setContraDate(DateTime contraDate) {
    this.contraDate = contraDate;
    state = state.copyWith(contraDate: contraDate);
  }

  setAllAccount(LedgerAccountEntity allAccount) {
    this.allAccount = allAccount;
    state = state.copyWith(allAccount: allAccount);
  }

  setDescription(String description) {
    this.description = description;
  }

  setNotes(String notes) {
    this.notes = notes;
  }

  setEditMode(bool enableEdit) {
    isForEdit = enableEdit;
    state = state.copyWith(isForUpdate: isForEdit);
  }

  Future<ContraRequestModel> createNewContra() async {
    double netTotal = 0.0;
    final List<ContraEntryDetails> details = [];
    final useDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final companyDetails =
        await AppCredentialPreferenceHelper().getCompanyInfo();

    for (var i = 0; i < detailList.length; i++) {
      drAmount = detailList[i].drAmount;
      crAmount = detailList[i].crAmount;
      netTotal = detailList[i].netTotal;

      final detail = ContraEntryDetails(
          contraIDPK: contraIDPK,
          ledgerIDPK: detailList[i].ledger.ledgerIdpk ?? "",
          description: detailList[i].description,
          ledgerName: detailList[i].ledger.ledgerName,
          currentBalance: detailList[i].ledger.currentBalance ?? 0.0,
          currentBalanceType: detailList[i].ledger.currentBalanceType ?? "",
          drAmount: detailList[i].drAmount,
          crAmount: detailList[i].crAmount,
          companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid);
      details.add(detail);
    }

    final newContra = ContraRequestModel(
      contraIDPK: contraIDPK,
      contraNo: 0,
      referenceNo: refNo,
      contraDate: contraDate,
      description: description,
      totalAmount: netTotal,
      remarks: notes,
      isEditable: true,
      isCanceled: false,
      createdBy: useDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
      createdDate: contraDate,
      modifiedBy: useDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
      modifiedDate: DateTime.now(),
      rowguid: PrefResources.emptyGuid,
      companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
      entryMode: entryMode,
      toAccount: toAccount,
      contraEntryDetails: details,
    );
    log("newContra: $newContra");
    return newContra;
  }

  void clearContraCart() {
    detailList.clear();
    totalAmount = 0.0;
    drAmount = 0.0;
    crAmount = 0.0;
    contraNo = "";
    contraDate = DateTime.now();
    contraIDPK = PrefResources.emptyGuid;
    allAccount = null;
    toAccount = "";
    notes = "";
    state = ContraCartState.initial().copyWith(entryMode: entryMode);
  }

  double calculateNetTotal({required double totalAmount}) {
    return totalAmount;
  }

  double calculateDebitTotal({required double drAmount}) {
    return drAmount;
  }

  double calculateCreditTotal({required double crAmount}) {
    return crAmount;
  }

  LedgerAccountEntity covertContraDetailsToDetails(
      ContraEntryDetailsEntity contraDetails) {
    return LedgerAccountEntity(
      ledgerIdpk: contraDetails.ledgerIDPK,
      description: contraDetails.description,
      ledgerName: contraDetails.ledgerName,
      currentBalance: contraDetails.currentBalance,
    );
  }

  reinsertJournalForm(ContraEntryEntity contra, WidgetRef ref) async {
    clearContraCart();
    setEditMode(true);
    List<ContraCartEntity> updatedLedgerList = [];
    setContraIDPK(contra.contraIDPK ?? "");
    setContraNo(contra.contraNo?.toString() ?? "");
    setRefNo(contra.referenceNo ?? "");
    setContraDate(contra.contraDate ?? DateTime.now());
    setNotes(contra.remarks ?? "");
    setDescription(contra.description ?? "");

    if (contra.contraEntryDetails?.isEmpty == true) {
      for (var index = 0; index < contra.contraEntryDetails!.length; index++) {
        final journalDetail = contra.contraEntryDetails![index];
        final ledgerEntity = covertContraDetailsToDetails(journalDetail);
        final netTotal = contra.totalAmount;
        final drAmount = journalDetail.drAmount;
        final crAmount = journalDetail.crAmount;

        final cartLedger = ContraCartEntity(
            ledgerId: (index + 1),
            ledger: ledgerEntity,
            currentBalance: ledgerEntity.currentBalance?.toDouble() ?? 0.0,
            netTotal: netTotal?.toDouble() ?? 0.0,
            drAmount: drAmount?.toDouble() ?? 0.0,
            crAmount: crAmount?.toDouble() ?? 0.0,
            description: ledgerEntity.description ?? "");

        updatedLedgerList.add(cartLedger);
        _getRateSplitUp(ledger: cartLedger, entryMode: entryMode);

        detailList = updatedLedgerList;
      }
    }
    updateState();
  }

  void _getRateSplitUp(
      {required ContraCartEntity ledger,
      bool isInitial = true,
      required String entryMode}) {
    if (entryMode == "Single Entry") {
      totalAmount += ledger.netTotal;
    } else {
      drAmount += ledger.drAmount;
      crAmount += ledger.crAmount;
    }

    if (!isInitial) {
      state = state.copyWith(
          totalAmount: totalAmount, drAmount: drAmount, crAmount: crAmount);
    }
  }

  void _decreaseRateSplitUp(
      {required ContraCartEntity ledger, required String entryMode}) {
    if (entryMode == "Single Entry") {
      totalAmount += ledger.netTotal;
    } else {
      drAmount += ledger.drAmount;
      crAmount += ledger.crAmount;
    }

    state = state.copyWith(
        totalAmount: totalAmount, crAmount: crAmount, drAmount: drAmount);
  }

  updateState() {
    state = state.copyWith(
        ledgerList: detailList,
        totalAmount: totalAmount,
        drAmount: drAmount,
        crAmount: crAmount,
        entryMode: entryMode);
  }
}
