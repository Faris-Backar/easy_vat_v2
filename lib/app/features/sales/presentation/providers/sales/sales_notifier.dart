import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_notifier.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_order_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_quotation_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_return_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_order_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_quotation_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_state.dart';
part 'sales_notifier.freezed.dart';

final salesProvider = StateNotifierProvider<SalesNotifier, SalesState>((ref) {
  return SalesNotifier();
});

class SalesNotifier extends StateNotifier<SalesState> {
  SalesNotifier() : super(SalesState.initial());

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
  String paymentMode = "";
  String salesNo = "";
  String quotationValidity = "";
  String quotationRequstNo = "";
  String vehicleNumber = "";
  String generalNo = "";
  String projectDescription = "";
  String termsAndCondition = "";
  String paymentTerms = "";
  String quotationNo = "";
  String deliveryMethod = "";
  String projectSite = "";
  String lpoNo = "";

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

  setPaymentMode(String paymentMode) {
    this.paymentMode = paymentMode;
    state = state.copyWith(paymentMode: paymentMode);
  }

  setQuotationValidity(String quotationValidity) {
    this.quotationValidity = quotationValidity;
    state = state.copyWith(quotationValidity: quotationValidity);
  }

  setGeneralNo(String generalNo) {
    this.generalNo = generalNo;
    state = state.copyWith(generalNo: generalNo);
  }

  setVehicleNumber(String vehicleNo) {
    vehicleNumber = vehicleNo;
    state = state.copyWith(vehicleNo: vehicleNumber);
  }

  setQuotationRequstNo(String quotationRequstNo) {
    this.quotationRequstNo = quotationRequstNo;
    state = state.copyWith(quotationRequstNo: quotationRequstNo);
  }

  setProjectDescription(String projectDescription) {
    this.projectDescription = projectDescription;
    state = state.copyWith(projectDescription: projectDescription);
  }

  setTermsAndCondition(String termsAndCondition) {
    this.termsAndCondition = termsAndCondition;
    state = state.copyWith(termsAndCondition: termsAndCondition);
  }

  setPaymentTerms(String paymentTerms) {
    this.paymentTerms = paymentTerms;
    state = state.copyWith(paymentTerms: paymentTerms);
  }

  setDeliveryMethod(String deliveryMethod) {
    this.deliveryMethod = deliveryMethod;
    state = state.copyWith(deliveryMethod: deliveryMethod);
  }

  setProjectSite(String projectSite) {
    this.projectSite = projectSite;
    state = state.copyWith(projectSite: projectSite);
  }

  setLpoNo(String lpoNo) {
    this.lpoNo = lpoNo;
    state = state.copyWith(lpoNo: lpoNo);
  }

  setQuotationNo(String quotationNo) {
    this.quotationNo = quotationNo;
    state = state.copyWith(quotationNo: quotationNo);
  }

  clear() async {
    salesDate = DateTime.now();
    refNo = "";
    cashAccount = null;
    salesAccount = null;
    notes = "";
    salesMode = "";
    soldBy = null;
    selectedCustomer = CustomerEntity(ledgerName: "Cash", isActive: true);
    totalItemGrossAmont = 0.0;
    shippingAddress = "";
    isForEdit = false;
    isTaxEnabled = true;
    salesIdpk = PrefResources.emptyGuid;
    paymentMode = "";
    salesNo = "";
    quotationValidity = "";
    state = SalesState.initial();
  }

