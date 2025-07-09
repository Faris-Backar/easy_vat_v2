// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_transfer_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockTransferRequestModel _$StockTransferRequestModelFromJson(
    Map<String, dynamic> json) {
  return _StockTransferRequestModel.fromJson(json);
}

/// @nodoc
mixin _$StockTransferRequestModel {
  String? get stockTransferIDPK => throw _privateConstructorUsedError;
  DateTime? get transferDate => throw _privateConstructorUsedError;
  int? get transferNo => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  String? get requestIDPK => throw _privateConstructorUsedError;
  String? get requestNo => throw _privateConstructorUsedError;
  String? get requestBy => throw _privateConstructorUsedError;
  String? get fromStoreIDPK => throw _privateConstructorUsedError;
  String? get toStoreIDPK => throw _privateConstructorUsedError;
  double? get totalNetCost => throw _privateConstructorUsedError;
  double? get totalSellValue => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  bool? get isEditable => throw _privateConstructorUsedError;
  bool? get isCanceled => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedBy => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  String? get rowguid => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;
  String? get fromStoreName => throw _privateConstructorUsedError;
  String? get toStoreName => throw _privateConstructorUsedError;
  List<StockTransferDetails>? get stockTransferDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this StockTransferRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockTransferRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockTransferRequestModelCopyWith<StockTransferRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockTransferRequestModelCopyWith<$Res> {
  factory $StockTransferRequestModelCopyWith(StockTransferRequestModel value,
          $Res Function(StockTransferRequestModel) then) =
      _$StockTransferRequestModelCopyWithImpl<$Res, StockTransferRequestModel>;
  @useResult
  $Res call(
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
      List<StockTransferDetails>? stockTransferDetails});
}

