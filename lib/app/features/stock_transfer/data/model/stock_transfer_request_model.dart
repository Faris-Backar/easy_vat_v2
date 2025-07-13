import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_transfer_request_model.freezed.dart';
part 'stock_transfer_request_model.g.dart';

@freezed
class StockTransferRequestModel with _$StockTransferRequestModel {
  const factory StockTransferRequestModel(
          {String? stockTransferIDPK,
          DateTime? transferDate,
          int? transferNo,
          String? referenceNo,
          String? requestIDPK,
          String? requestNo,
          String? requestBy,
          String? fromStoreIDPK,
          String? toStoreIDPK,
          double? totalNetCost,
          double? totalSellValue,
          String? remarks,
          bool? isEditable,
          bool? isCanceled,
          String? createdBy,
          DateTime? createdDate,
          String? modifiedBy,
          DateTime? modifiedDate,
          String? rowguid,
          String? companyIDPK,
          String? fromStoreName,
          String? toStoreName,
          List<StockTransferDetails>? stockTransferDetails}) =
      _StockTransferRequestModel;

  factory StockTransferRequestModel.fromJson(Map<String, dynamic> json) =>
      _$StockTransferRequestModelFromJson(json);
}

@freezed
class StockTransferDetails with _$StockTransferDetails {
  const factory StockTransferDetails({
    String? stockTransferIDPK,
    String? itemIDPK,
    String? barcode,
    String? itemCode,
    String? itemName,
    String? unit,
    double? currentStock,
    String? description,
    double? requestedQty,
    double? transferQty,
    double? retailRate,
    double? cost,
    double? sellValue,
    double? netCost,
    double? stockValue,
    String? rowguid,
    String? companyIDPK,
  }) = _StockTransferDetails;

  factory StockTransferDetails.fromJson(Map<String, dynamic> json) =>
      _$StockTransferDetailsFromJson(json);
}
