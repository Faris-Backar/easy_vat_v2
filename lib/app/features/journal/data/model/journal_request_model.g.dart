// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalRequestModelImpl _$$JournalRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalRequestModelImpl(
      journalIDPK: json['journalIDPK'] as String?,
      journalNo: (json['journalNo'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      journalDate: json['journalDate'] == null
          ? null
          : DateTime.parse(json['journalDate'] as String),
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
      entryMode: json['entryMode'] as String?,
      toAccount: json['toAccount'] as String?,
      journalEntryDetail: (json['journalEntryDetail'] as List<dynamic>?)
          ?.map((e) => JournalDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$JournalRequestModelImplToJson(
        _$JournalRequestModelImpl instance) =>
    <String, dynamic>{
      'journalIDPK': instance.journalIDPK,
      'journalNo': instance.journalNo,
      'referenceNo': instance.referenceNo,
      'journalDate': instance.journalDate?.toIso8601String(),
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
      'entryMode': instance.entryMode,
      'toAccount': instance.toAccount,
      'journalEntryDetail': instance.journalEntryDetail,
    };

_$JournalDetailImpl _$$JournalDetailImplFromJson(Map<String, dynamic> json) =>
    _$JournalDetailImpl(
      journalIDPK: json['journalIDPK'] as String?,
      ledgerIDPK: json['ledgerIDPK'] as String?,
      ledgerName: json['ledgerName'] as String?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      currentBalanceType: json['currentBalanceType'] as String?,
      description: json['description'] as String?,
      drAmount: (json['drAmount'] as num?)?.toDouble(),
      crAmount: (json['crAmount'] as num?)?.toDouble(),
      companyIDPK: json['companyIDPK'] as String?,
    );

Map<String, dynamic> _$$JournalDetailImplToJson(_$JournalDetailImpl instance) =>
    <String, dynamic>{
      'journalIDPK': instance.journalIDPK,
      'ledgerIDPK': instance.ledgerIDPK,
      'ledgerName': instance.ledgerName,
      'currentBalance': instance.currentBalance,
      'currentBalanceType': instance.currentBalanceType,
      'description': instance.description,
      'drAmount': instance.drAmount,
      'crAmount': instance.crAmount,
      'companyIDPK': instance.companyIDPK,
    };
