import 'dart:developer';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/contra/data/model/contra_request_model.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_cart_entity.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra_cart/contra_cart_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contraCartProvider =
    StateNotifierProvider<ContraCartNotifier, ContraCartState>(
        (ref) => ContraCartNotifier(ref));

class ContraCartNotifier extends StateNotifier<ContraCartState> {
  final Ref ref;
  ContraCartNotifier(this.ref) : super(ContraCartState.initial());

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
  LedgerAccountEntity? selectedLedger;
  String toAccount = "";
  String entryMode = "";
  bool isForEdit = false;
  String contraIDPK = PrefResources.emptyGuid;

  void addLedgerIntoContraCart({required ContraCartEntity ledger}) {
    detailList.add(ledger);
    _getRateSplitUp(ledger: ledger);
    state = state.copyWith(ledgerList: detailList);
  }

  void removeLedgerFromContraCart({required int index}) {
    if (index >= 0 && index < detailList.length) {
      final ContraCartEntity removeLedger = detailList[index];
      _decreaseRateSplitUp(ledger: removeLedger);
      detailList.removeAt(index);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  void updateContraCartLedger({required ContraCartEntity cartLedger}) {
    final index = detailList
        .indexWhere((ledger) => cartLedger.ledgerId == ledger.ledgerId);

    if (index != -1) {
      final oldLedger = detailList[index];
      _decreaseRateSplitUp(ledger: oldLedger);

      final netTotal = cartLedger.netTotal;
      final drAmount = cartLedger.drAmount;
      final crAmount = cartLedger.crAmount;

      final ledgerMode = (drAmount > 0)
          ? LedgerModeState.debitLedger()
          : LedgerModeState.creditLedger();

      final updatedLedger = ContraCartEntity(
          ledgerId: cartLedger.ledgerId,
          ledger: cartLedger.ledger,
          currentBalance: cartLedger.currentBalance,
          netTotal: netTotal,
          drAmount: drAmount,
          crAmount: crAmount,
          ledgerMode: ledgerMode,
          description: cartLedger.description);

      detailList[index] = updatedLedger;
      _getRateSplitUp(
        ledger: updatedLedger,
      );
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
    state = state.copyWith(description: description);
  }

  setNotes(String notes) {
    this.notes = notes;
    state = state.copyWith(notes: notes);
  }

  setLedger(LedgerAccountEntity ledger) {
    selectedLedger = ledger;
    state = state.copyWith(selectedLedger: selectedLedger);
  }

  removeLedger() {
    selectedLedger = LedgerAccountEntity(ledgerName: "Debit Ledger");
    state = state.copyWith(selectedLedger: selectedLedger);
  }

  setEditMode(bool enableEdit) {
    isForEdit = enableEdit;
    state = state.copyWith(isForUpdate: isForEdit);
  }

  Future<ContraRequestModel> createNewContra() async {
    double netTotal = 0.0;
    final List<ContraEntryDetail> details = [];
    final useDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final companyDetails =
        await AppCredentialPreferenceHelper().getCompanyInfo();

    final mode = ref.read(entryModeProvider);
    final entryMode = ref.read(entryModeProvider).when(
        singleEntry: () => "Single Entry", doubleEntry: () => "Double Entry");

    for (var i = 0; i < detailList.length; i++) {
      double drAmount = detailList[i].drAmount;
      double crAmount = detailList[i].crAmount;

      if (mode == EntryModeState.singleEntry()) {
        netTotal += detailList[i].netTotal;
        crAmount = detailList[i].netTotal;
        drAmount = 0.0;
      } else if (mode == EntryModeState.doubleEntry()) {
        netTotal += detailList[i].drAmount;
      }

      final detail = ContraEntryDetail(
          contraIDPK: contraIDPK,
          ledgerIDPK: detailList[i].ledger.ledgerIdpk ?? "",
          description: detailList[i].description,
          ledgerName: detailList[i].ledger.ledgerName,
          currentBalance: detailList[i].ledger.currentBalance ?? 0.0,
          currentBalanceType: detailList[i].ledger.currentBalanceType ?? "",
          drAmount: drAmount,
          crAmount: crAmount,
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
      toAccount: selectedLedger?.ledgerIdpk ?? PrefResources.emptyGuid,
      toAccountName: selectedLedger?.ledgerName ?? "",
      contraEntryDetail: details,
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
    refNo = "";
    contraDate = DateTime.now();
    contraIDPK = PrefResources.emptyGuid;
    allAccount = null;
    toAccount = "";
    notes = "";
    ref.read(entryModeProvider.notifier).state = EntryModeState.singleEntry();
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
      ContraEntryDetailEntity contraDetails) {
    return LedgerAccountEntity(
        ledgerIdpk: contraDetails.ledgerIDPK,
        description: contraDetails.description,
        ledgerName: contraDetails.ledgerName,
        currentBalance: contraDetails.currentBalance,
        ledgerCode: contraDetails.ledgerIDPK);
  }

  reinsertContraForm(ContraEntryEntity contra, WidgetRef ref) async {
    clearContraCart();
    setEditMode(true);
    List<ContraCartEntity> updatedLedgerList = [];
    setContraIDPK(contra.contraIDPK ?? "");
    setContraNo(contra.contraNo?.toString() ?? "");
    setRefNo(contra.referenceNo ?? "");
    setContraDate(contra.contraDate ?? DateTime.now());
    setNotes(contra.remarks ?? "");
    setDescription(contra.description ?? "");

    final entryMode = contra.entryMode?.toLowerCase();
    final entryModeState = (entryMode == "single entry")
        ? EntryModeState.singleEntry()
        : EntryModeState.doubleEntry();
    ref.read(entryModeProvider.notifier).state = entryModeState;

    final ledgerMode = (drAmount) > 0
        ? LedgerModeState.debitLedger()
        : LedgerModeState.creditLedger();

    if (contra.contraEntryDetail?.isNotEmpty == true) {
      for (var index = 0; index < contra.contraEntryDetail!.length; index++) {
        final contraDetail = contra.contraEntryDetail![index];
        final ledgerEntity = covertContraDetailsToDetails(contraDetail);
        final netTotal = contra.totalAmount;
        final drAmount = contraDetail.drAmount;
        final crAmount = contraDetail.crAmount;

        final cartLedger = ContraCartEntity(
            ledgerId: (index + 1),
            ledger: ledgerEntity,
            currentBalance: ledgerEntity.currentBalance?.toDouble() ?? 0.0,
            netTotal: netTotal?.toDouble() ?? 0.0,
            drAmount: drAmount?.toDouble() ?? 0.0,
            crAmount: crAmount?.toDouble() ?? 0.0,
            ledgerMode: ledgerMode,
            description: ledgerEntity.description ?? "");

        updatedLedgerList.add(cartLedger);

        if (entryModeState == EntryModeState.singleEntry()) {
          setLedger(ledgerEntity);
        }

        if (cartLedger.drAmount > 0) {
          ref
              .read(ledgerModeProvider(cartLedger.ledger.ledgerCode).notifier)
              .state = LedgerModeState.debitLedger();
        } else if (cartLedger.crAmount > 0) {
          ref
              .read(ledgerModeProvider(cartLedger.ledger.ledgerCode).notifier)
              .state = LedgerModeState.creditLedger();
        }

        _getRateSplitUp(ledger: cartLedger);

        detailList = updatedLedgerList;
      }
    }
    updateState();
  }

  void _getRateSplitUp({
    required ContraCartEntity ledger,
    bool isInitial = false,
  }) {
    final entryMode = ref.read(entryModeProvider);
    // final ledgerMode =
    //     ref.read(ledgerModeProvider(ledger.ledger.ledgerCode ?? ""));
    if (entryMode == EntryModeState.singleEntry()) {
      totalAmount += ledger.netTotal;
      crAmount += ledger.netTotal;
      drAmount = 0.0;
    } else if (entryMode == EntryModeState.doubleEntry() &&
        ledger.ledgerMode == LedgerModeState.debitLedger()) {
      drAmount += ledger.drAmount;
      totalAmount += ledger.drAmount;
    } else if (entryMode == EntryModeState.doubleEntry() &&
        ledger.ledgerMode == LedgerModeState.creditLedger()) {
      crAmount += ledger.crAmount;
      totalAmount += ledger.crAmount;
    }
    if (!isInitial) {
      state = state.copyWith(
          totalAmount: totalAmount, drAmount: drAmount, crAmount: crAmount);
    }
  }

  void _decreaseRateSplitUp({required ContraCartEntity ledger}) {
    final entryMode = ref.read(entryModeProvider);
    // final ledgerMode =
    //     ref.read(ledgerModeProvider(ledger.ledger.ledgerCode ?? ""));

    if (entryMode == EntryModeState.singleEntry()) {
      totalAmount -= ledger.netTotal;
      crAmount -= ledger.netTotal;
      drAmount = 0.0;
    } else if (entryMode == EntryModeState.doubleEntry() &&
        ledger.ledgerMode == LedgerModeState.debitLedger()) {
      drAmount -= ledger.drAmount;
      totalAmount = ledger.drAmount;
    } else if (entryMode == EntryModeState.doubleEntry() &&
        ledger.ledgerMode == LedgerModeState.creditLedger()) {
      crAmount -= ledger.crAmount;
      totalAmount = ledger.crAmount;
    }

    state = state.copyWith(
        totalAmount: totalAmount, crAmount: crAmount, drAmount: drAmount);
  }

  updateState() {
    final currentEntryMode = ref.read(entryModeProvider).when(
        singleEntry: () => "Single Entry", doubleEntry: () => "Double Entry");
    state = state.copyWith(
        ledgerList: detailList,
        totalAmount: totalAmount,
        drAmount: drAmount,
        crAmount: crAmount,
        entryMode: currentEntryMode);
  }
}
