import 'dart:developer';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_notifier.dart';
import 'package:easy_vat_v2/app/features/income/data/model/income_request_model.dart';
import 'package:easy_vat_v2/app/features/income/domain/entities/income_cart_entity.dart';
import 'package:easy_vat_v2/app/features/income/domain/entities/income_entity.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income_cart/income_cart_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/income_ledger/income_ledger_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final incomeCartProvider =
    StateNotifierProvider<IncomeCartNotifier, IncomeCartState>((ref) {
  return IncomeCartNotifier();
});

class IncomeCartNotifier extends StateNotifier<IncomeCartState> {
  IncomeCartNotifier() : super(IncomeCartState.initial()) {
    _loadTaxPreference();
  }

  List<IncomeCartEntity> detailList = [];
  double totalAmount = 0.0;
  double netTotal = 0.0;
  double grossTotal = 0.0;
  double taxPercentage = 0.0;
  double taxAmount = 0.0;
  double discount = 0.0;
  double roundOf = 0.0;
  String incomeNo = "";
  DateTime incomeDate = DateTime.now();
  String refNo = "";
  LedgerAccountEntity? cashAccount;
  LedgerAccountEntity? incomeAccount;
  CustomerEntity? selectedCustomer;
  String notes = "";
  String paymentMode = "";
  String soldBy = "";
  String billingAddress = "";
  String shippingAddress = "";
  bool isTaxEnabled = true;
  bool isForEdit = false;
  String incomeIDPK = PrefResources.emptyGuid;
  LedgerAccountEntity? drledger;
  LedgerAccountEntity? crledger;

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
    grossTotal = 0.0;
    taxAmount = 0.0;

