// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockTransferRequestModelImpl _$$StockTransferRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StockTransferRequestModelImpl(
      stockTransferIDPK: json['stockTransferIDPK'] as String?,
      transferDate: json['transferDate'] == null
          ? null
          : DateTime.parse(json['transferDate'] as String),
      transferNo: (json['transferNo'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      requestIDPK: json['requestIDPK'] as String?,
      requestNo: json['requestNo'] as String?,
      requestBy: json['requestBy'] as String?,
      fromStoreIDPK: json['fromStoreIDPK'] as String?,
      toStoreIDPK: json['toStoreIDPK'] as String?,
      totalNetCost: (json['totalNetCost'] as num?)?.toDouble(),
      totalSellValue: (json['totalSellValue'] as num?)?.toDouble(),
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
      fromStoreName: json['fromStoreName'] as String?,
      toStoreName: json['toStoreName'] as String?,
      stockTransferDetails: (json['stockTransferDetails'] as List<dynamic>?)
          ?.map((e) => StockTransferDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StockTransferRequestModelImplToJson(
        _$StockTransferRequestModelImpl instance) =>
    <String, dynamic>{
      'stockTransferIDPK': instance.stockTransferIDPK,
      'transferDate': instance.transferDate?.toIso8601String(),
      'transferNo': instance.transferNo,
      'referenceNo': instance.referenceNo,
      'requestIDPK': instance.requestIDPK,
      'requestNo': instance.requestNo,
      'requestBy': instance.requestBy,
      'fromStoreIDPK': instance.fromStoreIDPK,
      'toStoreIDPK': instance.toStoreIDPK,
      'totalNetCost': instance.totalNetCost,
      'totalSellValue': instance.totalSellValue,
      'remarks': instance.remarks,
      'isEditable': instance.isEditable,
      'isCanceled': instance.isCanceled,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'rowguid': instance.rowguid,
      'companyIDPK': instance.companyIDPK,
      'fromStoreName': instance.fromStoreName,
      'toStoreName': instance.toStoreName,
      'stockTransferDetails': instance.stockTransferDetails,
    };

_$StockTransferDetailsImpl _$$StockTransferDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$StockTransferDetailsImpl(
      stockTransferIDPK: json['stockTransferIDPK'] as String?,
      itemIDPK: json['itemIDPK'] as String?,
      barcode: json['barcode'] as String?,
      itemCode: json['itemCode'] as String?,
      itemName: json['itemName'] as String?,
      unit: json['unit'] as String?,
      currentStock: (json['currentStock'] as num?)?.toDouble(),
      description: json['description'] as String?,
      requestedQty: (json['requestedQty'] as num?)?.toDouble(),
      transferQty: (json['transferQty'] as num?)?.toDouble(),
      retailRate: (json['retailRate'] as num?)?.toDouble(),
      cost: (json['cost'] as num?)?.toDouble(),
      sellValue: (json['sellValue'] as num?)?.toDouble(),
      stockValue: (json['stockValue'] as num?)?.toDouble(),
      rowguid: json['rowguid'] as String?,
      companyIDPK: json['companyIDPK'] as String?,
    );

Map<String, dynamic> _$$StockTransferDetailsImplToJson(
        _$StockTransferDetailsImpl instance) =>
    <String, dynamic>{
      'stockTransferIDPK': instance.stockTransferIDPK,
      'itemIDPK': instance.itemIDPK,
      'barcode': instance.barcode,
      'itemCode': instance.itemCode,
      'itemName': instance.itemName,
      'unit': instance.unit,
      'currentStock': instance.currentStock,
      'description': instance.description,
      'requestedQty': instance.requestedQty,
      'transferQty': instance.transferQty,
      'retailRate': instance.retailRate,
      'cost': instance.cost,
      'sellValue': instance.sellValue,
      'stockValue': instance.stockValue,
      'rowguid': instance.rowguid,
      'companyIDPK': instance.companyIDPK,
    };
