// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_note_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebitNoteRequestModelImpl _$$DebitNoteRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DebitNoteRequestModelImpl(
      debitNoteIDPK: json['debitNoteIDPK'] as String?,
      supplierIDPK: json['supplierIDPK'] as String?,
      debitNoteNo: (json['debitNoteNo'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      debitNoteDate: json['debitNoteDate'] == null
          ? null
          : DateTime.parse(json['debitNoteDate'] as String),
      description: json['description'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
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
      debitNoteEntryDetails: (json['debitNoteEntryDetails'] as List<dynamic>?)
          ?.map(
              (e) => DebitNoteEntryDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DebitNoteRequestModelImplToJson(
        _$DebitNoteRequestModelImpl instance) =>
    <String, dynamic>{
      'debitNoteIDPK': instance.debitNoteIDPK,
      'supplierIDPK': instance.supplierIDPK,
      'debitNoteNo': instance.debitNoteNo,
      'referenceNo': instance.referenceNo,
      'debitNoteDate': instance.debitNoteDate?.toIso8601String(),
      'description': instance.description,
      'totalAmount': instance.totalAmount,
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
      'debitNoteEntryDetails': instance.debitNoteEntryDetails,
    };

_$DebitNoteEntryDetailsImpl _$$DebitNoteEntryDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$DebitNoteEntryDetailsImpl(
      debitNoteIDPK: json['debitNoteIDPK'] as String?,
      ledgerIDPK: json['ledgerIDPK'] as String?,
      description: json['description'] as String?,
      crAmount: (json['crAmount'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      taxPercentage: (json['taxPercentage'] as num?)?.toDouble(),
      netTotal: (json['netTotal'] as num?)?.toDouble(),
      companyIDPK: json['companyIDPK'] as String?,
      ledgerBalance: (json['ledgerBalance'] as num?)?.toDouble(),
      ledgerName: json['ledgerName'] as String?,
    );

Map<String, dynamic> _$$DebitNoteEntryDetailsImplToJson(
        _$DebitNoteEntryDetailsImpl instance) =>
    <String, dynamic>{
      'debitNoteIDPK': instance.debitNoteIDPK,
      'ledgerIDPK': instance.ledgerIDPK,
      'description': instance.description,
      'crAmount': instance.crAmount,
      'tax': instance.tax,
      'taxPercentage': instance.taxPercentage,
      'netTotal': instance.netTotal,
      'companyIDPK': instance.companyIDPK,
      'ledgerBalance': instance.ledgerBalance,
      'ledgerName': instance.ledgerName,
    };
