import 'dart:developer';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/debit_note/data/model/debit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_cart_entity.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note_cart/debit_note_cart_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/all_ledgers/all_ledgers_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/providers/supplier_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final debitNoteCartProvider =
    StateNotifierProvider<DebitNoteCartNotifier, DebitNoteCartState>((ref) {
  return DebitNoteCartNotifier();
});

class DebitNoteCartNotifier extends StateNotifier<DebitNoteCartState> {
  DebitNoteCartNotifier() : super(DebitNoteCartState.initial()) {
    _loadTaxPreference();
  }

  List<DebitNoteCartEntity> detailList = [];
  double crAmount = 0.0;
  double totalAmount = 0.0;
  double netTotal = 0.0;
  double taxPercentage = 0.0;
  double taxAmount = 0.0;
  String debitNoteNo = "";
  DateTime debitNoteDate = DateTime.now();
  String refNo = "";
  LedgerAccountEntity? cashAccount;
  LedgerAccountEntity? allAccount;
  LedgerAccountEntity? drLedger;
  LedgerAccountEntity? crLedger;
  SupplierEntity? selectedSupplier;
  String description = "";
  String notes = "";
  String paymentMode = "";
  String purchasedBy = "";
  String billingAddress = "";
  bool isTaxEnabled = true;
  bool isForEdit = false;
  String debitNoteIDPK = PrefResources.emptyGuid;

