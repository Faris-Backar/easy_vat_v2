// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedgerRequestModelImpl _$$LedgerRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LedgerRequestModelImpl(
      ledgerIdpk: json['ledgerIdpk'] as String?,
      underIdfk: json['underIdfk'] as String?,
      ledgerName: json['ledgerName'] as String?,
      description: json['description'] as String?,
      taxPercentage: (json['taxPercentage'] as num?)?.toDouble(),
      mailingName: json['mailingName'] as String?,
      billingAddress: json['billingAddress'] as String?,
      countryIDFK: (json['countryIDFK'] as num?)?.toInt(),
      countryStatIDFK: (json['countryStatIDFK'] as num?)?.toInt(),
      taxRegistrationType: json['taxRegistrationType'] as String?,
      dateOfTaxRegistration: json['dateOfTaxRegistration'] == null
          ? null
          : DateTime.parse(json['dateOfTaxRegistration'] as String),
      taxRegistrationNo: json['taxRegistrationNo'] as String?,
      taxability: json['taxability'] as String?,
      mobile: json['mobile'] as String?,
      phone: json['phone'] as String?,
      isActive: json['isActive'] as bool?,
      openingBalance: (json['openingBalance'] as num?)?.toDouble(),
      openingBalanceType: json['openingBalanceType'] as String?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      currentBalanceType: json['currentBalanceType'] as String?,
      contactPerson: json['contactPerson'] as String?,
      creditDays: (json['creditDays'] as num?)?.toInt(),
      nature: json['nature'] as String?,
      creditLimit: (json['creditLimit'] as num?)?.toDouble(),
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      rowguid: json['rowguid'] as String?,
      companyIDPK: json['companyIDPK'] as String?,
      defaultPaymentMode: json['defaultPaymentMode'] as String?,
      ledgerCode: json['ledgerCode'] as String?,
      groupName: json['groupName'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      contactNo: json['contactNo'] as String?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      isEdit: json['isEdit'] as bool?,
    );

Map<String, dynamic> _$$LedgerRequestModelImplToJson(
        _$LedgerRequestModelImpl instance) =>
    <String, dynamic>{
      'ledgerIdpk': instance.ledgerIdpk,
      'underIdfk': instance.underIdfk,
      'ledgerName': instance.ledgerName,
      'description': instance.description,
      'taxPercentage': instance.taxPercentage,
      'mailingName': instance.mailingName,
      'billingAddress': instance.billingAddress,
      'countryIDFK': instance.countryIDFK,
      'countryStatIDFK': instance.countryStatIDFK,
      'taxRegistrationType': instance.taxRegistrationType,
      'dateOfTaxRegistration':
          instance.dateOfTaxRegistration?.toIso8601String(),
      'taxRegistrationNo': instance.taxRegistrationNo,
      'taxability': instance.taxability,
      'mobile': instance.mobile,
      'phone': instance.phone,
      'isActive': instance.isActive,
      'openingBalance': instance.openingBalance,
      'openingBalanceType': instance.openingBalanceType,
      'currentBalance': instance.currentBalance,
      'currentBalanceType': instance.currentBalanceType,
      'contactPerson': instance.contactPerson,
      'creditDays': instance.creditDays,
      'nature': instance.nature,
      'creditLimit': instance.creditLimit,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate?.toIso8601String(),
      'rowguid': instance.rowguid,
      'companyIDPK': instance.companyIDPK,
      'defaultPaymentMode': instance.defaultPaymentMode,
      'ledgerCode': instance.ledgerCode,
      'groupName': instance.groupName,
      'modifiedBy': instance.modifiedBy,
      'contactNo': instance.contactNo,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'isEdit': instance.isEdit,
    };
