// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_note_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditNoteRequestModelImpl _$$CreditNoteRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditNoteRequestModelImpl(
      creditNoteIDPK: json['creditNoteIDPK'] as String?,
      customerIDPK: json['customerIDPK'] as String?,
      crLedgerIDFK: json['crLedgerIDFK'] as String?,
      drLedgerIDFK: json['drLedgerIDFK'] as String?,
      creditNoteNo: (json['creditNoteNo'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      creditNoteDate: json['creditNoteDate'] == null
          ? null
          : DateTime.parse(json['creditNoteDate'] as String),
      description: json['description'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      paymentMode: json['paymentMode'] as String?,
      soldBy: json['soldBy'] as String?,
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
      customerBalance: (json['customerBalance'] as num?)?.toDouble(),
      creditNoteEntryDetails: (json['creditNoteEntryDetails'] as List<dynamic>?)
          ?.map(
              (e) => CreditNoteEntryDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreditNoteRequestModelImplToJson(
        _$CreditNoteRequestModelImpl instance) =>
    <String, dynamic>{
      'creditNoteIDPK': instance.creditNoteIDPK,
      'customerIDPK': instance.customerIDPK,
      'crLedgerIDFK': instance.crLedgerIDFK,
      'drLedgerIDFK': instance.drLedgerIDFK,
      'creditNoteNo': instance.creditNoteNo,
      'referenceNo': instance.referenceNo,
      'creditNoteDate': instance.creditNoteDate?.toIso8601String(),
      'description': instance.description,
      'totalAmount': instance.totalAmount,
      'paymentMode': instance.paymentMode,
      'soldBy': instance.soldBy,
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
      'customerBalance': instance.customerBalance,
      'creditNoteEntryDetails': instance.creditNoteEntryDetails,
    };

_$CreditNoteEntryDetailsImpl _$$CreditNoteEntryDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditNoteEntryDetailsImpl(
      creditNoteIDPK: json['creditNoteIDPK'] as String?,
      ledgerIDPK: json['ledgerIDPK'] as String?,
      description: json['description'] as String?,
      drAmount: (json['drAmount'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      taxPercentage: (json['taxPercentage'] as num?)?.toDouble(),
      netTotal: (json['netTotal'] as num?)?.toDouble(),
      companyIDPK: json['companyIDPK'] as String?,
      ledgerBalance: (json['ledgerBalance'] as num?)?.toDouble(),
      ledgerName: json['ledgerName'] as String?,
    );

Map<String, dynamic> _$$CreditNoteEntryDetailsImplToJson(
        _$CreditNoteEntryDetailsImpl instance) =>
    <String, dynamic>{
      'creditNoteIDPK': instance.creditNoteIDPK,
      'ledgerIDPK': instance.ledgerIDPK,
      'description': instance.description,
      'drAmount': instance.drAmount,
      'tax': instance.tax,
      'taxPercentage': instance.taxPercentage,
      'netTotal': instance.netTotal,
      'companyIDPK': instance.companyIDPK,
      'ledgerBalance': instance.ledgerBalance,
      'ledgerName': instance.ledgerName,
    };
