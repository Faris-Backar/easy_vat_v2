import 'dart:convert';

import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  String? underIdfk;
  int? countryStatIdfk;
  String? taxability;
  String? taxRegistrationType;
  DateTime? dateOfTaxRegistration;
  String? rowguid;
  DateTime? modifiedDate;
  bool? isEdit;

  CustomerModel({
    super.ledgerIdpk,
    this.underIdfk,
    super.ledgerName,
    super.description,
    super.taxPercentage,
    super.mailingName,
    super.billingAddress,
    super.countryIdfk,
    this.countryStatIdfk,
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
    super.companyIdpk,
    super.defaultPaymentMode,
    super.groupName,
    super.nature,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        ledgerIdpk: json["ledgerIDPK"],
        underIdfk: json["underIDFK"],
        ledgerName: json["ledgerName"],
        description: json["description"],
        taxPercentage: json["taxPercentage"],
        mailingName: json["mailingName"],
        billingAddress: json["billingAddress"],
        countryIdfk: json["countryIDFK"],
        countryStatIdfk: json["countryStatIDFK"],
        taxability: json["taxability"],
        taxRegistrationType: json["taxRegistrationType"],
        dateOfTaxRegistration: DateTime.parse(json["dateOfTaxRegistration"]),
        taxRegistrationNo: json["taxRegistrationNo"],
        mobile: json["mobile"],
        phone: json["phone"],
        isActive: json["isActive"],
        openingBalance: json["openingBalance"],
        openingBalanceType: json["openingBalanceType"],
        currentBalance: json["currentBalance"],
        currentBalanceType: json["currentBalanceType"],
        contactPerson: json["contactPerson"],
        creditDays: json["creditDays"],
        creditLimit: json["creditLimit"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        rowguid: json["rowguid"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        isEdit: json["isEdit"],
        ledgerCode: json["ledgerCode"],
        modifiedBy: json["modifiedBy"],
        contactNo: json["contactNo"],
        companyIdpk: json["companyIDPK"],
        defaultPaymentMode: json["defaultPaymentMode"],
        groupName: json["groupName"],
        nature: json["nature"],
      );

  Map<String, dynamic> toJson() => {
        "ledgerIDPK": ledgerIdpk,
        "underIDFK": underIdfk,
        "ledgerName": ledgerName,
        "description": description,
        "taxPercentage": taxPercentage,
        "mailingName": mailingName,
        "billingAddress": billingAddress,
        "countryIDFK": countryIdfk,
        "countryStatIDFK": countryStatIdfk,
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
        "companyIDPK": companyIdpk,
        "defaultPaymentMode": defaultPaymentMode,
        "groupName": groupName,
        "nature": nature,
      };

  @override
  String toString() {
    return json.encode(toJson());
  }
}