/// @nodoc
class _$StockTransferRequestModelCopyWithImpl<$Res,
        $Val extends StockTransferRequestModel>
    implements $StockTransferRequestModelCopyWith<$Res> {
  _$StockTransferRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockTransferRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockTransferIDPK = freezed,
    Object? transferDate = freezed,
    Object? transferNo = freezed,
    Object? referenceNo = freezed,
    Object? requestIDPK = freezed,
    Object? requestNo = freezed,
    Object? requestBy = freezed,
    Object? fromStoreIDPK = freezed,
    Object? toStoreIDPK = freezed,
    Object? totalNetCost = freezed,
    Object? totalSellValue = freezed,
    Object? remarks = freezed,
    Object? isEditable = freezed,
    Object? isCanceled = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedDate = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
    Object? fromStoreName = freezed,
    Object? toStoreName = freezed,
    Object? stockTransferDetails = freezed,
  }) {
    return _then(_value.copyWith(
      stockTransferIDPK: freezed == stockTransferIDPK
          ? _value.stockTransferIDPK
          : stockTransferIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      transferDate: freezed == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferNo: freezed == transferNo
          ? _value.transferNo
          : transferNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      requestIDPK: freezed == requestIDPK
          ? _value.requestIDPK
          : requestIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      requestNo: freezed == requestNo
          ? _value.requestNo
          : requestNo // ignore: cast_nullable_to_non_nullable
              as String?,
      requestBy: freezed == requestBy
          ? _value.requestBy
          : requestBy // ignore: cast_nullable_to_non_nullable
              as String?,
      fromStoreIDPK: freezed == fromStoreIDPK
          ? _value.fromStoreIDPK
          : fromStoreIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      toStoreIDPK: freezed == toStoreIDPK
          ? _value.toStoreIDPK
          : toStoreIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      totalNetCost: freezed == totalNetCost
          ? _value.totalNetCost
          : totalNetCost // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSellValue: freezed == totalSellValue
          ? _value.totalSellValue
          : totalSellValue // ignore: cast_nullable_to_non_nullable
              as double?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      isEditable: freezed == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCanceled: freezed == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      fromStoreName: freezed == fromStoreName
          ? _value.fromStoreName
          : fromStoreName // ignore: cast_nullable_to_non_nullable
              as String?,
      toStoreName: freezed == toStoreName
          ? _value.toStoreName
          : toStoreName // ignore: cast_nullable_to_non_nullable
              as String?,
      stockTransferDetails: freezed == stockTransferDetails
          ? _value.stockTransferDetails
          : stockTransferDetails // ignore: cast_nullable_to_non_nullable
              as List<StockTransferDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockTransferRequestModelImplCopyWith<$Res>
    implements $StockTransferRequestModelCopyWith<$Res> {
  factory _$$StockTransferRequestModelImplCopyWith(
          _$StockTransferRequestModelImpl value,
          $Res Function(_$StockTransferRequestModelImpl) then) =
      __$$StockTransferRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
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
      List<StockTransferDetails>? stockTransferDetails});
}

/// @nodoc
class __$$StockTransferRequestModelImplCopyWithImpl<$Res>
    extends _$StockTransferRequestModelCopyWithImpl<$Res,
        _$StockTransferRequestModelImpl>
    implements _$$StockTransferRequestModelImplCopyWith<$Res> {
  __$$StockTransferRequestModelImplCopyWithImpl(
      _$StockTransferRequestModelImpl _value,
      $Res Function(_$StockTransferRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockTransferRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockTransferIDPK = freezed,
    Object? transferDate = freezed,
    Object? transferNo = freezed,
    Object? referenceNo = freezed,
    Object? requestIDPK = freezed,
    Object? requestNo = freezed,
    Object? requestBy = freezed,
    Object? fromStoreIDPK = freezed,
    Object? toStoreIDPK = freezed,
    Object? totalNetCost = freezed,
    Object? totalSellValue = freezed,
    Object? remarks = freezed,
    Object? isEditable = freezed,
    Object? isCanceled = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedDate = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
    Object? fromStoreName = freezed,
    Object? toStoreName = freezed,
    Object? stockTransferDetails = freezed,
  }) {
    return _then(_$StockTransferRequestModelImpl(
      stockTransferIDPK: freezed == stockTransferIDPK
          ? _value.stockTransferIDPK
          : stockTransferIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      transferDate: freezed == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferNo: freezed == transferNo
          ? _value.transferNo
          : transferNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      requestIDPK: freezed == requestIDPK
          ? _value.requestIDPK
          : requestIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      requestNo: freezed == requestNo
          ? _value.requestNo
          : requestNo // ignore: cast_nullable_to_non_nullable
              as String?,
      requestBy: freezed == requestBy
          ? _value.requestBy
          : requestBy // ignore: cast_nullable_to_non_nullable
              as String?,
      fromStoreIDPK: freezed == fromStoreIDPK
          ? _value.fromStoreIDPK
          : fromStoreIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      toStoreIDPK: freezed == toStoreIDPK
          ? _value.toStoreIDPK
          : toStoreIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      totalNetCost: freezed == totalNetCost
          ? _value.totalNetCost
          : totalNetCost // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSellValue: freezed == totalSellValue
          ? _value.totalSellValue
          : totalSellValue // ignore: cast_nullable_to_non_nullable
              as double?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      isEditable: freezed == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCanceled: freezed == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      fromStoreName: freezed == fromStoreName
          ? _value.fromStoreName
          : fromStoreName // ignore: cast_nullable_to_non_nullable
              as String?,
      toStoreName: freezed == toStoreName
          ? _value.toStoreName
          : toStoreName // ignore: cast_nullable_to_non_nullable
              as String?,
      stockTransferDetails: freezed == stockTransferDetails
          ? _value._stockTransferDetails
          : stockTransferDetails // ignore: cast_nullable_to_non_nullable
              as List<StockTransferDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockTransferRequestModelImpl implements _StockTransferRequestModel {
  const _$StockTransferRequestModelImpl(
      {this.stockTransferIDPK,
      this.transferDate,
      this.transferNo,
      this.referenceNo,
      this.requestIDPK,
      this.requestNo,
      this.requestBy,
      this.fromStoreIDPK,
      this.toStoreIDPK,
      this.totalNetCost,
      this.totalSellValue,
      this.remarks,
      this.isEditable,
      this.isCanceled,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.rowguid,
      this.companyIDPK,
      this.fromStoreName,
      this.toStoreName,
      final List<StockTransferDetails>? stockTransferDetails})
      : _stockTransferDetails = stockTransferDetails;

  factory _$StockTransferRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockTransferRequestModelImplFromJson(json);

  @override
  final String? stockTransferIDPK;
  @override
  final DateTime? transferDate;
  @override
  final int? transferNo;
  @override
  final String? referenceNo;
  @override
  final String? requestIDPK;
  @override
  final String? requestNo;
  @override
  final String? requestBy;
  @override
  final String? fromStoreIDPK;
  @override
  final String? toStoreIDPK;
  @override
  final double? totalNetCost;
  @override
  final double? totalSellValue;
  @override
  final String? remarks;
  @override
  final bool? isEditable;
  @override
  final bool? isCanceled;
  @override
  final String? createdBy;
  @override
  final DateTime? createdDate;
  @override
  final String? modifiedBy;
  @override
  final DateTime? modifiedDate;
  @override
  final String? rowguid;
  @override
  final String? companyIDPK;
  @override
  final String? fromStoreName;
  @override
  final String? toStoreName;
  final List<StockTransferDetails>? _stockTransferDetails;
  @override
  List<StockTransferDetails>? get stockTransferDetails {
    final value = _stockTransferDetails;
    if (value == null) return null;
    if (_stockTransferDetails is EqualUnmodifiableListView)
      return _stockTransferDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StockTransferRequestModel(stockTransferIDPK: $stockTransferIDPK, transferDate: $transferDate, transferNo: $transferNo, referenceNo: $referenceNo, requestIDPK: $requestIDPK, requestNo: $requestNo, requestBy: $requestBy, fromStoreIDPK: $fromStoreIDPK, toStoreIDPK: $toStoreIDPK, totalNetCost: $totalNetCost, totalSellValue: $totalSellValue, remarks: $remarks, isEditable: $isEditable, isCanceled: $isCanceled, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, companyIDPK: $companyIDPK, fromStoreName: $fromStoreName, toStoreName: $toStoreName, stockTransferDetails: $stockTransferDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTransferRequestModelImpl &&
            (identical(other.stockTransferIDPK, stockTransferIDPK) ||
                other.stockTransferIDPK == stockTransferIDPK) &&
            (identical(other.transferDate, transferDate) ||
                other.transferDate == transferDate) &&
            (identical(other.transferNo, transferNo) ||
                other.transferNo == transferNo) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.requestIDPK, requestIDPK) ||
                other.requestIDPK == requestIDPK) &&
            (identical(other.requestNo, requestNo) ||
                other.requestNo == requestNo) &&
            (identical(other.requestBy, requestBy) ||
                other.requestBy == requestBy) &&
            (identical(other.fromStoreIDPK, fromStoreIDPK) ||
                other.fromStoreIDPK == fromStoreIDPK) &&
            (identical(other.toStoreIDPK, toStoreIDPK) ||
                other.toStoreIDPK == toStoreIDPK) &&
            (identical(other.totalNetCost, totalNetCost) ||
                other.totalNetCost == totalNetCost) &&
            (identical(other.totalSellValue, totalSellValue) ||
                other.totalSellValue == totalSellValue) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.isCanceled, isCanceled) ||
                other.isCanceled == isCanceled) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.rowguid, rowguid) || other.rowguid == rowguid) &&
            (identical(other.companyIDPK, companyIDPK) ||
                other.companyIDPK == companyIDPK) &&
            (identical(other.fromStoreName, fromStoreName) ||
                other.fromStoreName == fromStoreName) &&
            (identical(other.toStoreName, toStoreName) ||
                other.toStoreName == toStoreName) &&
            const DeepCollectionEquality()
                .equals(other._stockTransferDetails, _stockTransferDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        stockTransferIDPK,
        transferDate,
        transferNo,
        referenceNo,
        requestIDPK,
        requestNo,
        requestBy,
        fromStoreIDPK,
        toStoreIDPK,
        totalNetCost,
        totalSellValue,
        remarks,
        isEditable,
        isCanceled,
        createdBy,
        createdDate,
        modifiedBy,
        modifiedDate,
        rowguid,
        companyIDPK,
        fromStoreName,
        toStoreName,
        const DeepCollectionEquality().hash(_stockTransferDetails)
      ]);

  /// Create a copy of StockTransferRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTransferRequestModelImplCopyWith<_$StockTransferRequestModelImpl>
      get copyWith => __$$StockTransferRequestModelImplCopyWithImpl<
          _$StockTransferRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockTransferRequestModelImplToJson(
      this,
    );
  }
}

