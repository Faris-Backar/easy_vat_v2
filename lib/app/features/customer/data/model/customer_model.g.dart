// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      ledgerIdpk: json['ledgerIdpk'] as String?,
      underIdfk: json['underIdfk'] as String?,
      ledgerName: json['ledgerName'] as String?,
      description: json['description'] as String?,
      taxPercentage: (json['taxPercentage'] as num?)?.toDouble(),
      mailingName: json['mailingName'] as String?,
      billingAddress: json['billingAddress'] as String?,
      countryIdfk: (json['countryIdfk'] as num?)?.toInt(),
      countryStatIdfk: (json['countryStatIdfk'] as num?)?.toInt(),
      taxability: json['taxability'] as String?,
      taxRegistrationType: json['taxRegistrationType'] as String?,
      dateOfTaxRegistration: json['dateOfTaxRegistration'] == null
          ? null
          : DateTime.parse(json['dateOfTaxRegistration'] as String),
      taxRegistrationNo: json['taxRegistrationNo'] as String?,
      mobile: json['mobile'] as String?,
      phone: json['phone'] as String?,
      isActive: json['isActive'] as bool?,
      openingBalance: (json['openingBalance'] as num?)?.toDouble(),
      openingBalanceType: json['openingBalanceType'] as String?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      currentBalanceType: json['currentBalanceType'] as String?,
      contactPerson: json['contactPerson'] as String?,
      creditDays: (json['creditDays'] as num?)?.toInt(),
      creditLimit: (json['creditLimit'] as num?)?.toDouble(),
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      rowguid: json['rowguid'] as String?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      isEdit: json['isEdit'] as bool?,
      ledgerCode: json['ledgerCode'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      contactNo: json['contactNo'] as String?,
      companyIdpk: json['companyIdpk'] as String?,
      defaultPaymentMode: json['defaultPaymentMode'] as String?,
      groupName: json['groupName'] as String?,
      nature: json['nature'] as String?,
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'ledgerIdpk': instance.ledgerIdpk,
      'underIdfk': instance.underIdfk,
      'ledgerName': instance.ledgerName,
      'description': instance.description,
      'taxPercentage': instance.taxPercentage,
      'mailingName': instance.mailingName,
      'billingAddress': instance.billingAddress,
      'countryIdfk': instance.countryIdfk,
      'countryStatIdfk': instance.countryStatIdfk,
      'taxability': instance.taxability,
      'taxRegistrationType': instance.taxRegistrationType,
      'dateOfTaxRegistration':
          instance.dateOfTaxRegistration?.toIso8601String(),
      'taxRegistrationNo': instance.taxRegistrationNo,
      'mobile': instance.mobile,
      'phone': instance.phone,
      'isActive': instance.isActive,
      'openingBalance': instance.openingBalance,
      'openingBalanceType': instance.openingBalanceType,
      'currentBalance': instance.currentBalance,
      'currentBalanceType': instance.currentBalanceType,
      'contactPerson': instance.contactPerson,
      'creditDays': instance.creditDays,
      'creditLimit': instance.creditLimit,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate?.toIso8601String(),
      'rowguid': instance.rowguid,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'isEdit': instance.isEdit,
      'ledgerCode': instance.ledgerCode,
      'modifiedBy': instance.modifiedBy,
      'contactNo': instance.contactNo,
      'companyIdpk': instance.companyIdpk,
      'defaultPaymentMode': instance.defaultPaymentMode,
      'groupName': instance.groupName,
      'nature': instance.nature,
    };
