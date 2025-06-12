import 'dart:developer';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/expense/data/model/expense_request_model.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_cart_entity.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense_cart/expense_cart_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/expense_ledger/expense_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/providers/supplier_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final expenseCartProvider =
    StateNotifierProvider<ExpenseCartNotifier, ExpenseCartState>((ref) {
  return ExpenseCartNotifier();
});

class ExpenseCartNotifier extends StateNotifier<ExpenseCartState> {
  ExpenseCartNotifier() : super(ExpenseCartState.initial()) {
    _loadTaxPreference();
  }

  List<ExpenseCartEntity> detailList = [];
  double totalAmount = 0.0;
  double netTotal = 0.0;
  double grossTotal = 0.0;
  double taxPercentage = 0.0;
  double taxAmount = 0.0;
  double discount = 0.0;
  double roundOf = 0.0;
  String expensesNo = "";
  DateTime expenseDate = DateTime.now();
  String refNo = "";
  LedgerAccountEntity? cashAccount;
  LedgerAccountEntity? expenseAccount;
  SupplierEntity? selectedSupplier;
  String notes = "";
  String paymentMode = "";
  String purchasedBy = "";
  String? supplierInvoiceNo = "";
  String billingAddress = "";
  bool isTaxEnabled = true;
  bool isForEdit = false;
  String expenseIDPK = "00000000-0000-0000-0000-000000000000";
  LedgerAccountEntity? drledger;
  LedgerAccountEntity? crledger;