    for (final ledger in detailList) {
      _getRateSplitUp(ledger: ledger, isInitial: true);
    }
  }

  void addLedgerIntoIncomeCart({required IncomeCartEntity ledger}) {
    log("Adding ledger: ${ledger.ledger.ledgerName}");
    print("Adding ledger: ${ledger.ledger.ledgerName}");
    detailList.add(ledger);
    _getRateSplitUp(ledger: ledger);
    state = state.copyWith(ledgerList: detailList);
  }

  void removeLedgerFromIncomeCart({required int index}) {
    if (index >= 0 && index < detailList.length) {
      final IncomeCartEntity removedLedger = detailList[index];
      _decreaseRateSplitUp(ledger: removedLedger);
      detailList.removeAt(index);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  void updateIncomeCartLedger({required IncomeCartEntity cartLedger}) {
    final index = detailList
        .indexWhere((ledger) => cartLedger.ledgerId == ledger.ledgerId);

    if (index != -1) {
      final oldLedger = detailList[index];
      _decreaseRateSplitUp(ledger: oldLedger);

      final tax = isTaxEnabled ? cartLedger.taxAmount : 0.0;
      final netTotal = cartLedger.grossTotal + (isTaxEnabled ? tax : 0.0);

      final updatedLedger = IncomeCartEntity(
          ledgerId: cartLedger.ledgerId,
          openingBalance: cartLedger.openingBalance,
          currentBalance: cartLedger.currentBalance,
          currentBalanceType: cartLedger.currentBalanceType,
          ledger: cartLedger.ledger,
          netTotal: netTotal,
          grossTotal: cartLedger.grossTotal,
          taxAmount: isTaxEnabled ? cartLedger.taxAmount : 0.0,
          taxPercentage: cartLedger.taxPercentage,
          discount: cartLedger.discount,
          description: cartLedger.description,
          tax: isTaxEnabled ? cartLedger.tax : 0.0);

      detailList[index] = updatedLedger;
      _getRateSplitUp(ledger: updatedLedger);
      state = state.copyWith(ledgerList: detailList);
    }
  }

  setIncomeNo(String incomeNo) {
    this.incomeNo = incomeNo;
    state = state.copyWith(incomeNo: incomeNo);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setIncomeIDPK(String incomeIDPK) {
    this.incomeIDPK = incomeIDPK;
  }

  setIncomeDate(DateTime incomeDate) {
    this.incomeDate = incomeDate;
    state = state.copyWith(incomeDate: incomeDate);
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

  setIncomeAccount(LedgerAccountEntity incomeAccount) {
    this.incomeAccount = incomeAccount;
    state = state.copyWith(incomeAccount: incomeAccount);
  }

  setNotes(String notes) {
    this.notes = notes;
    state = state.copyWith(notes: notes);
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

  Future<IncomeRequestModel> createNewIncome() async {
    double netTotal = 0.0;
    double totalGross = 0.0;
    double totaltax = 0.0;
    final List<IncomeDetails> details = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final companyDetails =
        await AppCredentialPreferenceHelper().getCompanyInfo();

    for (var i = 0; i < detailList.length; i++) {
      grossTotal = detailList[i].grossTotal.toDouble();
      final taxAmount = isTaxEnabled
          ? ((detailList[i].grossTotal) * (detailList[i].taxPercentage)) / 100
          : 0.0;
      totalGross += grossTotal;
      totaltax += taxAmount;
      netTotal += grossTotal + taxAmount;

      final detail = IncomeDetails(
          incomeIDPK: incomeIDPK,
          ledgerIDPK: detailList[i].ledger.ledgerIdpk ?? "",
          description: detailList[i].description,
          grossTotal: detailList[i].grossTotal,
          taxAmount: taxAmount,
          taxPercentage: isTaxEnabled ? (detailList[i].taxPercentage) : 0.0,
          netTotal: netTotal,
          rowguid: detailList[i].ledger.rowguid ?? PrefResources.emptyGuid,
          companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
          currentBalance: detailList[i].ledger.currentBalance ?? 0.0,
          ledgerName: detailList[i].ledger.ledgerName ?? "");
      details.add(detail);
    }

    final newIncome = IncomeRequestModel(
        incomeIDPK: incomeIDPK,
        incomeNo: 0,
        referenceNo: refNo,
        incomeDate: incomeDate,
        paymentMode: paymentMode,
        soldBy: soldBy,
        customerIDFK: selectedCustomer?.ledgerIdpk ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        crLedgerIDFK: cashAccount?.ledgerIdpk ??
            incomeAccount?.ledgerIdpk ??
            selectedCustomer?.ledgerIdpk ??
            PrefResources.emptyGuid,
        drLedgerIDFK: PrefResources.emptyGuid,
        grossTotal: totalGross,
        discount: discount,
        tax: isTaxEnabled ? totaltax : 0.0,
        netTotal: netTotal,
        roundOff: roundOf,
        incomeDetails: details,
        remarks: notes,
        isEditable: true,
        isCanceled: false,
        createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        createdDate: incomeDate,
        modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedDate: DateTime.now(),
        rowguid: PrefResources.emptyGuid,
        companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
        customerName: selectedCustomer?.ledgerName ?? "cash");
    log("newIncome: $newIncome");
    return newIncome;
  }

  void clearIncomeCart() {
    detailList.clear();
    totalAmount = 0.0;
    taxAmount = 0.0;
    discount = 0.0;
    roundOf = 0.0;
    incomeNo = "";
    incomeDate = DateTime.now();
    refNo = "";
    cashAccount = null;
    incomeAccount = null;
    notes = "";
    paymentMode = "";
    soldBy = "";
    selectedCustomer = CustomerEntity(ledgerName: "Cash", isActive: true);
    incomeIDPK = PrefResources.emptyGuid;
    state = IncomeCartState.initial().copyWith(isTaxEnabled: isTaxEnabled);
  }

  double calculateTotalTax(
      {required double grossTotal, required double taxPercentage}) {
    if (!isTaxEnabled) return 0.0;

    double taxAmount = (grossTotal * taxPercentage) / 100;
    return taxAmount;
  }

  double calculateNetTotal(
      {required double grossTotal,
      required double taxAmount,
      required double discount}) {
    return grossTotal + (isTaxEnabled ? taxAmount : 0.0) - discount;
  }

  LedgerAccountEntity convertIncomeDetailsToDetails(
      IncomeDetailsEntity incomeDetails) {
    return LedgerAccountEntity(
        ledgerIdpk: incomeDetails.ledgerIDPK,
        ledgerCode: incomeDetails.ledgerCode,
        description: incomeDetails.description,
        ledgerName: incomeDetails.ledgerName,
        currentBalance: incomeDetails.currentBalance?.toDouble(),
        taxPercentage: incomeDetails.taxPercentage?.toDouble());
  }

  reinsertIncomeForm(IncomeListEntity income, WidgetRef ref) async {
    clearIncomeCart();
    setEditMode(true);
    List<IncomeCartEntity> updatedLedgerList = [];
    ref.read(customerNotifierProvider.notifier).getCustomer();
    final customerList = ref.read(customerNotifierProvider).customerList;
    final selectedCustomer = customerList != null
        ? customerList.firstWhere((customer) =>
            customer.ledgerIdpk?.toLowerCase() ==
            income.customerIDFK?.toLowerCase())
        : CustomerEntity(
            ledgerName: income.customerName, ledgerIdpk: income.customerIDFK);
    if (income.customerName?.toLowerCase() != "cash") {
      final cashLedger = ref
          .read(cashLedgerNotifierProvider.notifier)
          .getLedgerById(income.crLedgerIDFK ?? "");

      if (cashLedger != null) {
        setCashAccount(cashLedger);
      }
    }

    final incomeLedger = ref
        .read(incomeLedgerNotifierProvider.notifier)
        .getLedgerById(income.crLedgerIDFK!);
    if (incomeLedger != null) {
      setIncomeAccount(incomeLedger);
    }

    final updatedCustomerWithAddress = selectedCustomer.copyWith(
        billingAddress: billingAddress, shippingAddress: shippingAddress);

    setIncomeIDPK(income.incomeIDPK ?? "");
    setCustomer(updatedCustomerWithAddress);
    setIncomeNo(income.incomeNo?.toString() ?? "");
    setRefNo(income.referenceNo ?? "");
    setIncomeDate(income.incomeDate ?? DateTime.now());
    setPaymentMode(income.paymentMode ?? "Cash");
    setSoldBy(income.soldBy ?? "");
    setNotes(income.remarks ?? "");

    double discountValue = income.discount ?? 0.0;
    applyDiscount(discountValue);

    if (income.incomeDetails?.isNotEmpty == true) {
      for (var index = 0; index < income.incomeDetails!.length; index++) {
        final incomeDetail = income.incomeDetails![index];
        final discount = income.discount ?? 0.0;
        final ledgerEntity = convertIncomeDetailsToDetails(incomeDetail);
        final taxPercentage = ledgerEntity.taxPercentage ?? 0.0;
        final grossTotal = income.grossTotal ?? 0.0;
        final taxAmount = isTaxEnabled
            ? calculateTotalTax(
                grossTotal: grossTotal, taxPercentage: taxPercentage)
            : 0.0;
        final netTotal = grossTotal + taxAmount;

        final cartLedger = IncomeCartEntity(
            ledgerId: (index + 1),
            openingBalance: ledgerEntity.openingBalance?.toDouble() ?? 0.0,
            currentBalance: ledgerEntity.currentBalance?.toDouble() ?? 0.0,
            currentBalanceType: ledgerEntity.currentBalanceType ?? "",
            ledger: ledgerEntity,
            netTotal: netTotal,
            grossTotal: grossTotal,
            taxAmount: taxAmount,
            taxPercentage: taxPercentage,
            discount: discount,
            description: ledgerEntity.description ?? "",
            tax: incomeDetail.taxAmount ?? 0.0);

        state = state.copyWith(discount: discountValue);
        applyDiscount(discountValue);

        updatedLedgerList.add(cartLedger);
        _getRateSplitUp(ledger: cartLedger);

        detailList = updatedLedgerList;
      }
    }
    updateState();
  }

  void _getRateSplitUp(
      {required IncomeCartEntity ledger, bool isInitial = false}) {
    if (isTaxEnabled) {
      taxAmount += ledger.taxAmount;
      totalAmount += (ledger.grossTotal + ledger.taxAmount - discount);
    } else {
      totalAmount += ledger.grossTotal - discount;
    }

    if (!isInitial) {
      state = state.copyWith(
          totalAmount: totalAmount,
          taxAmount: taxAmount,
          isTaxEnabled: isTaxEnabled);
    }
  }

  void _decreaseRateSplitUp({required IncomeCartEntity ledger}) {
    if (isTaxEnabled) {
      taxAmount -= ledger.tax;
      totalAmount -= (ledger.grossTotal + ledger.taxAmount - discount);
    } else {
      totalAmount -= ledger.grossTotal - discount;
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
        discount: discount,
        isTaxEnabled: isTaxEnabled);
  }
}