  Future<SalesRequestModel> createNewSale(WidgetRef ref) async {
    double itemTotalTax = 0.0;
    double netTotal = 0.0;
    final List<SoldItem> items = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final cartPrvd = ref.read(cartProvider.notifier);
    final itemsList = cartPrvd.itemsList;

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
      discount: cartPrvd.discount,
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
      cashAmount: salesAccount?.ledgerName?.toLowerCase() == "cash"
          ? cartPrvd.totalAmount
          : 0.0,
      creditAccount: "",
      creditCardAmount: salesAccount?.ledgerName?.toLowerCase() != "cash"
          ? cartPrvd.totalAmount
          : 0.0,
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
      roundOff: cartPrvd.roundOf,
      saleDate: DateTime.now(),
    );
    return newSale;
  }

  reinsertSalesForm(SalesInvoiceListEntity salesInvoice, WidgetRef ref) async {
    final cartPrvd = ref.read(cartProvider.notifier);
    cartPrvd.clearCart();
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
        final itemEntity = cartPrvd.convertSoldItemToItem(soldItem);
        final priceBeforeTax = cartPrvd.calculateBeforeTax(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: soldItem.actualQty?.toDouble() ?? 0.0);

        // Calculate tax based on tax setting
        final totalTax = isTaxEnabled
            ? cartPrvd.calculateTotalTax(
                retailRate: itemEntity.retailRate ?? 0.0,
                qty: soldItem.actualQty?.toDouble() ?? 0.0,
                taxPercentage: itemEntity.taxPercentage ?? 0.0)
            : 0.0;

        final grossTotal = cartPrvd.calculateGross(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: soldItem.actualQty?.toDouble() ?? 0.0,
            discount: soldItem.discount?.toDouble() ?? 0.0);

        final netTotal =
            cartPrvd.calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

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
        cartPrvd.getRateSplitUp(item: cartItem);

        cartPrvd.itemsList = updatedItemsList;
      }
    }
    cartPrvd.updateState();
  }

  reinsertSalesReturnForm(SalesReturnEntity salesReturn, WidgetRef ref) async {
    final cartPrvd = ref.read(cartProvider.notifier);
    cartPrvd.clearCart();
    setEditMode(true);
    List<CartEntity> updatedItemsList = [];
    ref.read(customerNotifierProvider.notifier).getCustomer();
    final customerList = ref.read(customerNotifierProvider).customerList;
    final selectedCustomer = customerList != null
        ? customerList.firstWhere((customer) =>
            customer.ledgerIdpk?.toLowerCase() ==
            salesReturn.customerIdfk?.toLowerCase())
        : CustomerEntity(
            ledgerName: salesReturn.customerName,
            ledgerIdpk: salesReturn.customerIdfk);
    if (salesReturn.customerName?.toLowerCase() != "cash") {
      final cashLedger = ref
          .read(cashLedgerNotifierProvider.notifier)
          .getLedgerById(salesReturn.drLedgerIdfk ?? '');

      if (cashLedger != null) {
        setCashAccount(cashLedger);
      }
    }

    final salesLedger = ref
        .read(salesLedgerNotifierProvider.notifier)
        .getLedgerById(salesReturn.crLedgerIdfk!);
    if (salesLedger != null) {
      setSalesAccount(salesLedger);
    }

    // final soldBy = ref
    //     .read(salesManProvider.notifier)
    //     .getSalesManByName(salesReturn.retu ?? "");
    // if (soldBy != null) {
    //   setSoldBy(soldBy);
    // }
    // final updatedCustomerWithAddress = selectedCustomer.copyWith(
    //     billingAddress: salesReturn.cashCustomerAddress,
    //     shippingAddress: salesReturn.shippingAddress);
    setSalesIdpk(salesReturn.salesReturnIdpk ?? "");
    setCustomer(selectedCustomer);
    setSalesNo(salesReturn.saleNo?.toString() ?? "");
    setRefNo(salesReturn.referenceNo ?? "");
    setSalesDate(salesReturn.returnDate ?? DateTime.now());
    setSalesMode(salesReturn.salesReturnMode ?? "Cash");

    // adding items to cart.
    if (salesReturn.returnedItems?.isNotEmpty == true) {
      for (var index = 0; index < salesReturn.returnedItems!.length; index++) {
        final soldItem = salesReturn.returnedItems![index];
        final itemEntity = convertReturnedItemToItem(soldItem);
        final priceBeforeTax = cartPrvd.calculateBeforeTax(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: soldItem.actualQty?.toDouble() ?? 0.0);

        // Calculate tax based on tax setting
        final totalTax = isTaxEnabled
            ? cartPrvd.calculateTotalTax(
                retailRate: itemEntity.retailRate ?? 0.0,
                qty: soldItem.actualQty?.toDouble() ?? 0.0,
                taxPercentage: itemEntity.taxPercentage ?? 0.0)
            : 0.0;

        final grossTotal = cartPrvd.calculateGross(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: soldItem.actualQty?.toDouble() ?? 0.0,
            discount: soldItem.discount?.toDouble() ?? 0.0);

        final netTotal =
            cartPrvd.calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

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
        cartPrvd.getRateSplitUp(item: cartItem);

        cartPrvd.itemsList = updatedItemsList;
      }
    }
    cartPrvd.updateState();
  }

  Future<SalesOrderModel> createNewSaleOrder(WidgetRef ref) async {
    double itemTotalTax = 0.0;
    double netTotal = 0.0;
    final List<SalesOrderDetailModel> items = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final cartPrvd = ref.read(cartProvider.notifier);
    final itemsList = cartPrvd.itemsList;

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
        salesOrderIdpk: salesIdpk,
        importId: PrefResources.emptyGuid,
        quotationIdpk: salesIdpk,
        itemIdpk: itemsList[i].item.itemIdpk ?? "",
        barcode: itemsList[i].item.barcode ?? "",
        itemCode: itemsList[i].item.itemCode ?? "",
        itemName: itemsList[i].item.itemName ?? "",
        description: itemsList[i].item.description ?? "",
        unit: itemsList[i].unit,
        quantity: itemsList[i].qty,
        cost: itemsList[i].cost,
        sellingPrice: itemsList[i].rate,
        grossAmount: grossTotal,
        taxAmount: taxAmount,
        projectIdpk: PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
        companyIdpk: userDetailsFromPrefs?.companyInfo?.companyIdpk ??
            PrefResources.emptyGuid,
        taxPercentage:
            isTaxEnabled ? (itemsList[i].item.taxPercentage ?? 0.0) : 0.0,
        netTotal: grossTotal + (isTaxEnabled ? taxAmount : 0.0),
        suppliersIdpk: userDetailsFromPrefs?.storeDetails?.storeIdpk ??
            PrefResources.emptyGuid,
        subItem: [],
      );
      items.add(item);
    }

    final newSale = SalesOrderModel(
        salesOrderIdpk: salesIdpk,
        createdDate: salesDate,
        createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
        dsicount: cartPrvd.discount,
        grossTotal: totalItemGrossAmont,
        referenceNo: refNo,
        projectIdpk: PrefResources.emptyGuid,
        remarks: notes,
        tax: isTaxEnabled ? itemTotalTax : 0.0,
        companyIdpk: userDetailsFromPrefs?.companyInfo?.companyIdpk ??
            PrefResources.emptyGuid,
        customerIdpk: selectedCustomer?.ledgerIdpk ?? PrefResources.emptyGuid,
        requestNo: quotationRequstNo,
        vehicleNo: vehicleNumber,
        quotationNo: salesNo.isNotEmpty ? salesNo : "0",
        salesmanIdpk: soldBy?.userIdpk ?? PrefResources.emptyGuid,
        modifiedDate: DateTime.now(),
        deliveryTerms: termsAndCondition,
        deliveryMethod: deliveryMethod,
        destination: shippingAddress,
        generalNote: generalNo,
        invoiceAddress: selectedCustomer?.billingAddress ?? "",
        isCanceled: false,
        isEditable: true,
        lpoNo: lpoNo,
        netTotal: netTotal,
        salesOrderDate: salesDate,
        salesOrderDetailsModel: items,
        salesOrderNo: salesNo.isNotEmpty ? int.parse(salesNo) : 0,
        shippingAddress: selectedCustomer?.shippingAddress ?? "",
        paymentTerms: paymentTerms);
    return newSale;
  }

  reinsertSalesOrderForm(SalesOrderEntity salesOrder, WidgetRef ref) async {
    final cartPrvd = ref.read(cartProvider.notifier);
    cartPrvd.clearCart();
    setEditMode(true);
    cartPrvd.setEditMode(true);
    List<CartEntity> updatedItemsList = [];
    ref.read(customerNotifierProvider.notifier).getCustomer();
    final customerList = ref.read(customerNotifierProvider).customerList;
    final selectedCustomer = customerList != null
        ? customerList.firstWhere((customer) =>
            customer.ledgerIdpk?.toLowerCase() ==
            salesOrder.customerIdpk?.toLowerCase())
        : CustomerEntity(
            ledgerName: "Cash", ledgerIdpk: salesOrder.customerIdpk);
    final updatedCustomerWithAddress = selectedCustomer.copyWith(
        billingAddress: salesOrder.invoiceAddress,
        shippingAddress: salesOrder.shippingAddress);
    setSalesIdpk(salesOrder.salesOrderIdpk ?? "");
    setCustomer(updatedCustomerWithAddress);
    setSalesNo(salesOrder.salesOrderNo?.toString() ?? "");
    setRefNo(salesOrder.referenceNo ?? "");
    setSalesDate(salesOrder.salesOrderDate ?? DateTime.now());
    setDeliveryMethod(deliveryMethod);
    setQuotationRequstNo(quotationRequstNo);
    setQuotationNo(quotationNo);
    setShippingAddress(shippingAddress);
    setGeneralNo(generalNo);
    setProjectSite(projectDescription);
    setLpoNo(lpoNo);
    setVehicleNumber(vehicleNumber);

    // adding items to cart.
    if (salesOrder.salesOrderDetails?.isNotEmpty == true) {
      for (var index = 0;
          index < salesOrder.salesOrderDetails!.length;
          index++) {
        final orderItems = salesOrder.salesOrderDetails![index];
        final itemEntity = convertOrderItemToItem(orderItems);
        final priceBeforeTax = cartPrvd.calculateBeforeTax(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: orderItems.quantity?.toDouble() ?? 0.0);

        // Calculate tax based on tax setting
        final totalTax = isTaxEnabled
            ? cartPrvd.calculateTotalTax(
                retailRate: itemEntity.retailRate ?? 0.0,
                qty: orderItems.quantity?.toDouble() ?? 0.0,
                taxPercentage: itemEntity.taxPercentage ?? 0.0)
            : 0.0;

        final grossTotal = cartPrvd.calculateGross(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: orderItems.quantity?.toDouble() ?? 0.0,
            discount: 0.0);

        final netTotal =
            cartPrvd.calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

        final cartItem = CartEntity(
          cartItemId: (index + 1),
          item: itemEntity,
          qty: orderItems.quantity?.toDouble() ?? 0.0,
          rate: itemEntity.retailRate ?? 0.0,
          cost: itemEntity.cost ?? 0.0,
          unit: itemEntity.unit ?? "",
          description: orderItems.description ?? "",
          discount: 0.0,
          gross: grossTotal,
          tax: totalTax,
          priceBeforeTax: priceBeforeTax,
          netTotal: netTotal,
        );

        updatedItemsList.add(cartItem);
        cartPrvd.getRateSplitUp(item: cartItem);

        cartPrvd.itemsList = updatedItemsList;
      }
    }
    cartPrvd.updateState();
  }

  ItemEntity convertOrderItemToItem(SalesOrderDetailEntity orderItem) {
    return ItemEntity(
      itemIdpk: orderItem.itemIdpk,
      barcode: orderItem.barcode,
      itemCode: orderItem.itemCode,
      itemName: orderItem.itemName,
      description: orderItem.description,
      unit: orderItem.unit,
      cost: orderItem.cost?.toDouble(),
      retailRate: orderItem.sellingPrice?.toDouble(),
      taxPercentage: orderItem.taxPercentage?.toDouble(),
    );
  }

  Future<SalesReturnModel> createNewSaleReturn(WidgetRef ref) async {
    double itemTotalTax = 0.0;
    double netTotal = 0.0;
    final List<ReturnedItemModel> items = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final cartPrvd = ref.read(cartProvider.notifier);
    final itemsList = cartPrvd.itemsList;

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
        salesReturnIdpk: salesIdpk,
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
        storeIdfk: userDetailsFromPrefs?.storeDetails?.storeIdpk ??
            PrefResources.emptyGuid,
        subItems: [],
      );
      items.add(item);
    }

    final newSale = SalesReturnModel(
        salesReturnIdpk: salesIdpk,
        returnDate: salesDate,
        createdDate: salesDate,
        createdById: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedById: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
        discount: cartPrvd.discount,
        grossAmount: totalItemGrossAmont,
        netTotal: netTotal,
        referenceNo: refNo,
        returnedItems: items,
        remarks: notes,
        salesReturnMode: salesMode,
        tax: isTaxEnabled ? itemTotalTax : 0.0,
        authorizedById: soldBy?.userIdpk,
        crLedgerIdfk: salesAccount?.ledgerIdpk ?? PrefResources.emptyGuid,
        drLedgerIdfk: selectedCustomer?.ledgerIdpk ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        customerName: selectedCustomer?.ledgerName ?? "cash",
        customerIdfk: selectedCustomer?.ledgerIdpk ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        isEditable: true,
        saleNo: 0,
        modifiedDate: DateTime.now(),
        roundOff: cartPrvd.roundOf,
        saleIdfk: PrefResources.emptyGuid,
        salesReturnNo: 0);
    return newSale;
  }

  ItemEntity convertReturnedItemToItem(ReturnedItemEntity returnedItem) {
    return ItemEntity(
      itemIdpk: returnedItem.itemIdpk,
      barcode: returnedItem.barcode,
      itemCode: returnedItem.itemCode,
      itemName: returnedItem.itemName,
      description: returnedItem.description,
      unit: returnedItem.unit,
      cost: returnedItem.cost?.toDouble(),
      retailRate: returnedItem.sellingPrice?.toDouble(),
      taxPercentage: returnedItem.taxPercentage?.toDouble(),
    );
  }

  Future<SalesQuotationModel> createNewSaleQuotation(WidgetRef ref) async {
    double itemTotalTax = 0.0;
    double netTotal = 0.0;
    final List<QuotationDetailModel> items = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    final cartPrvd = ref.read(cartProvider.notifier);
    final itemsList = cartPrvd.itemsList;

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

      final item = QuotationDetailModel(
        quotationIdpk: salesIdpk,
        itemIdpk: itemsList[i].item.itemIdpk ?? "",
        barcode: itemsList[i].item.barcode ?? "",
        itemCode: itemsList[i].item.itemCode ?? "",
        itemName: itemsList[i].item.itemName ?? "",
        description: itemsList[i].item.description ?? "",
        unit: itemsList[i].unit,
        quantity: itemsList[i].qty,
        cost: itemsList[i].cost,
        sellingPrice: itemsList[i].rate,
        grossTotal: grossTotal,
        taxAmount: taxAmount,
        profitAmount: 0.0,
        profitPercentage: 0.0,
        projectIdpk: PrefResources.emptyGuid,
        lpoIdpk: PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
        companyIdpk: userDetailsFromPrefs?.companyInfo?.companyIdpk ??
            PrefResources.emptyGuid,
        totalCost: itemsList[i].cost,
        taxPercentage:
            isTaxEnabled ? (itemsList[i].item.taxPercentage ?? 0.0) : 0.0,
        netTotal: grossTotal + (isTaxEnabled ? taxAmount : 0.0),
        suppliersIdpk: userDetailsFromPrefs?.storeDetails?.storeIdpk ??
            PrefResources.emptyGuid,
        subItem: [],
      );
      items.add(item);
    }

    final newSale = SalesQuotationModel(
        quotationIdpk: salesIdpk,
        quotationDate: salesDate,
        createdDate: salesDate,
        createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
        dsicount: cartPrvd.discount,
        grossTotal: totalItemGrossAmont,
        grandTotal: netTotal,
        referenceNo: refNo,
        projectIdpk: PrefResources.emptyGuid,
        quotationDetailModel: items,
        projectDescription: projectDescription,
        remarks: notes,
        tax: isTaxEnabled ? itemTotalTax : 0.0,
        companyIdpk: userDetailsFromPrefs?.companyInfo?.companyIdpk ??
            PrefResources.emptyGuid,
        customerIdpk: selectedCustomer?.ledgerIdpk ?? PrefResources.emptyGuid,
        genaralNote: generalNo,
        requestNo: quotationRequstNo,
        vehicleNo: vehicleNumber,
        quotationNo: salesNo.isNotEmpty ? int.parse(salesNo) : 0,
        salesmanIdpk: soldBy?.userIdpk ?? PrefResources.emptyGuid,
        modifiedDate: DateTime.now(),
        quotationValidity: quotationValidity,
        deliveryTerms: termsAndCondition,
        quotationSubject: quotationValidity,
        paymentTerms: paymentTerms);
    return newSale;
  }

  ItemEntity convertQuotationItemToItem(QuotationDetailEntity quotationedItem) {
    return ItemEntity(
      itemIdpk: quotationedItem.itemIdpk,
      barcode: quotationedItem.barcode,
      itemCode: quotationedItem.itemCode,
      itemName: quotationedItem.itemName,
      description: quotationedItem.description,
      unit: quotationedItem.unit,
      cost: quotationedItem.cost?.toDouble(),
      retailRate: quotationedItem.sellingPrice?.toDouble(),
      taxPercentage: quotationedItem.taxPercentage?.toDouble(),
    );
  }

  reinsertSalesQuotationForm(
      SalesQuotationEntity salesQuotation, WidgetRef ref) async {
    final cartPrvd = ref.read(cartProvider.notifier);
    cartPrvd.clearCart();
    cartPrvd.setEditMode(true);
    setEditMode(true);
    List<CartEntity> updatedItemsList = [];
    ref.read(customerNotifierProvider.notifier).getCustomer();
    final customerList = ref.read(customerNotifierProvider).customerList;
    final selectedCustomer = customerList != null
        ? customerList.firstWhere((customer) =>
            customer.ledgerIdpk?.toLowerCase() ==
            salesQuotation.customerIdpk?.toLowerCase())
        : CustomerEntity(
            ledgerName: salesQuotation.customerName,
            ledgerIdpk: salesQuotation.customerIdpk);
    setSalesIdpk(salesQuotation.quotationIdpk ?? "");
    setCustomer(selectedCustomer);
    setSalesNo(salesQuotation.quotationNo?.toString() ?? "");
    setRefNo(salesQuotation.referenceNo ?? "");
    setSalesDate(salesQuotation.quotationDate ?? DateTime.now());
    setQuotationRequstNo(salesQuotation.requestNo ?? "");
    setGeneralNo(salesQuotation.genaralNote ?? "");
    setVehicleNumber(salesQuotation.vehicleNo ?? "");
    setQuotationValidity(salesQuotation.quotationValidity ?? "");
    setProjectDescription(salesQuotation.projectDescription ?? "");
    setTermsAndCondition(salesQuotation.deliveryTerms ?? "");
    setPaymentTerms(salesQuotation.paymentTerms ?? "");

    // adding items to cart.
    if (salesQuotation.quotationDetails?.isNotEmpty == true) {
      for (var index = 0;
          index < salesQuotation.quotationDetails!.length;
          index++) {
        final soldItem = salesQuotation.quotationDetails![index];
        final itemEntity = convertQuotationItemToItem(soldItem);
        final priceBeforeTax = cartPrvd.calculateBeforeTax(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: soldItem.quantity?.toDouble() ?? 0.0);

        // Calculate tax based on tax setting
        final totalTax = isTaxEnabled
            ? cartPrvd.calculateTotalTax(
                retailRate: itemEntity.retailRate ?? 0.0,
                qty: soldItem.quantity?.toDouble() ?? 0.0,
                taxPercentage: itemEntity.taxPercentage ?? 0.0)
            : 0.0;

        final grossTotal = cartPrvd.calculateGross(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: soldItem.quantity?.toDouble() ?? 0.0,
            discount: 0.0);

        final netTotal =
            cartPrvd.calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

        final cartItem = CartEntity(
          cartItemId: (index + 1),
          item: itemEntity,
          qty: soldItem.quantity?.toDouble() ?? 0.0,
          rate: itemEntity.retailRate ?? 0.0,
          cost: itemEntity.cost ?? 0.0,
          unit: itemEntity.unit ?? "",
          description: soldItem.description ?? "",
          discount: 0.0,
          gross: grossTotal,
          tax: totalTax,
          priceBeforeTax: priceBeforeTax,
          netTotal: netTotal,
        );

        updatedItemsList.add(cartItem);
        cartPrvd.getRateSplitUp(item: cartItem);
        cartPrvd.itemsList = updatedItemsList;
      }
    }
    cartPrvd.updateState();
  }
}
