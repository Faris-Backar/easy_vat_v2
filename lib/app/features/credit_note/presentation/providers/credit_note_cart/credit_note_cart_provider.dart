import 'dart:developer';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/credit_note/data/model/credit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_cart_entity.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note_cart/credit_note_cart_state.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/all_ledgers/all_ledgers_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final creditNoteCartProvider =
    StateNotifierProvider<CreditNoteCartNotifier, CreditNoteCartState>((ref) {
  return CreditNoteCartNotifier();
});

class CreditNoteCartNotifier extends StateNotifier<CreditNoteCartState> {
  CreditNoteCartNotifier() : super(CreditNoteCartState.initial()) {
    _loadTaxPreference();
  }

  List<CreditNoteCartEntity> detailList = [];
  double drAmount = 0.0;
  double totalAmount = 0.0;
  double netTotal = 0.0;
  double taxPercentage = 0.0;
  double taxAmount = 0.0;
  String creditNoteNo = "";
  DateTime creditNoteDate = DateTime.now();
  String refNo = "";
  LedgerAccountEntity? cashAccount;
  LedgerAccountEntity? allAccount;
  LedgerAccountEntity? drLedger;
  LedgerAccountEntity? crLedger;
  CustomerEntity? selectedCustomer;
  String description = "";
  String notes = "";
  String paymentMode = "";
  String soldBy = "";
  String billingAddress = "";
  String shippingAddress = "";
  bool isTaxEnabled = true;
  bool isForEdit = false;
  String creditNoteIDPK = PrefResources.emptyGuid;

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
    drAmount = 0.0;
    taxAmount = 0.0;