abstract class _StockTransferRequestModel implements StockTransferRequestModel {
  const factory _StockTransferRequestModel(
          {final String? stockTransferIDPK,
          final DateTime? transferDate,
          final int? transferNo,
          final String? referenceNo,
          final String? requestIDPK,
          final String? requestNo,
          final String? requestBy,
          final String? fromStoreIDPK,
          final String? toStoreIDPK,
          final double? totalNetCost,
          final double? totalSellValue,
          final String? remarks,
          final bool? isEditable,
          final bool? isCanceled,
          final String? createdBy,
          final DateTime? createdDate,
          final String? modifiedBy,
          final DateTime? modifiedDate,
          final String? rowguid,
          final String? companyIDPK,
          final String? fromStoreName,
          final String? toStoreName,
          final List<StockTransferDetails>? stockTransferDetails}) =
      _$StockTransferRequestModelImpl;

  factory _StockTransferRequestModel.fromJson(Map<String, dynamic> json) =
      _$StockTransferRequestModelImpl.fromJson;

  @override
  String? get stockTransferIDPK;
  @override
  DateTime? get transferDate;
  @override
  int? get transferNo;
  @override
  String? get referenceNo;
  @override
  String? get requestIDPK;
  @override
  String? get requestNo;
  @override
  String? get requestBy;
  @override
  String? get fromStoreIDPK;
  @override
  String? get toStoreIDPK;
  @override
  double? get totalNetCost;
  @override
  double? get totalSellValue;
  @override
  String? get remarks;
  @override
  bool? get isEditable;
  @override
  bool? get isCanceled;
  @override
  String? get createdBy;
  @override
  DateTime? get createdDate;
  @override
  String? get modifiedBy;
  @override
  DateTime? get modifiedDate;
  @override
  String? get rowguid;
  @override
  String? get companyIDPK;
  @override
  String? get fromStoreName;
  @override
  String? get toStoreName;
  @override
  List<StockTransferDetails>? get stockTransferDetails;

