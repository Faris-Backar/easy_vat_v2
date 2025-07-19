import 'dart:developer';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/dividend/data/model/dividend_request_model.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_cart_entity.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend_cart/dividend_cart_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dividendCartProvider =
    StateNotifierProvider<DividendCartNotifier, DividendCartState>((ref) {
  return DividendCartNotifier();
});

class DividendCartNotifier extends StateNotifier<DividendCartState> {
  DividendCartNotifier() : super(DividendCartState.initial());

  List<DividendCartEntity> detailList = [];
  double totalAmount = 0.0;
  String dividendNo = "";
  String refNo = "";
  LedgerAccountEntity? cashAccount;
  DateTime dividendDate = DateTime.now();
  LedgerAccountEntity? capitalAccount;
  LedgerAccountEntity? selectedLedger;
  String notes = "";
  String description = "";
  String paymentMode = "";
  String issuedBy = "";
  bool isForEdit = false;
  String dividendIDPK = PrefResources.emptyGuid;

  void addLedgerIntoDividendCart({required DividendCartEntity ledger}) {
    detailList.add(ledger);
    _getRateSplitUp(ledger: ledger);
    state = state.copyWith(ledgerList: detailList);
  }

  void removeLedgerFromDividendCart({required int index}) {
    if (index >= 0 && index < detailList.length) {
      final DividendCartEntity removedLedger = detailList[index];
      _decreaseRateSplitUp(ledger: removedLedger);
      detailList.removeAt(index);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  void updateDividendCartLedger({required DividendCartEntity cartLedger}) {
    final index = detailList
        .indexWhere((ledger) => cartLedger.ledgerId == ledger.ledgerId);

    if (index != -1) {
      final oldLedger = detailList[index];
      _decreaseRateSplitUp(ledger: oldLedger);

      final netTotal = cartLedger.netTotal;

      final updatedLedger = DividendCartEntity(
          ledgerId: cartLedger.ledgerId,
          currentBalance: cartLedger.currentBalance,
          ledger: cartLedger.ledger,
          netTotal: netTotal,
          description: cartLedger.description,
          currentBalanceType: cartLedger.currentBalanceType);

      detailList[index] = updatedLedger;
      _getRateSplitUp(ledger: updatedLedger);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  setDividendNo(String dividendNo) {
    this.dividendNo = dividendNo;
    state = state.copyWith(dividendNo: dividendNo);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setDividendIDPK(String dividendIDPK) {
    this.dividendIDPK = dividendIDPK;
  }

  setDividendDate(DateTime dividendDate) {
    this.dividendDate = dividendDate;
    state = state.copyWith(dividendDate: dividendDate);
  }

  setPaymentMode(String paymentMode) {
    this.paymentMode = paymentMode;
    state = state.copyWith(paymentMode: paymentMode);
  }

  setIssuedBy(String issuedBy) {
    this.issuedBy = issuedBy;
    state = state.copyWith(issuedBy: issuedBy);
  }

  setCashAccount(LedgerAccountEntity cashAccount) {
    this.cashAccount = cashAccount;
    state = state.copyWith(cashAccount: cashAccount);
  }

  setCapitalAccount(LedgerAccountEntity capitalAccount) {
    this.capitalAccount = capitalAccount;
    state = state.copyWith(capitalAccount: capitalAccount);
  }

  setLedger(LedgerAccountEntity ledger) {
    selectedLedger = ledger;
    state = state.copyWith(selectedLedger: selectedLedger);
  }

  setNotes(String notes) {
    this.notes = notes;
    state = state.copyWith(notes: notes);
  }

  setDescription(String description) {
    description = description;
    state = state.copyWith(description: description);
  }

  removeLedger() {
    selectedLedger = LedgerAccountEntity(ledgerName: "Select a Ledger");
    state = state.copyWith(selectedLedger: selectedLedger);
  }

  setEditMode(bool enableEdit) {
    isForEdit = enableEdit;
    state = state.copyWith(isForUpdate: isForEdit);
  }

  Future<DividendRequestModel> createNewDividend() async {
    double netTotal = 0.0;
    final List<DividendDetails> details = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final companyDetails =
        await AppCredentialPreferenceHelper().getCompanyInfo();

    for (var i = 0; i < detailList.length; i++) {
      final totalAmount = detailList[i].netTotal.toDouble();
      netTotal += totalAmount;

      final detail = DividendDetails(
          dividendIDPK: dividendIDPK,
          ledgerIDPK: detailList[i].ledger.ledgerIdpk ?? "",
          ledgerName: detailList[i].ledger.ledgerName ?? "",
          currentBalance: detailList[i].ledger.currentBalance ?? 0.0,
          currentBalanceType: detailList[i].ledger.currentBalanceType ?? "",
          description: detailList[i].description,
          netTotal: detailList[i].netTotal,
          rowguid: detailList[i].ledger.rowguid ?? PrefResources.emptyGuid,
          companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid);
      details.add(detail);
      log("details: $detail");
    }

    final newDividend = DividendRequestModel(
        dividendIDPK: dividendIDPK,
        dividendNo: 0,
        referenceNo: refNo,
        dividendDate: dividendDate,
        paymentMode: paymentMode,
        crLedgerIDFK: selectedLedger?.ledgerIdpk ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        drLedgerIDFK: selectedLedger?.ledgerIdpk ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        expenseLedger: selectedLedger?.ledgerIdpk ?? PrefResources.emptyGuid,
        cashAccount: selectedLedger?.ledgerIdpk ?? PrefResources.emptyGuid,
        issuedBy: issuedBy,
        netTotal: netTotal,
        remarks: notes,
        isEditable: true,
        isCanceled: false,
        createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        createdDate: dividendDate,
        modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedDate: DateTime.now(),
        rowguid: PrefResources.emptyGuid,
        companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
        dividendDetails: details);
    log("Created new Dividend successfully: $newDividend");
    return newDividend;
  }

  void clearDividendCart() {
    detailList.clear();
    totalAmount = 0.0;
    dividendNo = "";
    dividendDate = DateTime.now();
    refNo = "";
    cashAccount = null;
    capitalAccount = null;
    notes = "";
    paymentMode = "";
    issuedBy = "";
    selectedLedger = null;
    dividendIDPK = PrefResources.emptyGuid;
    state = DividendCartState.initial();
  }

  LedgerAccountEntity covertDividendDetailsToDetails(
      DividendDetailsEntity dividendDetails) {
    return LedgerAccountEntity(
      ledgerIdpk: dividendDetails.ledgerIDPK,
      ledgerName: dividendDetails.ledgerName,
      currentBalance: dividendDetails.currentBalance?.toDouble(),
      currentBalanceType: dividendDetails.currentBalanceType,
      description: dividendDetails.description,
      rowguid: dividendDetails.rowguid,
      companyIDPK: dividendDetails.companyIDPK,
    );
  }

  reinsertDividendForm(DividendListEntity dividend, WidgetRef ref) async {
    clearDividendCart();
    setEditMode(true);
    List<DividendCartEntity> updatedLedgerList = [];
    setDividendIDPK(dividend.dividendIDPK ?? "");
    setDividendNo(dividend.dividendNo?.toString() ?? "");
    setRefNo(dividend.referenceNo ?? "");
    setPaymentMode(dividend.paymentMode ?? "Cash");
    setDividendDate(dividend.dividendDate ?? DateTime.now());
    setIssuedBy(dividend.issuedBy ?? "");
    final remarks = dividend.remarks ?? "";
    setNotes(remarks);
    setDescription(description);

    final ledger = ref
        .read(cashLedgerNotifierProvider.notifier)
        .getLedgerById(dividend.crLedgerIDFK ?? "");

    if (ledger != null) {
      final group = ledger.groupName?.toLowerCase();
      final paymentMode = ledger.defaultPaymentMode?.toLowerCase();

      final isCashorBank = group == 'cash' ||
          group == 'bank' ||
          paymentMode == 'cash' ||
          paymentMode == 'bank' ||
          paymentMode == 'card';

      if (isCashorBank) {
        setCashAccount(ledger);
      } else {
        setCapitalAccount(ledger);
      }
    }

    if (dividend.dividendDetails?.isNotEmpty == true) {
      for (var index = 0; index < dividend.dividendDetails!.length; index++) {
        final dividendDetail = dividend.dividendDetails![index];
        final ledgerEntity = covertDividendDetailsToDetails(dividendDetail);
        final netTotal = dividendDetail.netTotal ?? 0.0;

        final cartLedger = DividendCartEntity(
            ledgerId: (index + 1),
            currentBalance: ledgerEntity.currentBalance?.toDouble() ?? 0.0,
            ledger: ledgerEntity,
            netTotal: netTotal,
            description: ledgerEntity.description ?? "",
            currentBalanceType: ledgerEntity.currentBalanceType ?? "");

        updatedLedgerList.add(cartLedger);
        _getRateSplitUp(ledger: cartLedger);
        detailList = updatedLedgerList;
      }
    }

    updateState();
  }

  void _getRateSplitUp(
      {required DividendCartEntity ledger, bool isInitial = false}) {
    totalAmount += ledger.netTotal;

    if (!isInitial) {
      state = state.copyWith(totalAmount: totalAmount);
    }
  }

  void _decreaseRateSplitUp({required DividendCartEntity ledger}) {
    totalAmount -= ledger.netTotal;

    state = state.copyWith(totalAmount: totalAmount);
  }

  updateState() {
    state = state.copyWith(
      ledgerList: detailList,
      totalAmount: totalAmount,
    );
  }
}
