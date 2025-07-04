// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dividend_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DividendRequestModelImpl _$$DividendRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DividendRequestModelImpl(
      dividendIDPK: json['dividendIDPK'] as String?,
      dividendNo: (json['dividendNo'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      dividendDate: json['dividendDate'] == null
          ? null
          : DateTime.parse(json['dividendDate'] as String),
      paymentMode: json['paymentMode'] as String?,
      crLedgerIDFK: json['crLedgerIDFK'] as String?,
      drLedgerIDFK: json['drLedgerIDFK'] as String?,
      expenseLedger: json['expenseLedger'] as String?,
      cashAccount: json['cashAccount'] as String?,
      issuedBy: json['issuedBy'] as String?,
      netTotal: (json['netTotal'] as num?)?.toDouble(),
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
      dividendDetails: (json['dividendDetails'] as List<dynamic>?)
          ?.map((e) => DividendDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DividendRequestModelImplToJson(
        _$DividendRequestModelImpl instance) =>
    <String, dynamic>{
      'dividendIDPK': instance.dividendIDPK,
      'dividendNo': instance.dividendNo,
      'referenceNo': instance.referenceNo,
      'dividendDate': instance.dividendDate?.toIso8601String(),
      'paymentMode': instance.paymentMode,
      'crLedgerIDFK': instance.crLedgerIDFK,
      'drLedgerIDFK': instance.drLedgerIDFK,
      'expenseLedger': instance.expenseLedger,
      'cashAccount': instance.cashAccount,
      'issuedBy': instance.issuedBy,
      'netTotal': instance.netTotal,
      'remarks': instance.remarks,
      'isEditable': instance.isEditable,
      'isCanceled': instance.isCanceled,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'rowguid': instance.rowguid,
      'companyIDPK': instance.companyIDPK,
      'dividendDetails': instance.dividendDetails,
    };

_$DividendDetailsImpl _$$DividendDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$DividendDetailsImpl(
      dividendIDPK: json['dividendIDPK'] as String?,
      ledgerIDPK: json['ledgerIDPK'] as String?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      currentBalanceType: json['currentBalanceType'] as String?,
      ledgerName: json['ledgerName'] as String?,
      description: json['description'] as String?,
      netTotal: (json['netTotal'] as num?)?.toDouble(),
      rowguid: json['rowguid'] as String?,
      companyIDPK: json['companyIDPK'] as String?,
    );

Map<String, dynamic> _$$DividendDetailsImplToJson(
        _$DividendDetailsImpl instance) =>
    <String, dynamic>{
      'dividendIDPK': instance.dividendIDPK,
      'ledgerIDPK': instance.ledgerIDPK,
      'currentBalance': instance.currentBalance,
      'currentBalanceType': instance.currentBalanceType,
      'ledgerName': instance.ledgerName,
      'description': instance.description,
      'netTotal': instance.netTotal,
      'rowguid': instance.rowguid,
      'companyIDPK': instance.companyIDPK,
    };