  Future<void> _loadTaxPreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      isTaxEnabled = prefs.getBool("isTaxEnabled") ?? true;
      state = state.copyWith(isTaxEnabled: isTaxEnabled);
    } catch (e) {
      isTaxEnabled = true;
    }
  }

  Future<void> setTaxEnabled(bool enabled) async {
    isTaxEnabled = enabled;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isTaxEnabled", enabled);
    } catch (e) {
      log("Error saving tax preference: $e");
    }

    state = state.copyWith(isTaxEnabled: isTaxEnabled);
    _recalculateTotals();
  }

  void _recalculateTotals() {
    totalAmount = 0.0;
    crAmount = 0.0;
    taxAmount = 0.0;

    for (final ledger in detailList) {
      _getRateSplitUp(ledger: ledger, isInitial: true);
    }
  }

  void addLedgerIntoDebitNoteCart({required DebitNoteCartEntity ledger}) {
    detailList.add(ledger);
    _getRateSplitUp(ledger: ledger);
    state = state.copyWith(ledgerList: detailList);
  }

  void removeLedgerFromDebitNoteCart({required int index}) {
    if (index >= 0 && index < detailList.length) {
      final DebitNoteCartEntity removedLedger = detailList[index];
      _decreaseRateSplitUp(ledger: removedLedger);
      detailList.removeAt(index);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  void updateDebitNoteCartLedger({required DebitNoteCartEntity cartLedger}) {
    final index = detailList
        .indexWhere((ledger) => cartLedger.ledgerId == ledger.ledgerId);

    if (index != -1) {
      final oldLedger = detailList[index];
      _decreaseRateSplitUp(ledger: oldLedger);

      final tax = isTaxEnabled ? cartLedger.taxAmount : 0.0;
      final netTotal = cartLedger.crAmount + (isTaxEnabled ? tax : 0.0);

      final updatedLedger = DebitNoteCartEntity(
          ledgerId: cartLedger.ledgerId,
          ledgerBalance: cartLedger.ledgerBalance,
          ledger: cartLedger.ledger,
          netTotal: netTotal,
          crAmount: cartLedger.crAmount,
          taxAmount: isTaxEnabled ? cartLedger.taxAmount : 0.0,
          taxPercentage: cartLedger.taxPercentage,
          description: cartLedger.description,
          tax: isTaxEnabled ? cartLedger.tax : 0.0);

      detailList[index] = updatedLedger;
      _getRateSplitUp(ledger: updatedLedger);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  setDebitNoteNo(String debitNoteNo) {
    this.debitNoteNo = debitNoteNo;
    state = state.copyWith(debitNoteNo: debitNoteNo);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setDebitNoteIDPK(String debitNoteIDPK) {
    this.debitNoteIDPK = debitNoteIDPK;
  }

  setDebitNoteDate(DateTime debitNoteDate) {
    this.debitNoteDate = debitNoteDate;
    state = state.copyWith(debitNoteDate: debitNoteDate);
  }

  setPaymentMode(String paymentMode) {
    this.paymentMode = paymentMode;
    state = state.copyWith(paymentMode: paymentMode);
  }

  setPurchasedBy(String purchasedBy) {
    this.purchasedBy = purchasedBy;
    state = state.copyWith(purchasedBy: purchasedBy);
  }

  setCashAccount(LedgerAccountEntity cashAccount) {
    this.cashAccount = cashAccount;
    state = state.copyWith(cashAccount: cashAccount);
  }

  setAllAccount(LedgerAccountEntity allAccount) {
    this.allAccount = allAccount;
    state = state.copyWith(allAccount: allAccount);
  }

  setNotes(String notes) {
    this.notes = notes;
  }

  setDescription(String description) {
    this.description = description;
  }

  setSupplier(SupplierEntity supplier) {
    selectedSupplier = supplier;
    state = state.copyWith(selectedSupplier: selectedSupplier);
  }

  removeSupplier() {
    selectedSupplier = SupplierEntity(ledgerName: "Cash", isActive: true);
    state = state.copyWith(selectedSupplier: selectedSupplier);
  }

  setBillingAddress(String billingAddress) {
    this.billingAddress = billingAddress;
  }

  setEditMode(bool enableEdit) {
    isForEdit = enableEdit;
    state = state.copyWith(isForUpdate: isForEdit);
  }

  Future<DebitNoteRequestModel> createNewDebitNote() async {
    double netTotal = 0.0;
    double crAmount = 0.0;
    double totalTax = 0.0;
    final List<DebitNoteEntryDetails> details = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final companyDetails =
        await AppCredentialPreferenceHelper().getCompanyInfo();

    for (var i = 0; i < detailList.length; i++) {
      crAmount = detailList[i].crAmount.toDouble();
      final taxAmount = isTaxEnabled
          ? ((detailList[i].crAmount) * (detailList[i].taxPercentage)) / 100
          : 0.0;
      crAmount += crAmount;
      totalTax += taxAmount;
      netTotal += crAmount + taxAmount;

      final detail = DebitNoteEntryDetails(
          debitNoteIDPK: debitNoteIDPK,
          ledgerIDPK: detailList[i].ledger.ledgerIdpk ?? "",
          description: detailList[i].description,
          crAmount: details[i].crAmount,
          tax: isTaxEnabled ? totalTax : 0.0,
          taxPercentage: isTaxEnabled ? (detailList[i].taxPercentage) : 0.0,
          netTotal: netTotal,
          companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
          ledgerBalance: detailList[i].ledgerBalance,
          ledgerName: detailList[i].ledger.ledgerName ?? "");
      details.add(detail);
    }

    final newDebitNote = DebitNoteRequestModel(
        debitNoteIDPK: debitNoteIDPK,
        supplierIDPK: selectedSupplier?.ledgerIDPK ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        referenceNo: refNo,
        debitNoteNo: 0,
        debitNoteDate: debitNoteDate,
        paymentMode: paymentMode,
        description: description,
        totalAmount: netTotal,
        remarks: notes,
        isEditable: true,
        isCanceled: false,
        createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        createdDate: debitNoteDate,
        modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedDate: DateTime.now(),
        rowguid: PrefResources.emptyGuid,
        companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
        supplierName: selectedSupplier?.ledgerName ?? "cash",
        customerBalance: selectedSupplier?.currentBalance ?? 0.0);
    log("newDebitNote: $newDebitNote");
    return newDebitNote;
  }

  void clearDebitNoteCart() {
    detailList.clear();
    totalAmount = 0.0;
    taxAmount = 0.0;
    debitNoteNo = "";
    refNo = "";
    debitNoteDate = DateTime.now();
    cashAccount = null;
    allAccount = null;
    notes = "";
    paymentMode = "";
    purchasedBy = "";
    selectedSupplier = SupplierEntity(ledgerName: "Cash", isActive: true);
    debitNoteIDPK = PrefResources.emptyGuid;
    state = DebitNoteCartState.initial().copyWith(isTaxEnabled: isTaxEnabled);
  }

  double calculateTotalTax(
      {required double crAmount, required double taxPercentage}) {
    if (!isTaxEnabled) return 0.0;

    double taxAmount = (crAmount * taxPercentage) / 100;
    return taxAmount;
  }

  double calculateNetTotal(
      {required double crAmount, required double taxAmount}) {
    return crAmount + (isTaxEnabled ? taxAmount : 0.0);
  }

  LedgerAccountEntity contvertDebitNoteDetailsToDetails(
      DebitNoteEntryDetailsEntity debitNoteDetails) {
    return LedgerAccountEntity(
        ledgerIdpk: debitNoteDetails.ledgerIDPK,
        description: debitNoteDetails.description,
        ledgerName: debitNoteDetails.ledgerName,
        currentBalance: debitNoteDetails.ledgerBalance,
        taxPercentage: debitNoteDetails.taxPercentage);
  }

  reinsertDebitNoteForm(DebitNoteEntryEntity debitNote, WidgetRef ref) async {
    clearDebitNoteCart();
    setEditMode(true);
    List<DebitNoteCartEntity> updatedLedgerList = [];
    ref.read(supplierNotfierProvider.notifier).getSupplier();
    final supplierList = ref.read(supplierNotfierProvider).supplierList;
    final selectedSupplier = supplierList != null
        ? supplierList.firstWhere((supplier) =>
            supplier.ledgerIDPK?.toLowerCase() ==
            debitNote.supplierIDPK?.toLowerCase())
        : SupplierEntity(
            ledgerName: debitNote.supplierName,
            ledgerIDPK: debitNote.supplierIDPK);
    if (debitNote.supplierName?.toLowerCase() != "cash") {
      final cashLedger = ref
          .read(cashLedgerNotifierProvider.notifier)
          .getLedgerById(debitNote.drLedgerIDPK ?? "");

      if (cashLedger != null) {
        setCashAccount(cashLedger);
      }
    }

    final allLedger = ref
        .read(allLedgerNotifierProvider.notifier)
        .getLedgerById(debitNote.drLedgerIDPK!);
    if (allLedger != null) {
      setAllAccount(allLedger);
    }

    final updateSupplierWithAddress =
        selectedSupplier.copyWith(billingAddress: billingAddress);
    setDebitNoteIDPK(debitNote.debitNoteIDPK ?? "");
    setSupplier(updateSupplierWithAddress);
    setDebitNoteNo(debitNote.debitNoteNo?.toString() ?? "");
    setRefNo(debitNote.referenceNo ?? "");
    setDebitNoteDate(debitNote.debitNoteDate ?? DateTime.now());
    setPaymentMode(debitNote.paymentMode ?? "Cash");
    // setSoldBy(creditNote.s)
    setNotes(debitNote.remarks ?? "");

    if (debitNote.debitNoteEntryDetails?.isNotEmpty == true) {
      for (var index = 0;
          index < debitNote.debitNoteEntryDetails!.length;
          index++) {
        final debitNoteDetails = debitNote.debitNoteEntryDetails![index];
        final ledgerEntity =
            contvertDebitNoteDetailsToDetails(debitNoteDetails);
        final taxPercentage = ledgerEntity.taxPercentage ?? 0.0;
        final crAmount = debitNoteDetails.crAmount ?? 0.0;
        taxAmount = isTaxEnabled
            ? calculateTotalTax(
                crAmount: crAmount, taxPercentage: taxPercentage)
            : 0.0;
        final netTotal = crAmount + taxAmount;

        final cartLeder = DebitNoteCartEntity(
            ledgerId: (index + 1),
            ledgerBalance: debitNoteDetails.ledgerBalance?.toDouble() ?? 0.0,
            ledger: ledgerEntity,
            netTotal: netTotal,
            crAmount: crAmount,
            taxAmount: taxAmount,
            taxPercentage: taxPercentage,
            description: description,
            tax: debitNoteDetails.tax ?? 0.0);

        updatedLedgerList.add(cartLeder);
        _getRateSplitUp(ledger: cartLeder);

        detailList = updatedLedgerList;
      }
    }
    updateState();
  }

  void _getRateSplitUp(
      {required DebitNoteCartEntity ledger, bool isInitial = false}) {
    if (isTaxEnabled) {
      taxAmount += ledger.taxAmount;
      totalAmount += ledger.crAmount + ledger.taxAmount;
    } else {
      totalAmount += ledger.crAmount;
    }

    if (isInitial) {
      state = state.copyWith(
          totalAmount: totalAmount,
          taxAmount: taxAmount,
          isTaxEnabled: isTaxEnabled);
    }
  }

  void _decreaseRateSplitUp({required DebitNoteCartEntity ledger}) {
    if (isTaxEnabled) {
      taxAmount -= ledger.tax;
      totalAmount -= ledger.crAmount + ledger.taxAmount;
    } else {
      totalAmount -= ledger.crAmount;
    }

    state = state.copyWith(
        totalAmount: totalAmount,
        taxAmount: taxAmount,
        isTaxEnabled: isTaxEnabled);
  }

  updateState() {
    state = state.copyWith(
        ledgerList: detailList,
        totalAmount: totalAmount,
        taxAmount: taxAmount,
        isTaxEnabled: isTaxEnabled);
  }
}
