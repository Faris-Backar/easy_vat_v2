// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncomeRequestModelImpl _$$IncomeRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IncomeRequestModelImpl(
      incomeIDPK: json['incomeIDPK'] as String?,
      incomeNo: (json['incomeNo'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      incomeDate: json['incomeDate'] == null
          ? null
          : DateTime.parse(json['incomeDate'] as String),
      paymentMode: json['paymentMode'] as String?,
      purchasedBy: json['purchasedBy'] as String?,
      customerIDFK: json['customerIDFK'] as String?,
      crLedgerIDFK: json['crLedgerIDFK'] as String?,
      drLedgerIDFK: json['drLedgerIDFK'] as String?,
      supplierInvoiceNo: json['supplierInvoiceNo'] as String?,
      grossTotal: (json['grossTotal'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      netTotal: (json['netTotal'] as num?)?.toDouble(),
      roundOff: (json['roundOff'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
      isEditable: json['isEditable'] as bool?,
      isCanceled: json['isCanceled'] as bool?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedBy: json['modifiedBy'] as String?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      rowguid: json['rowguid'] as String?,
      companyIDPK: json['companyIDPK'] as String?,
      customerName: json['customerName'] as String?,
      incomeDetails: (json['incomeDetails'] as List<dynamic>?)
          ?.map((e) => IncomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IncomeRequestModelImplToJson(
        _$IncomeRequestModelImpl instance) =>
    <String, dynamic>{
      'incomeIDPK': instance.incomeIDPK,
      'incomeNo': instance.incomeNo,
      'referenceNo': instance.referenceNo,
      'incomeDate': instance.incomeDate?.toIso8601String(),
      'paymentMode': instance.paymentMode,
      'purchasedBy': instance.purchasedBy,
      'customerIDFK': instance.customerIDFK,
      'crLedgerIDFK': instance.crLedgerIDFK,
      'drLedgerIDFK': instance.drLedgerIDFK,
      'supplierInvoiceNo': instance.supplierInvoiceNo,
      'grossTotal': instance.grossTotal,
      'discount': instance.discount,
      'tax': instance.tax,
      'netTotal': instance.netTotal,
      'roundOff': instance.roundOff,
      'remarks': instance.remarks,
      'isEditable': instance.isEditable,
      'isCanceled': instance.isCanceled,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'rowguid': instance.rowguid,
      'companyIDPK': instance.companyIDPK,
      'customerName': instance.customerName,
      'incomeDetails': instance.incomeDetails,
    };

_$IncomeDetailsImpl _$$IncomeDetailsImplFromJson(Map<String, dynamic> json) =>
    _$IncomeDetailsImpl(
      incomeIDPK: json['incomeIDPK'] as String?,
      ledgerIDPK: json['ledgerIDPK'] as String?,
      description: json['description'] as String?,
      grossTotal: (json['grossTotal'] as num?)?.toDouble(),
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      taxPercentage: (json['taxPercentage'] as num?)?.toDouble(),
      netTotal: (json['netTotal'] as num?)?.toDouble(),
      rowguid: json['rowguid'] as String?,
      companyIDPK: json['companyIDPK'] as String?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      ledgerName: json['ledgerName'] as String?,
    );

Map<String, dynamic> _$$IncomeDetailsImplToJson(_$IncomeDetailsImpl instance) =>
    <String, dynamic>{
      'incomeIDPK': instance.incomeIDPK,
      'ledgerIDPK': instance.ledgerIDPK,
      'description': instance.description,
      'grossTotal': instance.grossTotal,
      'taxAmount': instance.taxAmount,
      'taxPercentage': instance.taxPercentage,
      'netTotal': instance.netTotal,
      'rowguid': instance.rowguid,
      'companyIDPK': instance.companyIDPK,
      'currentBalance': instance.currentBalance,
      'ledgerName': instance.ledgerName,
    };
