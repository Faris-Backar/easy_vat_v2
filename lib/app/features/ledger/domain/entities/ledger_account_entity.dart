class LedgerAccountEntity {
  String? ledgerIdpk;
  String? underIdfk;
  String? ledgerName;
  String? description;
  double? taxPercentage;
  String? mailingName;
  String? billingAddress;
  String? taxability;
  String? mobile;
  String? phone;
  bool? isActive;
  double? openingBalance;
  String? openingBalanceType;
  double? currentBalance;
  String? currentBalanceType;
  String? contactPerson;
  int? creditDays;
  double? creditLimit;
  String? createdBy;
  DateTime? createdDate;
  DateTime? modifiedDate;
  bool? isEdit;
  double? currentBalanceTran;

  LedgerAccountEntity({
    this.ledgerIdpk,
    this.underIdfk,
    this.ledgerName,
    this.description,
    this.taxPercentage,
    this.mailingName,
    this.billingAddress,
    this.taxability,
    this.mobile,
    this.phone,
    this.isActive,
    this.openingBalance,
    this.openingBalanceType,
    this.currentBalance,
    this.currentBalanceType,
    this.contactPerson,
    this.creditDays,
    this.creditLimit,
    this.createdBy,
    this.createdDate,
    this.modifiedDate,
    this.isEdit,
    this.currentBalanceTran,
  });
}