  /// Create a copy of StockTransferRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTransferRequestModelImplCopyWith<_$StockTransferRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StockTransferDetails _$StockTransferDetailsFromJson(Map<String, dynamic> json) {
  return _StockTransferDetails.fromJson(json);
}

/// @nodoc
mixin _$StockTransferDetails {
  String? get stockTransferIDPK => throw _privateConstructorUsedError;
  String? get itemIDPK => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  String? get itemCode => throw _privateConstructorUsedError;
  String? get itemName => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  double? get currentStock => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get requestedQty => throw _privateConstructorUsedError;
  double? get transferQty => throw _privateConstructorUsedError;
  double? get retailRate => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  double? get sellValue => throw _privateConstructorUsedError;
  double? get stockValue => throw _privateConstructorUsedError;
  String? get rowguid => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;

  /// Serializes this StockTransferDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockTransferDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockTransferDetailsCopyWith<StockTransferDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockTransferDetailsCopyWith<$Res> {
  factory $StockTransferDetailsCopyWith(StockTransferDetails value,
          $Res Function(StockTransferDetails) then) =
      _$StockTransferDetailsCopyWithImpl<$Res, StockTransferDetails>;
  @useResult
  $Res call(
      {String? stockTransferIDPK,
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
      double? stockValue,
      String? rowguid,
      String? companyIDPK});
}

