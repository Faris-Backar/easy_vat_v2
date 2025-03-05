class CashLedgerEntity {
  String? ledgerIdpk;
  String? underIdfk;
  String? ledgerName;
  String? description;
  double? taxPercentage;
  String? mailingName;
  String? billingAddress;
  String? taxability;
  String? taxRegistrationNo;
  String? mobile;
  String? phone;
  bool? isActive;
  double? openingBalance;
  String? openingBalanceType;
  double? currentBalance;
  String? currentBalanceType;
  String? contactPerson;
  String? createdBy;
  DateTime? createdDate;
  String? rowguid;
  DateTime? modifiedDate;
  bool? isEdit;
  double? currentBalanceTran;
  CashLedgerEntity({
    this.ledgerIdpk,
    this.underIdfk,
    this.ledgerName,
    this.description,
    this.taxPercentage,
    this.mailingName,
    this.billingAddress,
    this.taxability,
    this.taxRegistrationNo,
    this.mobile,
    this.phone,
    this.isActive,
    this.openingBalance,
    this.openingBalanceType,
    this.currentBalance,
    this.currentBalanceType,
    this.contactPerson,
    this.createdBy,
    this.createdDate,
    this.rowguid,
    this.modifiedDate,
    this.isEdit,
    this.currentBalanceTran,
  });
}
