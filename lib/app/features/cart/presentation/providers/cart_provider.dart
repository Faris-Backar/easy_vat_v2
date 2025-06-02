import 'dart:developer';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_order_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_return_model.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_state.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_notifier.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState.initial()) {
    // Initialize by loading tax preference
    _loadTaxPreference();
  }

  List<CartEntity> itemsList = [];
  double totalAmount = 0.0;
  double subTotal = 0.0;
  double totalTax = 0.0;
  double discount = 0.0;
  double roundOf = 0.0;
  String salesNo = "";
  DateTime salesDate = DateTime.now();
  String refNo = "";
  LedgerAccountEntity? cashAccount;
  LedgerAccountEntity? salesAccount;
  String notes = "";
  String salesMode = "";
  SalesManEntity? soldBy;
  CustomerEntity? selectedCustomer;
  double totalItemGrossAmont = 0.0;
  String shippingAddress = "";
  bool isForEdit = false;
  bool isTaxEnabled = true;
  String salesIdpk = PrefResources.emptyGuid;
  String expenseNo = "";
  LedgerAccountEntity? drledger;
  LedgerAccountEntity? crledger;
  String paymentMode = "";
  String? purchasedBy;
  DateTime expenseDate = DateTime.now();
  SupplierEntity? selectedSupplier;
  String? expenseIDPK = PrefResources.emptyGuid;

  // Load tax preference from SharedPreferences
  Future<void> _loadTaxPreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      isTaxEnabled = prefs.getBool('isTaxEnabled') ?? true;
      // Update state to reflect the loaded preference
      state = state.copyWith(isTaxEnabled: isTaxEnabled);
    } catch (e) {
      log("Error loading tax preference: $e");
      // Default to true if there's an error
      isTaxEnabled = true;
    }
  }

  // Set tax enabled/disabled and save to SharedPreferences
  Future<void> setTaxEnabled(bool enabled) async {
    isTaxEnabled = enabled;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isTaxEnabled', enabled);
    } catch (e) {
      log("Error saving tax preference: $e");
    }
    // Update state
    state = state.copyWith(isTaxEnabled: isTaxEnabled);

    // Recalculate all items to update totals based on new tax setting
    _recalculateTotals();
  }

  // Recalculate all totals when tax setting changes
  void _recalculateTotals() {
    totalAmount = 0.0;
    subTotal = 0.0;
    totalTax = 0.0;

    for (final item in itemsList) {
      getRateSplitUp(item: item, isInitial: true);
    }
  }

  void addItemsIntoCart({required CartEntity item}) {
    itemsList.add(item);
    getRateSplitUp(item: item);
    state = state.copyWith(itemList: itemsList);
  }

  void removeItemFromCart({required int index}) {
    if (index >= 0 && index < itemsList.length) {
      final CartEntity removedItem = itemsList[index];
      _decreaseRateSplitUp(item: removedItem);
      itemsList.removeAt(index);
      state = state.copyWith(itemList: itemsList);
    }
  }

  void updateCartItem({required CartEntity cartItem}) {
    final index =
        itemsList.indexWhere((item) => cartItem.cartItemId == item.cartItemId);
    log("items list => $itemsList \n ${cartItem.cartItemId}");
    if (index != -1) {
      final oldItem = itemsList[index];
      _decreaseRateSplitUp(item: oldItem);

      // Calculate tax based on tax setting
      final tax = isTaxEnabled ? cartItem.tax : 0.0;
      final netTotal =
          cartItem.qty * cartItem.rate + (isTaxEnabled ? tax : 0.0);

      final updatedItem = CartEntity(
          cartItemId: cartItem.cartItemId,
          item: cartItem.item,
          qty: cartItem.qty,
          netTotal: netTotal,
          rate: cartItem.rate,
          cost: cartItem.cost,
          unit: cartItem.unit,
          description: cartItem.description,
          discount: cartItem.discount,
          tax: isTaxEnabled ? cartItem.tax : 0.0,
          gross: cartItem.gross,
          priceBeforeTax: cartItem.priceBeforeTax);

      itemsList[index] = updatedItem;
      getRateSplitUp(
        item: updatedItem,
      );
      state = state.copyWith(itemList: itemsList);
    }
  }

  setSalesNo(String salesNo) {
    this.salesNo = salesNo;
    state = state.copyWith(salesNo: salesNo);
  }

  setSalesIdpk(String salesIdpk) {
    this.salesIdpk = salesIdpk;
  }

  setSalesDate(DateTime salesDate) {
    this.salesDate = salesDate;
    state = state.copyWith(saleDate: salesDate);
  }

  setSalesMode(String salesMode) {
    this.salesMode = salesMode;
    state = state.copyWith(salesMode: salesMode);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setSoldBy(SalesManEntity soldBy) {
    this.soldBy = soldBy;
    state = state.copyWith(soldBy: soldBy);
  }

  setCashAccount(LedgerAccountEntity cashAccount) {
    this.cashAccount = cashAccount;
    state = state.copyWith(cashAccount: cashAccount);
  }

  setSalesAccount(LedgerAccountEntity salesAccount) {
    this.salesAccount = salesAccount;
    state = state.copyWith(salesAccount: salesAccount);
  }

  setNotes(String notes) {
    this.notes = notes;
  }

  setCustomer(CustomerEntity customer) {
    selectedCustomer = customer;
    state = state.copyWith(selectedCustomer: selectedCustomer);
  }

  removeCustomer() {
    selectedCustomer = CustomerEntity(ledgerName: "Cash", isActive: true);
    state = state.copyWith(selectedCustomer: selectedCustomer);
  }

  setShippingAddress(String shippingAddress) {
    this.shippingAddress = shippingAddress;
  }

  setEditMode(bool enableEdit) {
    isForEdit = enableEdit;
    state = state.copyWith(isForUpdate: isForEdit);
  }

  setExpNo(String expenseNo) {
    this.expenseNo = expenseNo;
    state = state.copyWith(expenseNo: expenseNo);
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

  setDrledger(LedgerAccountEntity drledger) {
    this.drledger = drledger;
    state = state.copyWith(drledger: drledger);
  }

  setCrledger(LedgerAccountEntity crledger) {
    this.crledger = crledger;
    state = state.copyWith(crledger: crledger);
  }

  setSupplier(SupplierEntity supplier) {
    selectedSupplier = supplier;
    state = state.copyWith(selectedSupplier: selectedSupplier);
  }

  void applyDiscount(double discountAmount) {
    discount = discountAmount;

    // Calculate new total based on whether tax is enabled
    double newTotal = 0.0;
    if (isTaxEnabled) {
      // Include tax in total calculation
      newTotal =
          itemsList.fold(0.0, (sum, item) => sum + item.gross + item.tax);
    } else {
      // Exclude tax from total calculation
      newTotal = itemsList.fold(0.0, (sum, item) => sum + item.gross);
    }

    totalAmount = newTotal - discount;
    totalAmount = totalAmount < 0 ? 0 : totalAmount;

    state = state.copyWith(
      totalAmount: totalAmount,
      discount: discount,
    );
  }

  Future<SalesRequestModel> createNewSale() async {
    double itemTotalTax = 0.0;
    double netTotal = 0.0;
    final List<SoldItem> items = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();

    for (var i = 0; i < itemsList.length; i++) {
      final grossTotal =
          (itemsList[i].item.retailRate ?? 0.0 * itemsList[i].qty);

      final taxAmount = isTaxEnabled
          ? ((itemsList[i].qty * itemsList[i].rate) *
                  (itemsList[i].item.taxPercentage ?? 0.0)) /
              100
          : 0.0;

      totalItemGrossAmont += grossTotal;
      itemTotalTax += taxAmount;
      netTotal += (grossTotal + taxAmount);

      final item = SoldItem(
        saleIdpk: salesIdpk,
        itemIdpk: itemsList[i].item.itemIdpk ?? "",
        barcode: itemsList[i].item.barcode ?? "",
        itemCode: itemsList[i].item.itemCode ?? "",
        itemName: itemsList[i].item.itemName ?? "",
        description: itemsList[i].item.description ?? "",
        unit: itemsList[i].unit,
        actualQty: itemsList[i].qty,
        billedQty: itemsList[i].qty,
        cost: itemsList[i].cost,
        sellingPrice: itemsList[i].rate,
        discount: itemsList[i].discount,
        grossTotal: grossTotal,
        taxAmount: taxAmount,
        taxPercentage:
            isTaxEnabled ? (itemsList[i].item.taxPercentage ?? 0.0) : 0.0,
        netTotal: grossTotal + (isTaxEnabled ? taxAmount : 0.0),
        currentStock: itemsList[i].item.currentStock ?? 0.0,
        profit: 0.0,
        profitPercentage: 0.0,
        isSent: true,
        expiryDate: salesDate,
        storeIdfk: userDetailsFromPrefs?.storeDetails?.storeIdpk ??
            PrefResources.emptyGuid,
        projectIdpk: PrefResources.emptyGuid,
        quotationIdpk: PrefResources.emptyGuid,
        deliveryNoteIdpk: PrefResources.emptyGuid,
        salesOrderIdpk: PrefResources.emptyGuid,
        importId: PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
      );
      items.add(item);
    }

    final newSale = SalesRequestModel(
      saleIdpk: salesIdpk,
      actualSalesDate: salesDate,
      createdDate: salesDate,
      createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
      modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
      rowguid: PrefResources.emptyGuid,
      isPos: false,
      deliveryBoyIdpk: PrefResources.emptyGuid,
      drLedgerCashAccount: PrefResources.emptyGuid,
      drLedgerBankAccount: PrefResources.emptyGuid,
      deliveryBoy: PrefResources.emptyGuid,
      deliveryCharge: 0,
      discount: discount,
      grossAmount: totalItemGrossAmont,
      netTotal: netTotal,
      referenceNo: refNo,
      soldItems: items,
      remarks: notes,
      saleMode: salesMode,
      tax: isTaxEnabled ? itemTotalTax : 0.0,
      soldBy: soldBy?.empName,
      crLedgerIdfk: salesAccount?.ledgerIdpk ?? PrefResources.emptyGuid,
      drLedgerIdfk: selectedCustomer?.ledgerIdpk ??
          cashAccount?.ledgerIdpk ??
          PrefResources.emptyGuid,
      customerName: selectedCustomer?.ledgerName ?? "cash",
      custemerIdfk: selectedCustomer?.ledgerIdpk ??
          cashAccount?.ledgerIdpk ??
          PrefResources.emptyGuid,
      cashAmount:
          salesAccount?.ledgerName?.toLowerCase() == "cash" ? totalAmount : 0.0,
      creditAccount: "",
      creditCardAmount:
          salesAccount?.ledgerName?.toLowerCase() != "cash" ? totalAmount : 0.0,
      debitAccount: "",
      cashCustomerAddress: selectedCustomer?.billingAddress ?? "",
      salesOrderNo: "0",
      amountTendered: 0,
      isEditable: true,
      isCanceled: false,
      isLockVoucher: false,
      cashTrn: selectedCustomer?.taxRegistrationNo ?? "",
      diningArea: "",
      diningTable: "",
      doNo: "",
      lpoNo: "",
      genaralNotes: "",
      notesAndInstructions: notes,
      orderType: "",
      quotationNo: "",
      requestNo: "",
      vehicleNo: "",
      saleNo: 0,
      shippingAddress: selectedCustomer?.shippingAddress ?? "",
      modifiedDate: DateTime.now(),
      roundOff: roundOf,
      saleDate: DateTime.now(),
    );
    return newSale;
  }

  Future<SalesOrderModel> createNewSaleOrder() async {
    final companyDetails =
        await AppCredentialPreferenceHelper().getCompanyInfo();
    double itemTotalTax = 0.0;
    double netTotal = 0.0;

    final uid = Uuid().v8();
    final List<SalesOrderDetailModel> items = [];
    for (var i = 0; i < itemsList.length; i++) {
      final grossTotal =
          (itemsList[i].item.retailRate ?? 0.0 * itemsList[i].qty);

      final taxAmount = isTaxEnabled
          ? ((itemsList[i].qty * itemsList[i].rate) *
                  (itemsList[i].item.taxPercentage ?? 0.0)) /
              100
          : 0.0;

      totalItemGrossAmont += grossTotal;
      itemTotalTax += taxAmount;
      netTotal += (grossTotal + taxAmount);

      final item = SalesOrderDetailModel(
        itemIdpk: itemsList[i].item.itemIdpk ?? "",
        barcode: itemsList[i].item.barcode ?? "",
        itemCode: itemsList[i].item.itemCode ?? "",
        itemName: itemsList[i].item.itemName ?? "",
        description: itemsList[i].item.description ?? "",
        unit: itemsList[i].unit,
        cost: itemsList[i].cost,
        sellingPrice: itemsList[i].rate,
        taxAmount: taxAmount,
        taxPercentage:
            isTaxEnabled ? (itemsList[i].item.taxPercentage ?? 0.0) : 0.0,
        netTotal: grossTotal + (isTaxEnabled ? taxAmount : 0.0),
        projectIdpk: PrefResources.emptyGuid,
        quotationIdpk: PrefResources.emptyGuid,
        salesOrderIdpk: PrefResources.emptyGuid,
        importId: PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
        subItems: [],
        companyIdpk: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
        grossAmount: grossTotal,
        quantity: itemsList[i].qty,
        suppliersIdpk:
            itemsList[i].item.supplierIdfk ?? PrefResources.emptyGuid,
      );
      items.add(item);
    }

    final newSale = SalesOrderModel(
      lpoNo: "0",
      quotationNo: "0",
      requestNo: "0",
      salesOrderIdpk: uid,
      companyIdpk: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
      customerIdpk: selectedCustomer?.ledgerIdpk ?? PrefResources.emptyGuid,
      salesOrderDate: DateTime.now(),
      createdDate: DateTime.now(),
      createdBy: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
      modifiedBy: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
      rowguid: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      grossTotal: totalItemGrossAmont,
      dsicount: discount,
      netTotal: netTotal,
      generalNote: notes,
      salesOrderNo: 0,
      deliveryMethod: PrefResources.emptyGuid,
      destination: shippingAddress,
      vehicleNo: "",
      salesmanIdpk: soldBy?.userIdpk ?? PrefResources.emptyGuid,
      projectIdpk: PrefResources.emptyGuid,
      invoiceAddress: shippingAddress,
      deliveryTerms: "",
      paymentTerms: "",
      referenceNo: "0",
      remarks: notes,
      tax: isTaxEnabled
          ? itemTotalTax
          : 0.0, // Only include tax if tax is enabled
      isEditable: true,
      isCanceled: true,
      salesOrderDetails: items,
      shippingAddress: shippingAddress,
      modifiedDate: DateTime.now(),
    );
    return newSale;
  }

  SalesReturnModel createNewSaleReturn() {
    double itemTotalTax = 0.0;
    double netTotal = 0.0;

    final uid = Uuid().v8();
    final List<ReturnedItemModel> items = [];
    for (var i = 0; i < itemsList.length; i++) {
      final grossTotal =
          (itemsList[i].item.retailRate ?? 0.0 * itemsList[i].qty);

      final taxAmount = isTaxEnabled
          ? ((itemsList[i].qty * itemsList[i].rate) *
                  (itemsList[i].item.taxPercentage ?? 0.0)) /
              100
          : 0.0;

      totalItemGrossAmont += grossTotal;
      itemTotalTax += taxAmount;
      netTotal += (grossTotal + taxAmount);

      final item = ReturnedItemModel(
        salesReturnIdpk: PrefResources.emptyGuid,
        actualQty: itemsList[i].qty,
        billedQty: itemsList[i].qty,
        itemIdpk: itemsList[i].item.itemIdpk ?? "",
        barcode: itemsList[i].item.barcode ?? "",
        itemCode: itemsList[i].item.itemCode ?? "",
        itemName: itemsList[i].item.itemName ?? "",
        description: itemsList[i].item.description ?? "",
        unit: itemsList[i].unit,
        cost: itemsList[i].cost,
        sellingPrice: itemsList[i].rate,
        taxAmount: taxAmount,
        taxPercentage:
            isTaxEnabled ? (itemsList[i].item.taxPercentage ?? 0.0) : 0.0,
        netTotal: grossTotal + (isTaxEnabled ? taxAmount : 0.0),
        storeIdfk:
            itemsList[i].item.storeCurrentStock?.firstOrNull?.storeIdpk ??
                PrefResources.emptyGuid,
        subItems: [],
        discount: discount,
        grossTotal: grossTotal,
      );
      items.add(item);
    }

    final newSaleReturn = SalesReturnModel(
      authorizedById: "",
      crLedgerIdfk: "",
      createdById: soldBy?.userIdpk ?? PrefResources.emptyGuid,
      customerName: selectedCustomer?.ledgerName ?? "",
      customerIdfk: selectedCustomer?.ledgerIdpk ?? PrefResources.emptyGuid,
      discount: discount,
      grossAmount: totalItemGrossAmont,
      drLedgerIdfk: "",
      modifiedById: "",
      salesReturnNo: 0,
      salesReturnMode: "",
      returnDate: DateTime.now(),
      returnedItems: items,
      roundOff: roundOf,
      saleIdfk: PrefResources.emptyGuid,
      saleNo: 0,
      salesReturnIdpk: uid,
      rowguid: PrefResources.emptyGuid,
      netTotal: netTotal,
      referenceNo: "0",
      remarks: notes,
      tax: isTaxEnabled
          ? itemTotalTax
          : 0.0, // Only include tax if tax is enabled
      isEditable: true,
      modifiedDate: DateTime.now(),
      createdDate: DateTime.now(),
    );
    return newSaleReturn;
  }

  void clearCart() {
    itemsList.clear();
    totalAmount = 0.0;
    subTotal = 0.0;
    totalTax = 0.0;
    discount = 0.0;
    roundOf = 0.0;
    salesNo = "";
    salesDate = DateTime.now();
    refNo = "";
    cashAccount = null;
    salesAccount = null;
    notes = "";
    salesMode = "";
    soldBy = null;
    isForEdit = false;
    selectedCustomer = CustomerEntity(ledgerName: "Cash", isActive: true);
    notes = "";
    salesIdpk = PrefResources.emptyGuid;
    state = CartState.initial().copyWith(isTaxEnabled: isTaxEnabled);
  }

  double calculateBeforeTax({required double retailRate, required double qty}) {
    final priceBeforeTax = qty * retailRate;
    return priceBeforeTax;
  }

  double calculateTotalTax(
      {required double retailRate,
      required double qty,
      required double taxPercentage}) {
    // Return 0 tax if tax is disabled
    if (!isTaxEnabled) return 0.0;

    double taxAmount = ((qty * retailRate) * taxPercentage) / 100;
    return taxAmount;
  }

  double calculateGross(
      {required double retailRate,
      required double qty,
      required double discount}) {
    double grossAmount = ((qty * retailRate) - discount);
    return grossAmount;
  }

  double calculateNetTotal({required double grossTotal, required double tax}) {
    // Include tax in net total only if tax is enabled
    return grossTotal + (isTaxEnabled ? tax : 0.0);
  }

  ItemEntity convertSoldItemToItem(SoldItemEntity soldItem) {
    return ItemEntity(
      itemIdpk: soldItem.itemIdpk,
      barcode: soldItem.barcode,
      itemCode: soldItem.itemCode,
      itemName: soldItem.itemName,
      description: soldItem.description,
      unit: soldItem.unit,
      cost: soldItem.cost?.toDouble(),
      retailRate: soldItem.sellingPrice?.toDouble(),
      taxPercentage: soldItem.taxPercentage?.toDouble(),
      currentStock: soldItem.currentStock?.toDouble(),
    );
  }

  ItemEntity convertPurchasedToItem(PurchasedItemEntity purchasedItem) {
    return ItemEntity(
      itemIdpk: purchasedItem.itemIdpk,
      barcode: purchasedItem.barcode,
      itemCode: purchasedItem.itemCode,
      itemName: purchasedItem.itemName,
      description: purchasedItem.description,
      unit: purchasedItem.unit,
      cost: purchasedItem.cost?.toDouble(),
      retailRate: purchasedItem.sellingPrice?.toDouble(),
      taxPercentage: purchasedItem.taxPercentage?.toDouble(),
      currentStock: purchasedItem.currentStock?.toDouble(),
    );
  }

  reinsertSalesForm(SalesInvoiceListEntity salesInvoice, WidgetRef ref) async {
    clearCart();
    setEditMode(true);
    List<CartEntity> updatedItemsList = [];
    ref.read(customerNotifierProvider.notifier).getCustomer();
    final customerList = ref.read(customerNotifierProvider).customerList;
    final selectedCustomer = customerList != null
        ? customerList.firstWhere((customer) =>
            customer.ledgerIdpk?.toLowerCase() ==
            salesInvoice.custemerIdfk?.toLowerCase())
        : CustomerEntity(
            ledgerName: salesInvoice.customerName,
            ledgerIdpk: salesInvoice.custemerIdfk);
    if (salesInvoice.customerName?.toLowerCase() != "cash") {
      final cashLedger = ref
          .read(cashLedgerNotifierProvider.notifier)
          .getLedgerById(salesInvoice.drLedgerIdfk ?? '');

      if (cashLedger != null) {
        setCashAccount(cashLedger);
      }
    }

    final salesLedger = ref
        .read(salesLedgerNotifierProvider.notifier)
        .getLedgerById(salesInvoice.crLedgerIdfk!);
    if (salesLedger != null) {
      setSalesAccount(salesLedger);
    }

    final soldBy = ref
        .read(salesManProvider.notifier)
        .getSalesManByName(salesInvoice.soldBy ?? "");
    if (soldBy != null) {
      setSoldBy(soldBy);
    }
    final updatedCustomerWithAddress = selectedCustomer.copyWith(
        billingAddress: salesInvoice.cashCustomerAddress,
        shippingAddress: salesInvoice.shippingAddress);
    setSalesIdpk(salesInvoice.saleIdpk ?? "");
    setCustomer(updatedCustomerWithAddress);
    setSalesNo(salesInvoice.saleNo?.toString() ?? "");
    setRefNo(salesInvoice.referenceNo ?? "");
    setSalesDate(salesInvoice.saleDate ?? DateTime.now());
    setSalesMode(salesInvoice.saleMode ?? "Cash");

    // adding items to cart.
    if (salesInvoice.soldItems?.isNotEmpty == true) {
      for (var index = 0; index < salesInvoice.soldItems!.length; index++) {
        final soldItem = salesInvoice.soldItems![index];
        final itemEntity = convertSoldItemToItem(soldItem);
        final priceBeforeTax = calculateBeforeTax(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: soldItem.actualQty?.toDouble() ?? 0.0);

        // Calculate tax based on tax setting
        final totalTax = isTaxEnabled
            ? calculateTotalTax(
                retailRate: itemEntity.retailRate ?? 0.0,
                qty: soldItem.actualQty?.toDouble() ?? 0.0,
                taxPercentage: itemEntity.taxPercentage ?? 0.0)
            : 0.0;

        final grossTotal = calculateGross(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: soldItem.actualQty?.toDouble() ?? 0.0,
            discount: soldItem.discount?.toDouble() ?? 0.0);

        final netTotal =
            calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

        final cartItem = CartEntity(
          cartItemId: (index + 1),
          item: itemEntity,
          qty: soldItem.actualQty?.toDouble() ?? 0.0,
          rate: itemEntity.retailRate ?? 0.0,
          cost: itemEntity.cost ?? 0.0,
          unit: itemEntity.unit ?? "",
          description: soldItem.description ?? "",
          discount: soldItem.discount?.toDouble() ?? 0.0,
          gross: grossTotal,
          tax: totalTax,
          priceBeforeTax: priceBeforeTax,
          netTotal: netTotal,
        );

        updatedItemsList.add(cartItem);
        getRateSplitUp(item: cartItem);

        itemsList = updatedItemsList;
      }
    }
    state = state.copyWith(
      itemList: itemsList,
      totalAmount: totalAmount,
      totalTax: totalTax,
      subtotal: subTotal,
      discount: discount,
      isTaxEnabled: isTaxEnabled,
    );
  }

  void getRateSplitUp({required CartEntity item, bool isInitial = false}) {
    if (isTaxEnabled) {
      totalTax += item.tax;
      totalAmount += (item.gross + item.tax);
    } else {
      totalAmount += item.gross;
    }

    subTotal += item.gross;

    if (!isInitial) {
      state = state.copyWith(
        totalAmount: totalAmount,
        subtotal: subTotal,
        totalTax: totalTax,
        isTaxEnabled: isTaxEnabled,
      );
    }
  }

  void _decreaseRateSplitUp({required CartEntity item}) {
    // Only subtract tax if tax is enabled
    if (isTaxEnabled) {
      totalTax -= item.tax;
      totalAmount -= (item.gross + item.tax);
    } else {
      totalAmount -= item.gross; // No tax included in total amount
    }

    subTotal -= item.gross;

    state = state.copyWith(
      totalAmount: totalAmount,
      totalTax: totalTax,
      subtotal: subTotal,
      isTaxEnabled: isTaxEnabled,
    );
  }

  void filterCartItems(String query) {
    if (query.isNotEmpty) {
      state = state.copyWith(
        itemList: itemsList
            .where((item) =>
                item.item.itemName!.toLowerCase().contains(query.toLowerCase()))
            .toList(),
        isTaxEnabled: isTaxEnabled,
      );
    } else {
      state = state.copyWith(
        itemList: itemsList,
        isTaxEnabled: isTaxEnabled,
      );
    }
  }

  updateState() {
    state = state.copyWith(
      itemList: itemsList,
      totalAmount: totalAmount,
      totalTax: totalTax,
      subtotal: subTotal,
      discount: discount,
      isTaxEnabled: isTaxEnabled,
    );
  }
}
