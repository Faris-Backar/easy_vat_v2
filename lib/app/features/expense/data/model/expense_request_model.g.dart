// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseRequestModelImpl _$$ExpenseRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseRequestModelImpl(
      expenseIDPK: json['expenseIDPK'] as String?,
      expenseNo: (json['expenseNo'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      expenseDate: json['expenseDate'] == null
          ? null
          : DateTime.parse(json['expenseDate'] as String),
      paymentMode: json['paymentMode'] as String?,
      purchasedBy: json['purchasedBy'] as String?,
      supplierIDFK: json['supplierIDFK'] as String?,
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
      supplierName: json['supplierName'] as String?,
      expenseDetails: (json['expenseDetails'] as List<dynamic>?)
          ?.map((e) => ExpenseDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExpenseRequestModelImplToJson(
        _$ExpenseRequestModelImpl instance) =>
    <String, dynamic>{
      'expenseIDPK': instance.expenseIDPK,
      'expenseNo': instance.expenseNo,
      'referenceNo': instance.referenceNo,
      'expenseDate': instance.expenseDate?.toIso8601String(),
      'paymentMode': instance.paymentMode,
      'purchasedBy': instance.purchasedBy,
      'supplierIDFK': instance.supplierIDFK,
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
      'supplierName': instance.supplierName,
      'expenseDetails': instance.expenseDetails,
    };

_$ExpenseDetailsImpl _$$ExpenseDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseDetailsImpl(
      expenseIDPK: json['expenseIDPK'] as String?,
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

Map<String, dynamic> _$$ExpenseDetailsImplToJson(
        _$ExpenseDetailsImpl instance) =>
    <String, dynamic>{
      'expenseIDPK': instance.expenseIDPK,
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
