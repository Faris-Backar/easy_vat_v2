// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contra_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContraRequestModelImpl _$$ContraRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContraRequestModelImpl(
      contraIDPK: json['contraIDPK'] as String?,
      contraNo: (json['contraNo'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      contraDate: json['contraDate'] == null
          ? null
          : DateTime.parse(json['contraDate'] as String),
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
      toAccountName: json['toAccountName'] as String?,
      contraEntryDetail: (json['contraEntryDetail'] as List<dynamic>?)
          ?.map((e) => ContraEntryDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContraRequestModelImplToJson(
        _$ContraRequestModelImpl instance) =>
    <String, dynamic>{
      'contraIDPK': instance.contraIDPK,
      'contraNo': instance.contraNo,
      'referenceNo': instance.referenceNo,
      'contraDate': instance.contraDate?.toIso8601String(),
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
      'toAccountName': instance.toAccountName,
      'contraEntryDetail': instance.contraEntryDetail,
    };

_$ContraEntryDetailImpl _$$ContraEntryDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ContraEntryDetailImpl(
      contraIDPK: json['contraIDPK'] as String?,
      ledgerIDPK: json['ledgerIDPK'] as String?,
      ledgerName: json['ledgerName'] as String?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      currentBalanceType: json['currentBalanceType'] as String?,
      description: json['description'] as String?,
      drAmount: (json['drAmount'] as num?)?.toDouble(),
      crAmount: (json['crAmount'] as num?)?.toDouble(),
      companyIDPK: json['companyIDPK'] as String?,
    );

Map<String, dynamic> _$$ContraEntryDetailImplToJson(
        _$ContraEntryDetailImpl instance) =>
    <String, dynamic>{
      'contraIDPK': instance.contraIDPK,
      'ledgerIDPK': instance.ledgerIDPK,
      'ledgerName': instance.ledgerName,
      'currentBalance': instance.currentBalance,
      'currentBalanceType': instance.currentBalanceType,
      'description': instance.description,
      'drAmount': instance.drAmount,
      'crAmount': instance.crAmount,
      'companyIDPK': instance.companyIDPK,
    };
