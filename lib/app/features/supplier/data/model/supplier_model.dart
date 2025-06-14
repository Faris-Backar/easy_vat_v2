import 'dart:convert';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';

class SupplierModel extends SupplierEntity {
  String? underIDFK;
  int? countryStatIDFK;
  String? taxability;
  String? taxRegistrationType;
  DateTime? dateOfTaxRegistration;
  String? rowguid;
  DateTime? modifiedDate;
  bool? isEdit;

  SupplierModel(
      {super.ledgerIDPK,
      this.underIDFK,
      super.ledgerName,
      super.description,
      super.taxPercentage,
      super.mailingName,
      super.billingAddress,
      super.countryIDFK,
      this.countryStatIDFK,
      this.taxability,
      this.taxRegistrationType,
      this.dateOfTaxRegistration,
      super.taxRegistrationNo,
      super.mobile,
      super.phone,
      super.isActive,
      super.openingBalance,
      super.openingBalanceType,
      super.currentBalance,
      super.currentBalanceType,
      super.contactPerson,
      super.creditDays,
      super.creditLimit,
      super.createdBy,
      super.createdDate,
      this.rowguid,
      this.modifiedDate,
      this.isEdit,
      super.ledgerCode,
      super.modifiedBy,
      super.contactNo,
      super.companyIDPK,
      super.defaultPaymentMode,
      super.groupName,
      super.nature});

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
        ledgerIDPK: json['ledgerIDPK'],
        underIDFK: json['underIDFK'],
        ledgerName: json['ledgerName'],
        description: json['description'],
        taxPercentage: json['taxPercentage'],
        mailingName: json['mailingName'],
        billingAddress: json['billingAddress'],
        countryIDFK: json['countryIDFK'],
        countryStatIDFK: json['countryStatIDFK'],
        taxability: json['taxability'],
        taxRegistrationType: json['taxRegistrationType'],
        dateOfTaxRegistration: DateTime.parse(json['dateOfTaxRegistration']),
        taxRegistrationNo: json['taxRegistrationNo'],
        mobile: json['mobile'],
        phone: json['phone'],
        isActive: json['isActive'],
        openingBalance: json['openingBalance'],
        openingBalanceType: json['openingBalanceType'],
        currentBalance: json['currentBalance'],
        currentBalanceType: json['currentBalanceType'],
        contactPerson: json['contactPerson'],
        creditDays: json['creditDays'],
        creditLimit: json['creditLimit'],
        createdBy: json['createdBy'],
        createdDate: DateTime.parse(json['createdDate']),
        rowguid: json['rowguid'],
        modifiedDate: DateTime.parse(json['modifiedDate']),
        isEdit: json['isEdit'],
        ledgerCode: json['ledgerCode'],
        modifiedBy: json['modifiedBy'],
        contactNo: json['contactNo'],
        companyIDPK: json['companyIDPK'],
        defaultPaymentMode: json['defaultPaymentMode'],
        groupName: json['groupName'],
        nature: json['nature'],
      );

  Map<String, dynamic> toJson() => {
        "ledgerIDPK": ledgerIDPK,
        "underIDFK": underIDFK,
        "ledgerName": ledgerName,
        "description": description,
        "taxPercentage": taxPercentage,
        "mailingName": mailingName,
        "billingAddress": billingAddress,
        "countryIDFK": countryIDFK,
        "countryStatIDFK": countryStatIDFK,
        "taxability": taxability,
        "taxRegistrationType": taxRegistrationType,
        "dateOfTaxRegistration": dateOfTaxRegistration?.toIso8601String(),
        "taxRegistrationNo": taxRegistrationNo,
        "mobile": mobile,
        "phone": phone,
        "isActive": isActive,
        "openingBalance": openingBalance,
        "openingBalanceType": openingBalanceType,
        "currentBalance": currentBalance,
        "currentBalanceType": currentBalanceType,
        "contactPerson": contactPerson,
        "creditDays": creditDays,
        "creditLimit": creditLimit,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "rowguid": rowguid,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "isEdit": isEdit,
        "ledgerCode": ledgerCode,
        "modifiedBy": modifiedBy,
        "contactNo": contactNo,
        "companyIDPK": companyIDPK,
        "defaultPaymentMode": defaultPaymentMode,
        "groupName": groupName,
        "nature": nature
      };

  @override
  String toString() {
    return json.encode(toJson());
  }
}
