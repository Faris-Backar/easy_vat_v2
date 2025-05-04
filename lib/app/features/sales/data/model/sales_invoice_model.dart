import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';

class SalesInvoiceModel extends SalesInvoiceEntity {
  final bool status;
  final String message;
  final List<SalesInvoiceListModel> salesInvoiceList;

  SalesInvoiceModel({
    required this.status,
    required this.message,
    required this.salesInvoiceList,
  });

  factory SalesInvoiceModel.fromJson(Map<String, dynamic> json) =>
      SalesInvoiceModel(
        status: json["status"],
        message: json["message"],
        salesInvoiceList: json["salesInvoiceList"] != null
            ? List<SalesInvoiceListModel>.from(json["salesInvoiceList"]
                .map((x) => SalesInvoiceListModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "salesInvoiceList":
            List<dynamic>.from(salesInvoiceList.map((x) => x.toJson())),
      };
}

class SalesInvoiceListModel extends SalesInvoiceListEntity {
  SalesInvoiceListModel({
    super.saleIdpk,
    super.saleNo,
    super.saleMode,
    super.crLedgerIdfk,
    super.drLedgerIdfk,
    super.custemerIdfk,
    super.creditAccount,
    super.debitAccount,
    super.referenceNo,
    super.saleDate,
    super.cashTrn,
    super.cashCustomerAddress,
    super.shippingAddress,
    super.customerName,
    super.remarks,
    super.lpoNo,
    super.doNo,
    super.diningArea,
    super.diningTable,
    super.quotationNo,
    super.requestNo,
    super.cashAmount,
    super.creditCardAmount,
    super.actualSalesDate,
    super.vehicleNo,
    super.genaralNotes,
    super.salesOrderNo,
    super.soldBy,
    super.grossAmount,
    super.tax,
    super.discount,
    super.netTotal,
    super.roundOff,
    super.amountTendered,
    super.deliveryBoy,
    super.isEditable,
    super.isCanceled,
    super.isLockVoucher,
    super.createdBy,
    super.createdDate,
    super.modifiedBy,
    super.modifiedDate,
    super.rowguid,
    super.isPos,
    super.deliveryBoyIdpk,
    super.notesAndInstructions,
    super.drLedgerCashAccount,
    super.drLedgerBankAccount,
    super.orderType,
    super.deliveryCharge,
    List<SoldItemModel>? soldItems,
  }) : super(soldItems: soldItems);

  factory SalesInvoiceListModel.fromJson(Map<String, dynamic> json) =>
      SalesInvoiceListModel(
        saleIdpk: json["saleIDPK"],
        saleNo: json["saleNo"],
        saleMode: json["saleMode"],
        crLedgerIdfk: json["crLedgerIDFK"],
        drLedgerIdfk: json["drLedgerIDFK"],
        custemerIdfk: json["custemerIDFK"],
        creditAccount: json["creditAccount"],
        debitAccount: json["debitAccount"],
        referenceNo: json["referenceNo"],
        saleDate:
            json["saleDate"] != null ? DateTime.parse(json["saleDate"]) : null,
        cashTrn: json["cashTRN"],
        cashCustomerAddress: json["cashCustomerAddress"],
        shippingAddress: json["shippingAddress"],
        customerName: json["customerName"],
        remarks: json["remarks"],
        lpoNo: json["lpoNo"],
        doNo: json["doNo"],
        diningArea: json["diningArea"],
        diningTable: json["diningTable"],
        quotationNo: json["quotationNo"],
        requestNo: json["requestNo"],
        cashAmount: json["cashAmount"],
        creditCardAmount: json["creditCardAmount"],
        actualSalesDate: json["actualSalesDate"] != null
            ? DateTime.parse(json["actualSalesDate"])
            : null,
        vehicleNo: json["vehicleNo"],
        genaralNotes: json["genaralNotes"],
        salesOrderNo: json["salesOrderNo"],
        soldBy: json["soldBy"],
        grossAmount: json["grossAmount"],
        tax: json["tax"],
        discount: json["discount"],
        netTotal: json["netTotal"],
        roundOff: json["roundOff"],
        amountTendered: json["amountTendered"],
        deliveryBoy: json["deliveryBoy"],
        isEditable: json["isEditable"],
        isCanceled: json["isCanceled"],
        isLockVoucher: json["isLockVoucher"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"] != null
            ? DateTime.parse(json["createdDate"])
            : null,
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"] != null
            ? DateTime.parse(json["modifiedDate"])
            : null,
        rowguid: json["rowguid"],
        isPos: json["isPOS"],
        deliveryBoyIdpk: json["deliveryBoyIDPK"],
        notesAndInstructions: json["notesAndInstructions"],
        drLedgerCashAccount: json["drLedgerCashAccount"],
        drLedgerBankAccount: json["drLedgerBankAccount"],
        orderType: json["orderType"],
        deliveryCharge: json["deliveryCharge"],
        soldItems: json["soldItems"] != null
            ? List<SoldItemModel>.from(
                json["soldItems"].map((x) => SoldItemModel.fromJson(x)))
            : null,
      );

  // Create model from entity
  factory SalesInvoiceListModel.fromEntity(SalesInvoiceListEntity entity) {
    return SalesInvoiceListModel(
      saleIdpk: entity.saleIdpk,
      saleNo: entity.saleNo,
      saleMode: entity.saleMode,
      crLedgerIdfk: entity.crLedgerIdfk,
      drLedgerIdfk: entity.drLedgerIdfk,
      custemerIdfk: entity.custemerIdfk,
      creditAccount: entity.creditAccount,
      debitAccount: entity.debitAccount,
      referenceNo: entity.referenceNo,
      saleDate: entity.saleDate,
      cashTrn: entity.cashTrn,
      cashCustomerAddress: entity.cashCustomerAddress,
      shippingAddress: entity.shippingAddress,
      customerName: entity.customerName,
      remarks: entity.remarks,
      lpoNo: entity.lpoNo,
      doNo: entity.doNo,
      diningArea: entity.diningArea,
      diningTable: entity.diningTable,
      quotationNo: entity.quotationNo,
      requestNo: entity.requestNo,
      cashAmount: entity.cashAmount,
      creditCardAmount: entity.creditCardAmount,
      actualSalesDate: entity.actualSalesDate,
      vehicleNo: entity.vehicleNo,
      genaralNotes: entity.genaralNotes,
      salesOrderNo: entity.salesOrderNo,
      soldBy: entity.soldBy,
      grossAmount: entity.grossAmount,
      tax: entity.tax,
      discount: entity.discount,
      netTotal: entity.netTotal,
      roundOff: entity.roundOff,
      amountTendered: entity.amountTendered,
      deliveryBoy: entity.deliveryBoy,
      isEditable: entity.isEditable,
      isCanceled: entity.isCanceled,
      isLockVoucher: entity.isLockVoucher,
      createdBy: entity.createdBy,
      createdDate: entity.createdDate,
      modifiedBy: entity.modifiedBy,
      modifiedDate: entity.modifiedDate,
      rowguid: entity.rowguid,
      isPos: entity.isPos,
      deliveryBoyIdpk: entity.deliveryBoyIdpk,
      notesAndInstructions: entity.notesAndInstructions,
      drLedgerCashAccount: entity.drLedgerCashAccount,
      drLedgerBankAccount: entity.drLedgerBankAccount,
      orderType: entity.orderType,
      deliveryCharge: entity.deliveryCharge,
      soldItems: entity.soldItems
          ?.map((item) =>
              item is SoldItemModel ? item : SoldItemModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "saleIDPK": saleIdpk,
        "saleNo": saleNo,
        "saleMode": saleMode,
        "crLedgerIDFK": crLedgerIdfk,
        "drLedgerIDFK": drLedgerIdfk,
        "custemerIDFK": custemerIdfk,
        "creditAccount": creditAccount,
        "debitAccount": debitAccount,
        "referenceNo": referenceNo,
        "saleDate": saleDate?.toIso8601String(),
        "cashTRN": cashTrn,
        "cashCustomerAddress": cashCustomerAddress,
        "shippingAddress": shippingAddress,
        "customerName": customerName,
        "remarks": remarks,
        "lpoNo": lpoNo,
        "doNo": doNo,
        "diningArea": diningArea,
        "diningTable": diningTable,
        "quotationNo": quotationNo,
        "requestNo": requestNo,
        "cashAmount": cashAmount,
        "creditCardAmount": creditCardAmount,
        "actualSalesDate": actualSalesDate?.toIso8601String(),
        "vehicleNo": vehicleNo,
        "genaralNotes": genaralNotes,
        "salesOrderNo": salesOrderNo,
        "soldBy": soldBy,
        "grossAmount": grossAmount,
        "tax": tax,
        "discount": discount,
        "netTotal": netTotal,
        "roundOff": roundOff,
        "amountTendered": amountTendered,
        "deliveryBoy": deliveryBoy,
        "isEditable": isEditable,
        "isCanceled": isCanceled,
        "isLockVoucher": isLockVoucher,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
        "isPOS": isPos,
        "deliveryBoyIDPK": deliveryBoyIdpk,
        "notesAndInstructions": notesAndInstructions,
        "drLedgerCashAccount": drLedgerCashAccount,
        "drLedgerBankAccount": drLedgerBankAccount,
        "orderType": orderType,
        "deliveryCharge": deliveryCharge,
        "soldItems": soldItems != null
            ? List<dynamic>.from(soldItems!
                .map((x) => x is SoldItemModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  // Helper methods for clean architecture
  List<SoldItemModel>? get modelSoldItems => soldItems
      ?.map((item) =>
          item is SoldItemModel ? item : SoldItemModel.fromEntity(item))
      .toList();
}

class SoldItemModel extends SoldItemEntity {
  SoldItemModel({
    super.saleIdpk,
    super.itemIdpk,
    super.barcode,
    super.itemCode,
    super.itemName,
    super.description,
    super.unit,
    super.actualQty,
    super.billedQty,
    super.cost,
    super.sellingPrice,
    super.discount,
    super.grossTotal,
    super.taxAmount,
    super.taxPercentage,
    super.netTotal,
    super.currentStock,
    super.profit,
    super.profitPercentage,
    super.isSent,
    super.expiryDate,
    super.storeIdfk,
    super.projectIdpk,
    super.quotationIdpk,
    super.salesOrderIdpk,
    super.deliveryNoteIdpk,
    super.importId,
    super.rowguid,
    List<SubItemModel>? subItems,
  }) : super(subItems: subItems);

  factory SoldItemModel.fromJson(Map<String, dynamic> json) => SoldItemModel(
        saleIdpk: json["saleIDPK"],
        itemIdpk: json["itemIDPK"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        description: json["description"],
        unit: json["unit"],
        actualQty: json["actualQty"],
        billedQty: json["billedQty"],
        cost: json["cost"],
        sellingPrice: json["sellingPrice"],
        discount: json["discount"],
        grossTotal: json["grossTotal"],
        taxAmount: json["taxAmount"],
        taxPercentage: json["taxPercentage"],
        netTotal: json["netTotal"],
        currentStock: json["currentStock"],
        profit: json["profit"],
        profitPercentage: json["profitPercentage"],
        isSent: json["isSent"],
        expiryDate: json["expiryDate"] != null
            ? DateTime.parse(json["expiryDate"])
            : null,
        storeIdfk: json["storeIDFK"],
        projectIdpk: json["projectIDPK"],
        quotationIdpk: json["quotationIDPK"],
        salesOrderIdpk: json["salesOrderIDPK"],
        deliveryNoteIdpk: json["deliveryNoteIDPK"],
        importId: json["importID"],
        rowguid: json["rowguid"],
        subItems: json["subItems"] != null
            ? List<SubItemModel>.from(
                json["subItems"].map((x) => SubItemModel.fromJson(x)))
            : null,
      );

  // Create model from entity
  factory SoldItemModel.fromEntity(SoldItemEntity entity) {
    return SoldItemModel(
      saleIdpk: entity.saleIdpk,
      itemIdpk: entity.itemIdpk,
      barcode: entity.barcode,
      itemCode: entity.itemCode,
      itemName: entity.itemName,
      description: entity.description,
      unit: entity.unit,
      actualQty: entity.actualQty,
      billedQty: entity.billedQty,
      cost: entity.cost,
      sellingPrice: entity.sellingPrice,
      discount: entity.discount,
      grossTotal: entity.grossTotal,
      taxAmount: entity.taxAmount,
      taxPercentage: entity.taxPercentage,
      netTotal: entity.netTotal,
      currentStock: entity.currentStock,
      profit: entity.profit,
      profitPercentage: entity.profitPercentage,
      isSent: entity.isSent,
      expiryDate: entity.expiryDate,
      storeIdfk: entity.storeIdfk,
      projectIdpk: entity.projectIdpk,
      quotationIdpk: entity.quotationIdpk,
      salesOrderIdpk: entity.salesOrderIdpk,
      deliveryNoteIdpk: entity.deliveryNoteIdpk,
      importId: entity.importId,
      rowguid: entity.rowguid,
      subItems: entity.subItems
          ?.map((item) =>
              item is SubItemModel ? item : SubItemModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "saleIDPK": saleIdpk,
        "itemIDPK": itemIdpk,
        "barcode": barcode,
        "itemCode": itemCode,
        "itemName": itemName,
        "description": description,
        "unit": unit,
        "actualQty": actualQty,
        "billedQty": billedQty,
        "cost": cost,
        "sellingPrice": sellingPrice,
        "discount": discount,
        "grossTotal": grossTotal,
        "taxAmount": taxAmount,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "currentStock": currentStock,
        "profit": profit,
        "profitPercentage": profitPercentage,
        "isSent": isSent,
        "expiryDate": expiryDate?.toIso8601String(),
        "storeIDFK": storeIdfk,
        "projectIDPK": projectIdpk,
        "quotationIDPK": quotationIdpk,
        "salesOrderIDPK": salesOrderIdpk,
        "deliveryNoteIDPK": deliveryNoteIdpk,
        "importID": importId,
        "rowguid": rowguid,
        "subItems": subItems != null
            ? List<dynamic>.from(subItems!
                .map((x) => x is SubItemModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  // Helper methods for clean architecture
  List<SubItemModel>? get modelSubItems => subItems
      ?.map(
          (item) => item is SubItemModel ? item : SubItemModel.fromEntity(item))
      .toList();
}

class SubItemModel extends SubItemEntity {
  SubItemModel({
    super.itemIdpk,
    super.barcode,
    super.itemCode,
    super.itemName,
    super.description,
    super.convention,
    super.unit,
    super.cost,
    super.retailRate,
    super.retailRateWithTax,
    super.retailPriceLock,
    super.wholeSaleRate,
    super.wholeSalePriceLock,
    super.taxPercentage,
    super.currentStock,
    super.itemNameArabic,
    super.accessLetter,
    super.supplierIdfk,
    super.isEditable,
  });

  factory SubItemModel.fromJson(Map<String, dynamic> json) => SubItemModel(
        itemIdpk: json["itemIDPK"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        description: json["description"],
        convention: json["convention"],
        unit: json["unit"],
        cost: json["cost"],
        retailRate: json["retailRate"],
        retailRateWithTax: json["retailRateWithTax"],
        retailPriceLock: json["retailPriceLock"],
        wholeSaleRate: json["wholeSaleRate"],
        wholeSalePriceLock: json["wholeSalePriceLock"],
        taxPercentage: json["taxPercentage"],
        currentStock: json["currentStock"],
        itemNameArabic: json["itemNameArabic"],
        accessLetter: json["accessLetter"],
        supplierIdfk: json["supplierIDFK"],
        isEditable: json["isEditable"],
      );

  // Create model from entity
  factory SubItemModel.fromEntity(SubItemEntity entity) {
    return SubItemModel(
      itemIdpk: entity.itemIdpk,
      barcode: entity.barcode,
      itemCode: entity.itemCode,
      itemName: entity.itemName,
      description: entity.description,
      convention: entity.convention,
      unit: entity.unit,
      cost: entity.cost,
      retailRate: entity.retailRate,
      retailRateWithTax: entity.retailRateWithTax,
      retailPriceLock: entity.retailPriceLock,
      wholeSaleRate: entity.wholeSaleRate,
      wholeSalePriceLock: entity.wholeSalePriceLock,
      taxPercentage: entity.taxPercentage,
      currentStock: entity.currentStock,
      itemNameArabic: entity.itemNameArabic,
      accessLetter: entity.accessLetter,
      supplierIdfk: entity.supplierIdfk,
      isEditable: entity.isEditable,
    );
  }

  Map<String, dynamic> toJson() => {
        "itemIDPK": itemIdpk,
        "barcode": barcode,
        "itemCode": itemCode,
        "itemName": itemName,
        "description": description,
        "convention": convention,
        "unit": unit,
        "cost": cost,
        "retailRate": retailRate,
        "retailRateWithTax": retailRateWithTax,
        "retailPriceLock": retailPriceLock,
        "wholeSaleRate": wholeSaleRate,
        "wholeSalePriceLock": wholeSalePriceLock,
        "taxPercentage": taxPercentage,
        "currentStock": currentStock,
        "itemNameArabic": itemNameArabic,
        "accessLetter": accessLetter,
        "supplierIDFK": supplierIdfk,
        "isEditable": isEditable,
      };
}