  Future<void> _loadTaxPreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      isTaxEnabled = prefs.getBool("isTaxEnabled") ?? true;
      state = state.copyWith(isTaxEnabled: isTaxEnabled);
    } catch (e) {
      log("Error loading tax preference: $e");
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
    grossTotal = 0.0;
    taxAmount = 0.0;

    for (final ledger in detailList) {
      _getRateSplitUp(ledger: ledger, isInitial: true);
    }
  }

  void addLedgerIntoExpenseCart({required ExpenseCartEntity ledger}) {
    detailList.add(ledger);
    _getRateSplitUp(ledger: ledger);
    state = state.copyWith(ledgerList: detailList);
  }

  void removeLedgerFromExpenseCart({required int index}) {
    if (index >= 0 && index < detailList.length) {
      final ExpenseCartEntity removedLedger = detailList[index];
      _decreaseRateSplitUp(ledger: removedLedger);
      detailList.removeAt(index);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  void updateExpenseCartLedger({required ExpenseCartEntity cartLedger}) {
    final index = detailList
        .indexWhere((ledger) => cartLedger.ledgerId == ledger.ledgerId);

    if (index != -1) {
      final oldLedger = detailList[index];
      _decreaseRateSplitUp(ledger: oldLedger);

      final tax = isTaxEnabled ? cartLedger.taxAmount : 0.0;
      final netTotal = cartLedger.grossTotal + (isTaxEnabled ? tax : 0.0);

      final updatedLedger = ExpenseCartEntity(
          ledgerId: cartLedger.ledgerId,
          ledgerName: cartLedger.ledgerName,
          ledgerCode: cartLedger.ledgerCode,
          groupName: cartLedger.groupName,
          nature: cartLedger.nature,
          ledger: cartLedger.ledger,
          netTotal: netTotal,
          grossTotal: cartLedger.grossTotal,
          taxAmount: isTaxEnabled ? cartLedger.taxAmount : 0.0,
          taxPercentage: cartLedger.taxPercentage,
          discount: cartLedger.discount,
          openingBalance: cartLedger.openingBalance,
          currentBalance: cartLedger.currentBalance,
          currentBalanceType: cartLedger.currentBalanceType,
          description: cartLedger.description,
          tax: isTaxEnabled ? cartLedger.tax : 0.0);

      detailList[index] = updatedLedger;
      _getRateSplitUp(ledger: updatedLedger);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  setExpensesNo(String expensesNo) {
    this.expensesNo = expensesNo;
    state = state.copyWith(expenseNo: expensesNo);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setExpenseIDPK(String expenseIDPK) {
    this.expenseIDPK = expenseIDPK;
  }

  setExpenseDate(DateTime expenseDate) {
    this.expenseDate = expenseDate;
    state = state.copyWith(expenseDate: expenseDate);
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

  setExpenseAccount(LedgerAccountEntity expenseAccount) {
    this.expenseAccount = expenseAccount;
    state = state.copyWith(expenseAccount: expenseAccount);
  }

  setNotes(String notes) {
    this.notes = notes;
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

  setSupplierInvoiceNo(String supplierInvoiceNo) {
    this.supplierInvoiceNo = supplierInvoiceNo;
    state = state.copyWith(supplierInvoiceNo: supplierInvoiceNo);
  }

  void applyDiscount(double discountAmount) {
    discount = discountAmount;

    double newTotal = 0.0;
    if (isTaxEnabled) {
      newTotal = detailList.fold(
          0.0, (sum, ledger) => sum + ledger.grossTotal + ledger.taxAmount);
    } else {
      newTotal = detailList.fold(0.0, (sum, ledger) => sum + ledger.grossTotal);
    }

    totalAmount = newTotal - discount;
    totalAmount = totalAmount < 0 ? 0 : totalAmount;

    state = state.copyWith(totalAmount: totalAmount, discount: discount);
  }

  Future<ExpenseRequestModel> createNewExpense() async {
    double netTotal = 0.0;
    double totalGross = 0.0;
    double totalTax = 0.0;
    final List<ExpenseDetails> details = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();

    for (var i = 0; i < detailList.length; i++) {
      final grossTotal = detailList[i].grossTotal;
      final taxAmount = isTaxEnabled
          ? ((detailList[i].grossTotal) * (detailList[i].taxPercentage)) / 100
          : 0.0;
      totalGross += grossTotal;
      totalTax += taxAmount;
      netTotal += grossTotal + taxAmount;

      final detail = ExpenseDetails(
          expenseIDPK: expenseIDPK,
          ledgerIDPK: detailList[i].ledger.ledgerIdpk,
          description: detailList[i].description,
          grossTotal: detailList[i].grossTotal,
          taxAmount: taxAmount,
          taxPercentage: isTaxEnabled ? (detailList[i].taxPercentage) : 0.0,
          netTotal: (grossTotal + taxAmount),
          rowguid: "00000000-0000-0000-0000-000000000000",
          companyIDPK: "00000000-0000-0000-0000-000000000000",
          currentBalance: detailList[i].currentBalance,
          ledgerName: detailList[i].ledgerName);
      details.add(detail);
      log("details: $detail");
    }

    final newExpense = ExpenseRequestModel(
      expenseIDPK: expenseIDPK,
      expenseNo: 0,
      referenceNo: refNo,
      expenseDate: expenseDate,
      paymentMode: paymentMode,
      purchasedBy: purchasedBy,
      supplierIDFK: "00000000-0000-0000-0000-000000000000",
      crLedgerIDFK: "00000000-0000-0000-0000-000000000000",
      drLedgerIDFK: "00000000-0000-0000-0000-000000000000",
      supplierInvoiceNo: supplierInvoiceNo,
      grossTotal: totalGross,
      discount: discount,
      tax: isTaxEnabled ? totalTax : 0.0,
      netTotal: (netTotal),
      roundOff: roundOf,
      expenseDetails: details,
      remarks: "",
      isEditable: true,
      isCanceled: false,
      createdBy: userDetailsFromPrefs?.userIdpk ??
          "00000000-0000-0000-0000-000000000000",
      createdDate: expenseDate,
      modifiedBy: userDetailsFromPrefs?.userIdpk ??
          "00000000-0000-0000-0000-000000000000",
      modifiedDate: DateTime.now(),
      rowguid: "00000000-0000-0000-0000-000000000000",
      companyIDPK: "00000000-0000-0000-0000-000000000000",
      supplierName: selectedSupplier?.ledgerName ?? "cash",
    );
    log("Created expense model successfully: $newExpense");
    return newExpense;
  }

  void clearExpenseCart() {
    detailList.clear();
    totalAmount = 0.0;
    taxAmount = 0.0;
    discount = 0.0;
    roundOf = 0.0;
    expensesNo = "";
    expenseDate = DateTime.now();
    refNo = "";
    cashAccount = null;
    expenseAccount = null;
    notes = "";
    paymentMode = "";
    purchasedBy = "";
    selectedSupplier = SupplierEntity(ledgerName: "Cash", isActive: true);
    expenseIDPK = "00000000-0000-0000-0000-000000000000";
    state = ExpenseCartState.initial().copyWith(isTaxEnabled: isTaxEnabled);
  }

  double calculateTotalTax(
      {required double grossTotal, required double taxPercentage}) {
    if (!isTaxEnabled) return 0.0;

    double taxAmount = (grossTotal * taxPercentage) / 100;
    return taxAmount;
  }

  double calculateNetTotal(
      {required double grossTotal, required double taxAmount}) {
    return grossTotal + (isTaxEnabled ? taxAmount : 0.0);
  }

  LedgerAccountEntity covertExpenseDetailsToDetails(
      ExpenseDetailsEntity expenseDetails) {
    return LedgerAccountEntity(
      ledgerIdpk: expenseDetails.ledgerIDPK,
      description: expenseDetails.description,
      ledgerName: expenseDetails.ledgerName,
      currentBalance: expenseDetails.currentBalance?.toDouble(),
      taxPercentage: expenseDetails.taxPercentage?.toDouble(),
    );
  }

  reinsertExpenseForm(ExpenseListEntity expense, WidgetRef ref) async {
    clearExpenseCart();
    setEditMode(true);
    List<ExpenseCartEntity> updatedLedgerList = [];
    ref.read(supplierNotfierProvider.notifier).getSupplier();
    final supplierList = ref.read(supplierNotfierProvider).supplierList;
    final selectedSupplier = supplierList != null
        ? supplierList.firstWhere((supplier) =>
            supplier.ledgerIDPK?.toLowerCase() ==
            expense.supplierIDFK?.toLowerCase())
        : SupplierEntity(
            ledgerName: expense.supplierName, ledgerIDPK: expense.supplierIDFK);
    if (expense.supplierName?.toLowerCase() != "cash") {
      final cashLedger = ref
          .read(cashLedgerNotifierProvider.notifier)
          .getLedgerById(expense.drLedgerIDFK ?? "");

      if (cashLedger != null) {
        setCashAccount(cashLedger);
      }
    }

    final expenseLedger = ref
        .read(expenseLedgerNotifierProvider.notifier)
        .getLedgetById(expense.crLedgerIDFK!);
    if (expenseLedger != null) {
      setExpenseAccount(expenseLedger);
    }

    final updatedSupplierWithAddress =
        selectedSupplier.copyWith(billingAddress: billingAddress);

    setExpenseIDPK(expense.expenseIDPK ?? "");
    setSupplier(updatedSupplierWithAddress);
    setExpensesNo(expense.expenseNo?.toString() ?? "");
    setRefNo(expense.referenceNo ?? "");
    setExpenseDate(expense.expenseDate ?? DateTime.now());
    setPaymentMode(expense.paymentMode ?? "Cash");
    setSupplierInvoiceNo(expense.supplierInvoiceNo ?? "");
    setPurchasedBy(expense.purchasedBy ?? "");

    if (expense.expenseDetails?.isNotEmpty == true) {
      for (var index = 0; index < expense.expenseDetails!.length; index++) {
        final expenseDetail = expense.expenseDetails![index];
        final ledgerEntity = covertExpenseDetailsToDetails(expenseDetail);
        final taxPercentage = ledgerEntity.taxPercentage ?? 0.0;
        final grossTotal = expenseDetail.grossTotal ?? 0.0;
        final taxAmount = isTaxEnabled
            ? calculateTotalTax(
                grossTotal: grossTotal, taxPercentage: taxPercentage)
            : 0.0;

        final netTotal =
            calculateNetTotal(grossTotal: grossTotal, taxAmount: taxAmount);

        final cartLedger = ExpenseCartEntity(
            ledgerId: (index + 1),
            ledgerName: ledgerEntity.ledgerName ?? "",
            ledgerCode: ledgerEntity.ledgerCode ?? "",
            groupName: ledgerEntity.groupName ?? "",
            nature: ledgerEntity.nature ?? "",
            ledger: ledgerEntity,
            netTotal: netTotal,
            grossTotal: grossTotal,
            taxAmount: taxAmount,
            taxPercentage: ledgerEntity.taxPercentage ?? 0.0,
            discount: discount,
            openingBalance: ledgerEntity.openingBalance ?? 0.0,
            currentBalance: ledgerEntity.currentBalance ?? 0.0,
            currentBalanceType: ledgerEntity.currentBalanceType ?? "",
            description: expenseDetail.description ?? "",
            tax: expenseDetail.taxAmount ?? 0.0);

        updatedLedgerList.add(cartLedger);
        _getRateSplitUp(ledger: cartLedger);

        detailList = updatedLedgerList;
      }
    }

    state = state.copyWith(
        ledgerList: detailList,
        totalAmount: totalAmount,
        taxAmount: taxAmount,
        discount: discount,
        isTaxEnabled: isTaxEnabled);
  }

  void _getRateSplitUp(
      {required ExpenseCartEntity ledger, bool isInitial = false}) {
    if (isTaxEnabled) {
      taxAmount += ledger.taxAmount;
      totalAmount += (ledger.grossTotal + ledger.taxAmount);
    } else {
      totalAmount += ledger.grossTotal;
    }

    if (!isInitial) {
      state = state.copyWith(
        totalAmount: totalAmount,
        taxAmount: taxAmount,
        isTaxEnabled: isTaxEnabled,
      );
    }
  }

  void _decreaseRateSplitUp({required ExpenseCartEntity ledger}) {
    if (isTaxEnabled) {
      taxAmount -= ledger.tax;
      totalAmount -= (ledger.grossTotal + ledger.taxAmount);
    } else {
      totalAmount -= ledger.grossTotal;
    }

    state = state.copyWith(
        totalAmount: totalAmount,
        taxAmount: taxAmount,
        isTaxEnabled: isTaxEnabled);
  }
}