/// @nodoc
class _$StockTransferDetailsCopyWithImpl<$Res,
        $Val extends StockTransferDetails>
    implements $StockTransferDetailsCopyWith<$Res> {
  _$StockTransferDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockTransferDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockTransferIDPK = freezed,
    Object? itemIDPK = freezed,
    Object? barcode = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? unit = freezed,
    Object? currentStock = freezed,
    Object? description = freezed,
    Object? requestedQty = freezed,
    Object? transferQty = freezed,
    Object? retailRate = freezed,
    Object? cost = freezed,
    Object? sellValue = freezed,
    Object? stockValue = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
  }) {
    return _then(_value.copyWith(
      stockTransferIDPK: freezed == stockTransferIDPK
          ? _value.stockTransferIDPK
          : stockTransferIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      itemIDPK: freezed == itemIDPK
          ? _value.itemIDPK
          : itemIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStock: freezed == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedQty: freezed == requestedQty
          ? _value.requestedQty
          : requestedQty // ignore: cast_nullable_to_non_nullable
              as double?,
      transferQty: freezed == transferQty
          ? _value.transferQty
          : transferQty // ignore: cast_nullable_to_non_nullable
              as double?,
      retailRate: freezed == retailRate
          ? _value.retailRate
          : retailRate // ignore: cast_nullable_to_non_nullable
              as double?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      sellValue: freezed == sellValue
          ? _value.sellValue
          : sellValue // ignore: cast_nullable_to_non_nullable
              as double?,
      stockValue: freezed == stockValue
          ? _value.stockValue
          : stockValue // ignore: cast_nullable_to_non_nullable
              as double?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockTransferDetailsImplCopyWith<$Res>
    implements $StockTransferDetailsCopyWith<$Res> {
  factory _$$StockTransferDetailsImplCopyWith(_$StockTransferDetailsImpl value,
          $Res Function(_$StockTransferDetailsImpl) then) =
      __$$StockTransferDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? stockTransferIDPK,
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
      double? stockValue,
      String? rowguid,
      String? companyIDPK});
}

/// @nodoc
class __$$StockTransferDetailsImplCopyWithImpl<$Res>
    extends _$StockTransferDetailsCopyWithImpl<$Res, _$StockTransferDetailsImpl>
    implements _$$StockTransferDetailsImplCopyWith<$Res> {
  __$$StockTransferDetailsImplCopyWithImpl(_$StockTransferDetailsImpl _value,
      $Res Function(_$StockTransferDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockTransferDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockTransferIDPK = freezed,
    Object? itemIDPK = freezed,
    Object? barcode = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? unit = freezed,
    Object? currentStock = freezed,
    Object? description = freezed,
    Object? requestedQty = freezed,
    Object? transferQty = freezed,
    Object? retailRate = freezed,
    Object? cost = freezed,
    Object? sellValue = freezed,
    Object? stockValue = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
  }) {
    return _then(_$StockTransferDetailsImpl(
      stockTransferIDPK: freezed == stockTransferIDPK
          ? _value.stockTransferIDPK
          : stockTransferIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      itemIDPK: freezed == itemIDPK
          ? _value.itemIDPK
          : itemIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStock: freezed == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedQty: freezed == requestedQty
          ? _value.requestedQty
          : requestedQty // ignore: cast_nullable_to_non_nullable
              as double?,
      transferQty: freezed == transferQty
          ? _value.transferQty
          : transferQty // ignore: cast_nullable_to_non_nullable
              as double?,
      retailRate: freezed == retailRate
          ? _value.retailRate
          : retailRate // ignore: cast_nullable_to_non_nullable
              as double?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      sellValue: freezed == sellValue
          ? _value.sellValue
          : sellValue // ignore: cast_nullable_to_non_nullable
              as double?,
      stockValue: freezed == stockValue
          ? _value.stockValue
          : stockValue // ignore: cast_nullable_to_non_nullable
              as double?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockTransferDetailsImpl implements _StockTransferDetails {
  const _$StockTransferDetailsImpl(
      {this.stockTransferIDPK,
      this.itemIDPK,
      this.barcode,
      this.itemCode,
      this.itemName,
      this.unit,
      this.currentStock,
      this.description,
      this.requestedQty,
      this.transferQty,
      this.retailRate,
      this.cost,
      this.sellValue,
      this.stockValue,
      this.rowguid,
      this.companyIDPK});

  factory _$StockTransferDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockTransferDetailsImplFromJson(json);

  @override
  final String? stockTransferIDPK;
  @override
  final String? itemIDPK;
  @override
  final String? barcode;
  @override
  final String? itemCode;
  @override
  final String? itemName;
  @override
  final String? unit;
  @override
  final double? currentStock;
  @override
  final String? description;
  @override
  final double? requestedQty;
  @override
  final double? transferQty;
  @override
  final double? retailRate;
  @override
  final double? cost;
  @override
  final double? sellValue;
  @override
  final double? stockValue;
  @override
  final String? rowguid;
  @override
  final String? companyIDPK;

  @override
  String toString() {
    return 'StockTransferDetails(stockTransferIDPK: $stockTransferIDPK, itemIDPK: $itemIDPK, barcode: $barcode, itemCode: $itemCode, itemName: $itemName, unit: $unit, currentStock: $currentStock, description: $description, requestedQty: $requestedQty, transferQty: $transferQty, retailRate: $retailRate, cost: $cost, sellValue: $sellValue, stockValue: $stockValue, rowguid: $rowguid, companyIDPK: $companyIDPK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTransferDetailsImpl &&
            (identical(other.stockTransferIDPK, stockTransferIDPK) ||
                other.stockTransferIDPK == stockTransferIDPK) &&
            (identical(other.itemIDPK, itemIDPK) ||
                other.itemIDPK == itemIDPK) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.currentStock, currentStock) ||
                other.currentStock == currentStock) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.requestedQty, requestedQty) ||
                other.requestedQty == requestedQty) &&
            (identical(other.transferQty, transferQty) ||
                other.transferQty == transferQty) &&
            (identical(other.retailRate, retailRate) ||
                other.retailRate == retailRate) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.sellValue, sellValue) ||
                other.sellValue == sellValue) &&
            (identical(other.stockValue, stockValue) ||
                other.stockValue == stockValue) &&
            (identical(other.rowguid, rowguid) || other.rowguid == rowguid) &&
            (identical(other.companyIDPK, companyIDPK) ||
                other.companyIDPK == companyIDPK));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stockTransferIDPK,
      itemIDPK,
      barcode,
      itemCode,
      itemName,
      unit,
      currentStock,
      description,
      requestedQty,
      transferQty,
      retailRate,
      cost,
      sellValue,
      stockValue,
      rowguid,
      companyIDPK);

  /// Create a copy of StockTransferDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTransferDetailsImplCopyWith<_$StockTransferDetailsImpl>
      get copyWith =>
          __$$StockTransferDetailsImplCopyWithImpl<_$StockTransferDetailsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockTransferDetailsImplToJson(
      this,
    );
  }
}

