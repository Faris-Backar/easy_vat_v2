abstract class SalesInvoiceEntity {
  final bool? status;
  final String? message;
  final List<SalesListEntity>? salesList;

  const SalesInvoiceEntity({
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
  final String? itemIdpk;
  final String? itemName;
  final int? sellingPrice;

  const SoldItemEntity({
    this.itemIdpk,
    this.itemName,
    this.sellingPrice,
  });
}
