// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debit_note_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DebitNoteRequestModel _$DebitNoteRequestModelFromJson(
    Map<String, dynamic> json) {
  return _DebitNoteRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DebitNoteRequestModel {
  String? get debitNoteIDPK => throw _privateConstructorUsedError;
  String? get supplierIDPK => throw _privateConstructorUsedError;
  int? get debitNoteNo => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  DateTime? get debitNoteDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  bool? get isEditable => throw _privateConstructorUsedError;
  bool? get isCanceled => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedBy => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  String? get rowguid => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;
  String? get supplierName => throw _privateConstructorUsedError;
  double? get customerBalance => throw _privateConstructorUsedError;
  List<DebitNoteEntryDetails>? get debitNoteEntryDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this DebitNoteRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DebitNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebitNoteRequestModelCopyWith<DebitNoteRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebitNoteRequestModelCopyWith<$Res> {
  factory $DebitNoteRequestModelCopyWith(DebitNoteRequestModel value,
          $Res Function(DebitNoteRequestModel) then) =
      _$DebitNoteRequestModelCopyWithImpl<$Res, DebitNoteRequestModel>;
  @useResult
  $Res call(
      {String? debitNoteIDPK,
      String? supplierIDPK,
      int? debitNoteNo,
      String? referenceNo,
      DateTime? debitNoteDate,
      String? description,
      double? totalAmount,
      String? remarks,
      bool? isEditable,
      bool? isCanceled,
      String? createdBy,
      DateTime? createdDate,
      String? modifiedBy,
      DateTime? modifiedDate,
      String? rowguid,
      String? companyIDPK,
      String? supplierName,
      double? customerBalance,
      List<DebitNoteEntryDetails>? debitNoteEntryDetails});
}

/// @nodoc
class _$DebitNoteRequestModelCopyWithImpl<$Res,
        $Val extends DebitNoteRequestModel>
    implements $DebitNoteRequestModelCopyWith<$Res> {
  _$DebitNoteRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebitNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debitNoteIDPK = freezed,
    Object? supplierIDPK = freezed,
    Object? debitNoteNo = freezed,
    Object? referenceNo = freezed,
    Object? debitNoteDate = freezed,
    Object? description = freezed,
    Object? totalAmount = freezed,
    Object? remarks = freezed,
    Object? isEditable = freezed,
    Object? isCanceled = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedDate = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
    Object? supplierName = freezed,
    Object? customerBalance = freezed,
    Object? debitNoteEntryDetails = freezed,
  }) {
    return _then(_value.copyWith(
      debitNoteIDPK: freezed == debitNoteIDPK
          ? _value.debitNoteIDPK
          : debitNoteIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierIDPK: freezed == supplierIDPK
          ? _value.supplierIDPK
          : supplierIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      debitNoteNo: freezed == debitNoteNo
          ? _value.debitNoteNo
          : debitNoteNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      debitNoteDate: freezed == debitNoteDate
          ? _value.debitNoteDate
          : debitNoteDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
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
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerBalance: freezed == customerBalance
          ? _value.customerBalance
          : customerBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      debitNoteEntryDetails: freezed == debitNoteEntryDetails
          ? _value.debitNoteEntryDetails
          : debitNoteEntryDetails // ignore: cast_nullable_to_non_nullable
              as List<DebitNoteEntryDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebitNoteRequestModelImplCopyWith<$Res>
    implements $DebitNoteRequestModelCopyWith<$Res> {
  factory _$$DebitNoteRequestModelImplCopyWith(
          _$DebitNoteRequestModelImpl value,
          $Res Function(_$DebitNoteRequestModelImpl) then) =
      __$$DebitNoteRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? debitNoteIDPK,
      String? supplierIDPK,
      int? debitNoteNo,
      String? referenceNo,
      DateTime? debitNoteDate,
      String? description,
      double? totalAmount,
      String? remarks,
      bool? isEditable,
      bool? isCanceled,
      String? createdBy,
      DateTime? createdDate,
      String? modifiedBy,
      DateTime? modifiedDate,
      String? rowguid,
      String? companyIDPK,
      String? supplierName,
      double? customerBalance,
      List<DebitNoteEntryDetails>? debitNoteEntryDetails});
}

/// @nodoc
class __$$DebitNoteRequestModelImplCopyWithImpl<$Res>
    extends _$DebitNoteRequestModelCopyWithImpl<$Res,
        _$DebitNoteRequestModelImpl>
    implements _$$DebitNoteRequestModelImplCopyWith<$Res> {
  __$$DebitNoteRequestModelImplCopyWithImpl(_$DebitNoteRequestModelImpl _value,
      $Res Function(_$DebitNoteRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DebitNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debitNoteIDPK = freezed,
    Object? supplierIDPK = freezed,
    Object? debitNoteNo = freezed,
    Object? referenceNo = freezed,
    Object? debitNoteDate = freezed,
    Object? description = freezed,
    Object? totalAmount = freezed,
    Object? remarks = freezed,
    Object? isEditable = freezed,
    Object? isCanceled = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedDate = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
    Object? supplierName = freezed,
    Object? customerBalance = freezed,
    Object? debitNoteEntryDetails = freezed,
  }) {
    return _then(_$DebitNoteRequestModelImpl(
      debitNoteIDPK: freezed == debitNoteIDPK
          ? _value.debitNoteIDPK
          : debitNoteIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierIDPK: freezed == supplierIDPK
          ? _value.supplierIDPK
          : supplierIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      debitNoteNo: freezed == debitNoteNo
          ? _value.debitNoteNo
          : debitNoteNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      debitNoteDate: freezed == debitNoteDate
          ? _value.debitNoteDate
          : debitNoteDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
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
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerBalance: freezed == customerBalance
          ? _value.customerBalance
          : customerBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      debitNoteEntryDetails: freezed == debitNoteEntryDetails
          ? _value._debitNoteEntryDetails
          : debitNoteEntryDetails // ignore: cast_nullable_to_non_nullable
              as List<DebitNoteEntryDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebitNoteRequestModelImpl implements _DebitNoteRequestModel {
  const _$DebitNoteRequestModelImpl(
      {this.debitNoteIDPK,
      this.supplierIDPK,
      this.debitNoteNo,
      this.referenceNo,
      this.debitNoteDate,
      this.description,
      this.totalAmount,
      this.remarks,
      this.isEditable,
      this.isCanceled,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.rowguid,
      this.companyIDPK,
      this.supplierName,
      this.customerBalance,
      final List<DebitNoteEntryDetails>? debitNoteEntryDetails})
      : _debitNoteEntryDetails = debitNoteEntryDetails;

  factory _$DebitNoteRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DebitNoteRequestModelImplFromJson(json);

  @override
  final String? debitNoteIDPK;
  @override
  final String? supplierIDPK;
  @override
  final int? debitNoteNo;
  @override
  final String? referenceNo;
  @override
  final DateTime? debitNoteDate;
  @override
  final String? description;
  @override
  final double? totalAmount;
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
  final String? supplierName;
  @override
  final double? customerBalance;
  final List<DebitNoteEntryDetails>? _debitNoteEntryDetails;
  @override
  List<DebitNoteEntryDetails>? get debitNoteEntryDetails {
    final value = _debitNoteEntryDetails;
    if (value == null) return null;
    if (_debitNoteEntryDetails is EqualUnmodifiableListView)
      return _debitNoteEntryDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DebitNoteRequestModel(debitNoteIDPK: $debitNoteIDPK, supplierIDPK: $supplierIDPK, debitNoteNo: $debitNoteNo, referenceNo: $referenceNo, debitNoteDate: $debitNoteDate, description: $description, totalAmount: $totalAmount, remarks: $remarks, isEditable: $isEditable, isCanceled: $isCanceled, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, companyIDPK: $companyIDPK, supplierName: $supplierName, customerBalance: $customerBalance, debitNoteEntryDetails: $debitNoteEntryDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebitNoteRequestModelImpl &&
            (identical(other.debitNoteIDPK, debitNoteIDPK) ||
                other.debitNoteIDPK == debitNoteIDPK) &&
            (identical(other.supplierIDPK, supplierIDPK) ||
                other.supplierIDPK == supplierIDPK) &&
            (identical(other.debitNoteNo, debitNoteNo) ||
                other.debitNoteNo == debitNoteNo) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.debitNoteDate, debitNoteDate) ||
                other.debitNoteDate == debitNoteDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
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
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.customerBalance, customerBalance) ||
                other.customerBalance == customerBalance) &&
            const DeepCollectionEquality()
                .equals(other._debitNoteEntryDetails, _debitNoteEntryDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        debitNoteIDPK,
        supplierIDPK,
        debitNoteNo,
        referenceNo,
        debitNoteDate,
        description,
        totalAmount,
        remarks,
        isEditable,
        isCanceled,
        createdBy,
        createdDate,
        modifiedBy,
        modifiedDate,
        rowguid,
        companyIDPK,
        supplierName,
        customerBalance,
        const DeepCollectionEquality().hash(_debitNoteEntryDetails)
      ]);

  /// Create a copy of DebitNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebitNoteRequestModelImplCopyWith<_$DebitNoteRequestModelImpl>
      get copyWith => __$$DebitNoteRequestModelImplCopyWithImpl<
          _$DebitNoteRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebitNoteRequestModelImplToJson(
      this,
    );
  }
}

abstract class _DebitNoteRequestModel implements DebitNoteRequestModel {
  const factory _DebitNoteRequestModel(
          {final String? debitNoteIDPK,
          final String? supplierIDPK,
          final int? debitNoteNo,
          final String? referenceNo,
          final DateTime? debitNoteDate,
          final String? description,
          final double? totalAmount,
          final String? remarks,
          final bool? isEditable,
          final bool? isCanceled,
          final String? createdBy,
          final DateTime? createdDate,
          final String? modifiedBy,
          final DateTime? modifiedDate,
          final String? rowguid,
          final String? companyIDPK,
          final String? supplierName,
          final double? customerBalance,
          final List<DebitNoteEntryDetails>? debitNoteEntryDetails}) =
      _$DebitNoteRequestModelImpl;

  factory _DebitNoteRequestModel.fromJson(Map<String, dynamic> json) =
      _$DebitNoteRequestModelImpl.fromJson;

  @override
  String? get debitNoteIDPK;
  @override
  String? get supplierIDPK;
  @override
  int? get debitNoteNo;
  @override
  String? get referenceNo;
  @override
  DateTime? get debitNoteDate;
  @override
  String? get description;
  @override
  double? get totalAmount;
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
  String? get supplierName;
  @override
  double? get customerBalance;
  @override
  List<DebitNoteEntryDetails>? get debitNoteEntryDetails;

  /// Create a copy of DebitNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebitNoteRequestModelImplCopyWith<_$DebitNoteRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DebitNoteEntryDetails _$DebitNoteEntryDetailsFromJson(
    Map<String, dynamic> json) {
  return _DebitNoteEntryDetails.fromJson(json);
}

/// @nodoc
mixin _$DebitNoteEntryDetails {
  String? get debitNoteIDPK => throw _privateConstructorUsedError;
  String? get ledgerIDPK => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get crAmount => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get taxPercentage => throw _privateConstructorUsedError;
  double? get netTotal => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;
  double? get ledgerBalance => throw _privateConstructorUsedError;
  String? get ledgerName => throw _privateConstructorUsedError;

  /// Serializes this DebitNoteEntryDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DebitNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebitNoteEntryDetailsCopyWith<DebitNoteEntryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebitNoteEntryDetailsCopyWith<$Res> {
  factory $DebitNoteEntryDetailsCopyWith(DebitNoteEntryDetails value,
          $Res Function(DebitNoteEntryDetails) then) =
      _$DebitNoteEntryDetailsCopyWithImpl<$Res, DebitNoteEntryDetails>;
  @useResult
  $Res call(
      {String? debitNoteIDPK,
      String? ledgerIDPK,
      String? description,
      double? crAmount,
      double? tax,
      double? taxPercentage,
      double? netTotal,
      String? companyIDPK,
      double? ledgerBalance,
      String? ledgerName});
}

/// @nodoc
class _$DebitNoteEntryDetailsCopyWithImpl<$Res,
        $Val extends DebitNoteEntryDetails>
    implements $DebitNoteEntryDetailsCopyWith<$Res> {
  _$DebitNoteEntryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebitNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debitNoteIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? description = freezed,
    Object? crAmount = freezed,
    Object? tax = freezed,
    Object? taxPercentage = freezed,
    Object? netTotal = freezed,
    Object? companyIDPK = freezed,
    Object? ledgerBalance = freezed,
    Object? ledgerName = freezed,
  }) {
    return _then(_value.copyWith(
      debitNoteIDPK: freezed == debitNoteIDPK
          ? _value.debitNoteIDPK
          : debitNoteIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      crAmount: freezed == crAmount
          ? _value.crAmount
          : crAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerBalance: freezed == ledgerBalance
          ? _value.ledgerBalance
          : ledgerBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      ledgerName: freezed == ledgerName
          ? _value.ledgerName
          : ledgerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebitNoteEntryDetailsImplCopyWith<$Res>
    implements $DebitNoteEntryDetailsCopyWith<$Res> {
  factory _$$DebitNoteEntryDetailsImplCopyWith(
          _$DebitNoteEntryDetailsImpl value,
          $Res Function(_$DebitNoteEntryDetailsImpl) then) =
      __$$DebitNoteEntryDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? debitNoteIDPK,
      String? ledgerIDPK,
      String? description,
      double? crAmount,
      double? tax,
      double? taxPercentage,
      double? netTotal,
      String? companyIDPK,
      double? ledgerBalance,
      String? ledgerName});
}

/// @nodoc
class __$$DebitNoteEntryDetailsImplCopyWithImpl<$Res>
    extends _$DebitNoteEntryDetailsCopyWithImpl<$Res,
        _$DebitNoteEntryDetailsImpl>
    implements _$$DebitNoteEntryDetailsImplCopyWith<$Res> {
  __$$DebitNoteEntryDetailsImplCopyWithImpl(_$DebitNoteEntryDetailsImpl _value,
      $Res Function(_$DebitNoteEntryDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DebitNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debitNoteIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? description = freezed,
    Object? crAmount = freezed,
    Object? tax = freezed,
    Object? taxPercentage = freezed,
    Object? netTotal = freezed,
    Object? companyIDPK = freezed,
    Object? ledgerBalance = freezed,
    Object? ledgerName = freezed,
  }) {
    return _then(_$DebitNoteEntryDetailsImpl(
      debitNoteIDPK: freezed == debitNoteIDPK
          ? _value.debitNoteIDPK
          : debitNoteIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      crAmount: freezed == crAmount
          ? _value.crAmount
          : crAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerBalance: freezed == ledgerBalance
          ? _value.ledgerBalance
          : ledgerBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      ledgerName: freezed == ledgerName
          ? _value.ledgerName
          : ledgerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebitNoteEntryDetailsImpl implements _DebitNoteEntryDetails {
  const _$DebitNoteEntryDetailsImpl(
      {this.debitNoteIDPK,
      this.ledgerIDPK,
      this.description,
      this.crAmount,
      this.tax,
      this.taxPercentage,
      this.netTotal,
      this.companyIDPK,
      this.ledgerBalance,
      this.ledgerName});

  factory _$DebitNoteEntryDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DebitNoteEntryDetailsImplFromJson(json);

  @override
  final String? debitNoteIDPK;
  @override
  final String? ledgerIDPK;
  @override
  final String? description;
  @override
  final double? crAmount;
  @override
  final double? tax;
  @override
  final double? taxPercentage;
  @override
  final double? netTotal;
  @override
  final String? companyIDPK;
  @override
  final double? ledgerBalance;
  @override
  final String? ledgerName;

  @override
  String toString() {
    return 'DebitNoteEntryDetails(debitNoteIDPK: $debitNoteIDPK, ledgerIDPK: $ledgerIDPK, description: $description, crAmount: $crAmount, tax: $tax, taxPercentage: $taxPercentage, netTotal: $netTotal, companyIDPK: $companyIDPK, ledgerBalance: $ledgerBalance, ledgerName: $ledgerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebitNoteEntryDetailsImpl &&
            (identical(other.debitNoteIDPK, debitNoteIDPK) ||
                other.debitNoteIDPK == debitNoteIDPK) &&
            (identical(other.ledgerIDPK, ledgerIDPK) ||
                other.ledgerIDPK == ledgerIDPK) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.crAmount, crAmount) ||
                other.crAmount == crAmount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
            (identical(other.companyIDPK, companyIDPK) ||
                other.companyIDPK == companyIDPK) &&
            (identical(other.ledgerBalance, ledgerBalance) ||
                other.ledgerBalance == ledgerBalance) &&
            (identical(other.ledgerName, ledgerName) ||
                other.ledgerName == ledgerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      debitNoteIDPK,
      ledgerIDPK,
      description,
      crAmount,
      tax,
      taxPercentage,
      netTotal,
      companyIDPK,
      ledgerBalance,
      ledgerName);

  /// Create a copy of DebitNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebitNoteEntryDetailsImplCopyWith<_$DebitNoteEntryDetailsImpl>
      get copyWith => __$$DebitNoteEntryDetailsImplCopyWithImpl<
          _$DebitNoteEntryDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebitNoteEntryDetailsImplToJson(
      this,
    );
  }
}

abstract class _DebitNoteEntryDetails implements DebitNoteEntryDetails {
  const factory _DebitNoteEntryDetails(
      {final String? debitNoteIDPK,
      final String? ledgerIDPK,
      final String? description,
      final double? crAmount,
      final double? tax,
      final double? taxPercentage,
      final double? netTotal,
      final String? companyIDPK,
      final double? ledgerBalance,
      final String? ledgerName}) = _$DebitNoteEntryDetailsImpl;

  factory _DebitNoteEntryDetails.fromJson(Map<String, dynamic> json) =
      _$DebitNoteEntryDetailsImpl.fromJson;

  @override
  String? get debitNoteIDPK;
  @override
  String? get ledgerIDPK;
  @override
  String? get description;
  @override
  double? get crAmount;
  @override
  double? get tax;
  @override
  double? get taxPercentage;
  @override
  double? get netTotal;
  @override
  String? get companyIDPK;
  @override
  double? get ledgerBalance;
  @override
  String? get ledgerName;

  /// Create a copy of DebitNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebitNoteEntryDetailsImplCopyWith<_$DebitNoteEntryDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