abstract class _StockTransferDetails implements StockTransferDetails {
  const factory _StockTransferDetails(
      {final String? stockTransferIDPK,
      final String? itemIDPK,
      final String? barcode,
      final String? itemCode,
      final String? itemName,
      final String? unit,
      final double? currentStock,
      final String? description,
      final double? requestedQty,
      final double? transferQty,
      final double? retailRate,
      final double? cost,
      final double? sellValue,
      final double? stockValue,
      final String? rowguid,
      final String? companyIDPK}) = _$StockTransferDetailsImpl;

  factory _StockTransferDetails.fromJson(Map<String, dynamic> json) =
      _$StockTransferDetailsImpl.fromJson;

  @override
  String? get stockTransferIDPK;
  @override
  String? get itemIDPK;
  @override
  String? get barcode;
  @override
  String? get itemCode;
  @override
  String? get itemName;
  @override
  String? get unit;
  @override
  double? get currentStock;
  @override
  String? get description;
  @override
  double? get requestedQty;
  @override
  double? get transferQty;
  @override
  double? get retailRate;
  @override
  double? get cost;
  @override
  double? get sellValue;
  @override
  double? get stockValue;
  @override
  String? get rowguid;
  @override
  String? get companyIDPK;

  /// Create a copy of StockTransferDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTransferDetailsImplCopyWith<_$StockTransferDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
