abstract class SalesEntity {
  final bool? status;
  final String? message;
  final List<SalesListEntity>? salesList;

  const SalesEntity({
    this.status,
    this.message,
    this.salesList,
  });
}

abstract class SalesListEntity {
  final String? saleIdpk;
  final int? saleNo;
  final String? saleMode;
  final String? crLedgerIdfk;
  final String? drLedgerIdfk;
  final String? custemerIdfk;
  final String? creditAccount;
  final String? debitAccount;
  final String? referenceNo;
  final DateTime? saleDate;
  final String? cashTrn;
  final String? cashCustomerAddress;
  final String? shippingAddress;
  final String? customerName;
  final String? remarks;
  final String? lpoNo;
  final String? doNo;
  final String? diningArea;
  final String? diningTable;
  final String? quotationNo;
  final String? requestNo;
  final double? cashAmount;
  final double? creditCardAmount;
  final DateTime? actualSalesDate;
  final String? vehicleNo;
  final String? genaralNotes;
  final String? salesOrderNo;
  final String? soldBy;
  final double? grossAmount;
  final double? tax;
  final double? discount;
  final double? netTotal;
  final double? roundOff;
  final double? amountTendered;
  final String? deliveryBoy;
  final bool? isEditable;
  final bool? isCanceled;
  final bool? isLockVoucher;
  final String? createdBy;
  final DateTime? createdDate;
  final String? modifiedBy;
  final DateTime? modifiedDate;
  final String? rowguid;
  final bool? isPos;
  final String? deliveryBoyIdpk;
  final String? notesAndInstructions;
  final String? drLedgerCashAccount;
  final String? drLedgerBankAccount;
  final String? orderType;
  final int? deliveryCharge;
  final List<SoldItemEntity>? soldItems;

  const SalesListEntity({
    this.saleIdpk,
    this.saleNo,
    this.saleMode,
    this.crLedgerIdfk,
    this.drLedgerIdfk,
    this.custemerIdfk,
    this.creditAccount,
    this.debitAccount,
    this.referenceNo,
    this.saleDate,
    this.cashTrn,
    this.cashCustomerAddress,
    this.shippingAddress,
    this.customerName,
    this.remarks,
    this.lpoNo,
    this.doNo,
    this.diningArea,
    this.diningTable,
    this.quotationNo,
    this.requestNo,
    this.cashAmount,
    this.creditCardAmount,
    this.actualSalesDate,
    this.vehicleNo,
    this.genaralNotes,
    this.salesOrderNo,
    this.soldBy,
    this.grossAmount,
    this.tax,
    this.discount,
    this.netTotal,
    this.roundOff,
    this.amountTendered,
    this.deliveryBoy,
    this.isEditable,
    this.isCanceled,
    this.isLockVoucher,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.rowguid,
    this.isPos,
    this.deliveryBoyIdpk,
    this.notesAndInstructions,
    this.drLedgerCashAccount,
    this.drLedgerBankAccount,
    this.orderType,
    this.deliveryCharge,
    this.soldItems,
  });
}

abstract class SoldItemEntity {
  final String? saleIdpk;
  final String? itemIdpk;
  final String? barcode;
  final String? itemCode;
  final String? itemName;
  final String? description;
  final String? unit;
  final int? actualQty;
  final int? billedQty;
  final int? cost;
  final int? sellingPrice;
  final int? discount;
  final int? grossTotal;
  final int? taxAmount;
  final int? taxPercentage;
  final int? netTotal;
  final int? currentStock;
  final int? profit;
  final int? profitPercentage;
  final bool? isSent;
  final DateTime? expiryDate;
  final String? storeIdfk;
  final String? projectIdpk;
  final String? quotationIdpk;
  final String? salesOrderIdpk;
  final String? deliveryNoteIdpk;
  final String? importId;
  final String? rowguid;
  const SoldItemEntity({
    this.saleIdpk,
    this.itemIdpk,
    this.barcode,
    this.itemCode,
    this.itemName,
    this.description,
    this.unit,
    this.actualQty,
    this.billedQty,
    this.cost,
    this.sellingPrice,
    this.discount,
    this.grossTotal,
    this.taxAmount,
    this.taxPercentage,
    this.netTotal,
    this.currentStock,
    this.profit,
    this.profitPercentage,
    this.isSent,
    this.expiryDate,
    this.storeIdfk,
    this.projectIdpk,
    this.quotationIdpk,
    this.salesOrderIdpk,
    this.deliveryNoteIdpk,
    this.importId,
    this.rowguid,
  });
}