    for (final ledger in detailList) {
      _getRateSplitUp(ledger: ledger, isInitial: true);
    }
  }

  void addLedgerIntoCreditNoteCart({required CreditNoteCartEntity ledger}) {
    detailList.add(ledger);
    _getRateSplitUp(ledger: ledger);
    state = state.copyWith(ledgerList: detailList);
  }

  void removeLedgerFromCreditNoteCart({required int index}) {
    if (index >= 0 && index < detailList.length) {
      final CreditNoteCartEntity removedLedger = detailList[index];
      _decreaseRateSplitUp(ledger: removedLedger);
      detailList.removeAt(index);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  void updateCreditNoteCartLedger({required CreditNoteCartEntity cartLedger}) {
    final index = detailList
        .indexWhere((ledger) => cartLedger.ledgerId == ledger.ledgerId);

    if (index != -1) {
      final oldLedger = detailList[index];
      _decreaseRateSplitUp(ledger: oldLedger);

      final tax = isTaxEnabled ? cartLedger.taxAmount : 0.0;
      final netTotal = cartLedger.drAmount + (isTaxEnabled ? tax : 0.0);

      final updatedLedger = CreditNoteCartEntity(
          ledgerId: cartLedger.ledgerId,
          ledgerBalance: cartLedger.ledgerBalance,
          ledger: cartLedger.ledger,
          netTotal: netTotal,
          drAmount: cartLedger.drAmount,
          taxAmount: isTaxEnabled ? cartLedger.taxAmount : 0.0,
          taxPercentage: cartLedger.taxPercentage,
          description: cartLedger.description,
          tax: isTaxEnabled ? cartLedger.tax : 0.0);

      detailList[index] = updatedLedger;
      _getRateSplitUp(ledger: updatedLedger);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  setCreditNoteNo(String creditNoteNo) {
    this.creditNoteNo = creditNoteNo;
    state = state.copyWith(creditNoteNo: creditNoteNo);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setCreditNoteIDPK(String creditNoteIDPK) {
    this.creditNoteIDPK = creditNoteIDPK;
  }

  setCreditNoteDate(DateTime creditNoteDate) {
    this.creditNoteDate = creditNoteDate;
    state = state.copyWith(creditNoteDate: creditNoteDate);
  }

  setPaymentMode(String paymentMode) {
    this.paymentMode = paymentMode;
    state = state.copyWith(paymentMode: paymentMode);
  }

  setSoldBy(String soldBy) {
    this.soldBy = soldBy;
    state = state.copyWith(soldBy: soldBy);
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

  setCustomer(CustomerEntity customer) {
    selectedCustomer = customer;
    state = state.copyWith(selectedCustomer: selectedCustomer);
  }

  removeCustomer() {
    selectedCustomer = CustomerEntity(ledgerName: "Cash", isActive: true);
    state = state.copyWith(selectedCustomer: selectedCustomer);
  }

  setBillingAddress(String billingAddress) {
    this.billingAddress = billingAddress;
  }

  setShippingAddress(String shippingAddress) {
    this.shippingAddress = shippingAddress;
  }

  setEditMode(bool enableEdit) {
    isForEdit = enableEdit;
    state = state.copyWith(isForUpdate: isForEdit);
  }

  Future<CreditNoteRequestModel> createNewCreditNote() async {
    double netTotal = 0.0;
    double totalDrAmount = 0.0;
    double totalTax = 0.0;
    final List<CreditNoteEntryDetails> details = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final companyDetails =
        await AppCredentialPreferenceHelper().getCompanyInfo();

    for (var i = 0; i < detailList.length; i++) {
      drAmount = detailList[i].drAmount.toDouble();
      final taxAmount = isTaxEnabled
          ? ((detailList[i].drAmount) * (detailList[i].taxPercentage)) / 100
          : 0.0;
      totalDrAmount += drAmount;
      totalTax += taxAmount;
      netTotal += drAmount + taxAmount;

      final detail = CreditNoteEntryDetails(
          creditNoteIDPK: creditNoteIDPK,
          ledgerIDPK: detailList[i].ledger.ledgerIdpk ?? "",
          description: detailList[i].description,
          drAmount: totalDrAmount,
          tax: isTaxEnabled ? totalTax : 0.0,
          taxPercentage: isTaxEnabled ? (detailList[i].taxPercentage) : 0.0,
          netTotal: netTotal,
          companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
          ledgerBalance: detailList[i].ledgerBalance,
          ledgerName: detailList[i].ledger.ledgerName ?? "");
      details.add(detail);
    }

    final newCreditNote = CreditNoteRequestModel(
        creditNoteIDPK: creditNoteIDPK,
        drLedgerIDFK: PrefResources.emptyGuid,
        crLedgerIDFK: selectedCustomer?.ledgerIdpk ??
            allAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        customerIDPK: selectedCustomer?.ledgerIdpk ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        referenceNo: refNo,
        creditNoteNo: 0,
        creditNoteDate: creditNoteDate,
        paymentMode: paymentMode,
        description: description,
        totalAmount: netTotal,
        soldBy: soldBy,
        remarks: notes,
        isEditable: true,
        isCanceled: false,
        createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        createdDate: creditNoteDate,
        modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedDate: DateTime.now(),
        rowguid: PrefResources.emptyGuid,
        creditNoteEntryDetails: details,
        companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
        customerName: selectedCustomer?.ledgerName ?? "cash",
        customerBalance: selectedCustomer?.currentBalance ?? 0.0);
    log("newCreditNote: $newCreditNote");
    return newCreditNote;
  }

  void clearCreditNoteCart() {
    detailList.clear();
    totalAmount = 0.0;
    taxAmount = 0.0;
    creditNoteNo = "";
    refNo = "";
    creditNoteDate = DateTime.now();
    cashAccount = null;
    allAccount = null;
    notes = "";
    paymentMode = "";
    soldBy = "";
    selectedCustomer = CustomerEntity(ledgerName: "Cash", isActive: true);
    creditNoteIDPK = PrefResources.emptyGuid;
    state = CreditNoteCartState.initial().copyWith(isTaxEnabled: isTaxEnabled);
  }

  double calculateTotalTax(
      {required double drAmount, required double taxPercentage}) {
    if (!isTaxEnabled) return 0.0;

    double taxAmount = (drAmount * taxPercentage) / 100;
    return taxAmount;
  }

  double calculateNetTotal(
      {required double drAmount, required double taxAmount}) {
    return drAmount + (isTaxEnabled ? taxAmount : 0.0);
  }

  LedgerAccountEntity contvertCreditNoteDetailsToDetails(
      CreditNoteEntryDetailsEntity creditNoteDetails) {
    return LedgerAccountEntity(
        ledgerIdpk: creditNoteDetails.ledgerIDPK,
        description: creditNoteDetails.description,
        ledgerName: creditNoteDetails.ledgerName,
        currentBalance: creditNoteDetails.ledgerBalance,
        taxPercentage: creditNoteDetails.taxPercentage);
  }

  reinsertCreditNoteForm(
      CreditNoteEntryEntity creditNote, WidgetRef ref) async {
    clearCreditNoteCart();
    setEditMode(true);
    List<CreditNoteCartEntity> updatedLedgerList = [];
    ref.read(customerNotifierProvider.notifier).getCustomer();
    final customerList = ref.read(customerNotifierProvider).customerList;
    final selectedCustomer = customerList != null
        ? customerList.firstWhere((customer) =>
            customer.ledgerIdpk?.toLowerCase() ==
            creditNote.companyIDPK?.toLowerCase())
        : CustomerEntity(
            ledgerName: creditNote.customerName,
            ledgerIdpk: creditNote.customerIDPK);
    if (creditNote.customerName?.toLowerCase() != "cash") {
      final cashLedger = ref
          .read(cashLedgerNotifierProvider.notifier)
          .getLedgerById(creditNote.crLedgerIDFK ?? "");

      if (cashLedger != null) {
        setCashAccount(cashLedger);
      }
    }

    final allLedger = ref
        .read(allLedgerNotifierProvider.notifier)
        .getLedgerById(creditNote.crLedgerIDFK!);
    if (allLedger != null) {
      setAllAccount(allLedger);
    }

    final updateCustomerWithAddress = selectedCustomer.copyWith(
        billingAddress: billingAddress, shippingAddress: shippingAddress);
    setCreditNoteIDPK(creditNote.creditNoteIDPK ?? "");
    setCustomer(updateCustomerWithAddress);
    setCreditNoteNo(creditNote.creditNoteNo?.toString() ?? "");
    setRefNo(creditNote.referenceNo ?? "");
    setCreditNoteDate(creditNote.creditNoteDate ?? DateTime.now());
    setPaymentMode(creditNote.paymentMode ?? "Cash");
    setSoldBy(creditNote.soldBy ?? "");
    setNotes(creditNote.remarks ?? "");

    if (creditNote.creditNoteEntryDetails?.isNotEmpty == true) {
      for (var index = 0;
          index < creditNote.creditNoteEntryDetails!.length;
          index++) {
        final creditNoteDetails = creditNote.creditNoteEntryDetails![index];
        final ledgerEntity =
            contvertCreditNoteDetailsToDetails(creditNoteDetails);
        final taxPercentage = ledgerEntity.taxPercentage ?? 0.0;
        final drAmount = creditNoteDetails.drAmount ?? 0.0;
        taxAmount = isTaxEnabled
            ? calculateTotalTax(
                drAmount: drAmount, taxPercentage: taxPercentage)
            : 0.0;
        final netTotal = drAmount + taxAmount;

        final cartLeder = CreditNoteCartEntity(
            ledgerId: (index + 1),
            ledgerBalance: creditNoteDetails.ledgerBalance?.toDouble() ?? 0.0,
            ledger: ledgerEntity,
            netTotal: netTotal,
            drAmount: drAmount,
            taxAmount: taxAmount,
            taxPercentage: taxPercentage,
            description: description,
            tax: creditNoteDetails.tax ?? 0.0);

        updatedLedgerList.add(cartLeder);
        _getRateSplitUp(ledger: cartLeder);

        detailList = updatedLedgerList;
      }
    }
    updateState();
  }

  void _getRateSplitUp(
      {required CreditNoteCartEntity ledger, bool isInitial = false}) {
    if (isTaxEnabled) {
      taxAmount += ledger.taxAmount;
      totalAmount += ledger.drAmount + ledger.taxAmount;
    } else {
      totalAmount += ledger.drAmount;
    }

    if (!isInitial) {
      state = state.copyWith(
          totalAmount: totalAmount,
          taxAmount: taxAmount,
          isTaxEnabled: isTaxEnabled);
    }
  }

  void _decreaseRateSplitUp({required CreditNoteCartEntity ledger}) {
    if (isTaxEnabled) {
      taxAmount -= ledger.tax;
      totalAmount -= ledger.drAmount + ledger.taxAmount;
    } else {
      totalAmount -= ledger.drAmount;
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
