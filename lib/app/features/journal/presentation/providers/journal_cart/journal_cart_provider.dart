import 'dart:developer';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/journal/data/model/journal_request_model.dart';
import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_cart_entity.dart';
import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_entity.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal_cart/journal_cart_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final journalCartProvider =
    StateNotifierProvider<JournalCartNotifier, JournalCartState>(
  (ref) => JournalCartNotifier(ref),
);

class JournalCartNotifier extends StateNotifier<JournalCartState> {
  final Ref ref;
  JournalCartNotifier(this.ref) : super(JournalCartState.initial());

  List<JournalCartEntity> detailList = [];
  double totalAmount = 0.0;
  double drAmount = 0.0;
  double crAmount = 0.0;
  String journalNo = "";
  String refNo = "";
  DateTime journalDate = DateTime.now();
  String notes = "";
  String description = "";
  LedgerAccountEntity? allAccount;
  LedgerAccountEntity? selectedLedger;
  String toAccount = "";
  String entryMode = "";
  bool isForEdit = false;
  String journalIDPK = PrefResources.emptyGuid;

  void addLedgerIntoJournalCart({required JournalCartEntity ledger}) {
    detailList.add(ledger);
    _getRateSplitUp(
      ledger: ledger,
    );

    state = state.copyWith(ledgerList: detailList);
  }

  void removeLedgerFromJournalCart({required int index}) {
    if (index >= 0 && index < detailList.length) {
      final JournalCartEntity removeLedger = detailList[index];
      _decreaseRateSplitUp(ledger: removeLedger, entryMode: entryMode);
      detailList.removeAt(index);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  void updateJournalCartLedger({required JournalCartEntity cartLedger}) {
    final index = detailList
        .indexWhere((ledger) => cartLedger.ledgerId == ledger.ledgerId);

    if (index != -1) {
      final oldLedger = detailList[index];
      _decreaseRateSplitUp(ledger: oldLedger, entryMode: entryMode);

      final netTotal = cartLedger.netTotal;
      final drAmount = cartLedger.drAmount;
      final crAmount = cartLedger.crAmount;

      final ledgerMode = (drAmount > 0)
          ? LedgerModeState.debitLedger()
          : LedgerModeState.creditLedger();

      final updatedLedger = JournalCartEntity(
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

  setJournalNo(String journalNo) {
    this.journalNo = journalNo;
    state = state.copyWith(journalNo: journalNo);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setJournalIDPK(String journalIDPK) {
    this.journalIDPK = journalIDPK;
  }

  setJournalDate(DateTime journalDate) {
    this.journalDate = journalDate;
    state = state.copyWith(journalDate: journalDate);
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

  Future<JournalRequestModel> createNewJournal() async {
    double netTotal = 0.0;
    // double drAmount = 0.0;
    // double crAmount = 0.0;
    final List<JournalDetail> details = [];
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

      final detail = JournalDetail(
          journalIDPK: journalIDPK,
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

    final newJournal = JournalRequestModel(
      journalIDPK: journalIDPK,
      journalNo: 0,
      referenceNo: refNo,
      journalDate: journalDate,
      description: description,
      totalAmount: netTotal,
      remarks: notes,
      isEditable: true,
      isCanceled: false,
      createdBy: useDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
      createdDate: journalDate,
      modifiedBy: useDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
      modifiedDate: DateTime.now(),
      rowguid: PrefResources.emptyGuid,
      companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
      entryMode: entryMode,
      toAccount: selectedLedger?.ledgerIdpk ?? PrefResources.emptyGuid,
      journalEntryDetail: details,
    );
    log("newJournal: $newJournal");
    return newJournal;
  }

  void clearJournalCart() {
    detailList.clear();
    totalAmount = 0.0;
    drAmount = 0.0;
    crAmount = 0.0;
    refNo = "";
    journalNo = "";
    journalDate = DateTime.now();
    journalIDPK = PrefResources.emptyGuid;
    allAccount = null;
    toAccount = "";
    selectedLedger = null;
    notes = "";
    ref.read(entryModeProvider.notifier).state = EntryModeState.singleEntry();
    state = JournalCartState.initial();
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

  LedgerAccountEntity covertJournalDetailsToDetails(
      JournalEntryDetailEntity journalDetails) {
    return LedgerAccountEntity(
      ledgerIdpk: journalDetails.ledgerIDPK,
      description: journalDetails.description,
      ledgerName: journalDetails.ledgerName,
      currentBalance: journalDetails.currentBalance,
      ledgerCode: journalDetails.ledgerIDPK,
    );
  }

  reinsertJournalForm(JournalEntryEntity journal, WidgetRef ref) async {
    clearJournalCart();
    setEditMode(true);
    double drAmount = 0.0;
    List<JournalCartEntity> updatedLedgerList = [];
    setJournalIDPK(journal.journalIDPK ?? "");
    setJournalNo(journal.journalNo?.toString() ?? "");
    setRefNo(journal.referenceNo ?? "");
    setJournalDate(journal.journalDate ?? DateTime.now());
    final remarks = journal.remarks ?? "";
    setNotes(remarks);
    setDescription(journal.description ?? "");
    final entryMode = journal.entryMode?.toLowerCase();
    final entryModeState = (entryMode == "single entry")
        ? EntryModeState.singleEntry()
        : EntryModeState.doubleEntry();
    ref.read(entryModeProvider.notifier).state = entryModeState;

    final ledgerMode = (drAmount) > 0
        ? LedgerModeState.debitLedger()
        : LedgerModeState.creditLedger();

    if (journal.journalEntryDetail?.isNotEmpty == true) {
      for (var index = 0; index < journal.journalEntryDetail!.length; index++) {
        final journalDetail = journal.journalEntryDetail![index];
        final ledgerEntity = covertJournalDetailsToDetails(journalDetail);
        final netTotal = journal.totalAmount;
        final drAmount = journalDetail.drAmount;
        final crAmount = journalDetail.crAmount;

        final cartLedger = JournalCartEntity(
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

        _getRateSplitUp(
          ledger: cartLedger,
        );

        detailList = updatedLedgerList;
      }
    }
    updateState();
  }

  void _getRateSplitUp({
    required JournalCartEntity ledger,
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

  void _decreaseRateSplitUp(
      {required JournalCartEntity ledger, required String entryMode}) {
    final entryMode = ref.read(entryModeProvider);
    // final ledgerMode =
    //     ref.read(ledgerModeProvider(ledger.ledger.ledgerCode ?? ""));

    if (entryMode == EntryModeState.singleEntry()) {
      totalAmount -= ledger.netTotal;
      crAmount -= ledger.netTotal;
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
