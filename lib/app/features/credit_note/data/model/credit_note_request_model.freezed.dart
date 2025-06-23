// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_note_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreditNoteRequestModel _$CreditNoteRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreditNoteRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreditNoteRequestModel {
  String? get creditNoteIDPK => throw _privateConstructorUsedError;
  String? get customerIDPK => throw _privateConstructorUsedError;
  int? get creditNoteNo => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  DateTime? get creditNoteDate => throw _privateConstructorUsedError;
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
  String? get customerName => throw _privateConstructorUsedError;
  double? get customerBalance => throw _privateConstructorUsedError;
  List<CreditNoteEntryDetails>? get creditNoteEntryDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this CreditNoteRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreditNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditNoteRequestModelCopyWith<CreditNoteRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditNoteRequestModelCopyWith<$Res> {
  factory $CreditNoteRequestModelCopyWith(CreditNoteRequestModel value,
          $Res Function(CreditNoteRequestModel) then) =
      _$CreditNoteRequestModelCopyWithImpl<$Res, CreditNoteRequestModel>;
  @useResult
  $Res call(
      {String? creditNoteIDPK,
      String? customerIDPK,
      int? creditNoteNo,
      String? referenceNo,
      DateTime? creditNoteDate,
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
      String? customerName,
      double? customerBalance,
      List<CreditNoteEntryDetails>? creditNoteEntryDetails});
}

/// @nodoc
class _$CreditNoteRequestModelCopyWithImpl<$Res,
        $Val extends CreditNoteRequestModel>
    implements $CreditNoteRequestModelCopyWith<$Res> {
  _$CreditNoteRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteIDPK = freezed,
    Object? customerIDPK = freezed,
    Object? creditNoteNo = freezed,
    Object? referenceNo = freezed,
    Object? creditNoteDate = freezed,
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
    Object? customerName = freezed,
    Object? customerBalance = freezed,
    Object? creditNoteEntryDetails = freezed,
  }) {
    return _then(_value.copyWith(
      creditNoteIDPK: freezed == creditNoteIDPK
          ? _value.creditNoteIDPK
          : creditNoteIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIDPK: freezed == customerIDPK
          ? _value.customerIDPK
          : customerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      creditNoteNo: freezed == creditNoteNo
          ? _value.creditNoteNo
          : creditNoteNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      creditNoteDate: freezed == creditNoteDate
          ? _value.creditNoteDate
          : creditNoteDate // ignore: cast_nullable_to_non_nullable
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
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerBalance: freezed == customerBalance
          ? _value.customerBalance
          : customerBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      creditNoteEntryDetails: freezed == creditNoteEntryDetails
          ? _value.creditNoteEntryDetails
          : creditNoteEntryDetails // ignore: cast_nullable_to_non_nullable
              as List<CreditNoteEntryDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditNoteRequestModelImplCopyWith<$Res>
    implements $CreditNoteRequestModelCopyWith<$Res> {
  factory _$$CreditNoteRequestModelImplCopyWith(
          _$CreditNoteRequestModelImpl value,
          $Res Function(_$CreditNoteRequestModelImpl) then) =
      __$$CreditNoteRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? creditNoteIDPK,
      String? customerIDPK,
      int? creditNoteNo,
      String? referenceNo,
      DateTime? creditNoteDate,
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
      String? customerName,
      double? customerBalance,
      List<CreditNoteEntryDetails>? creditNoteEntryDetails});
}

/// @nodoc
class __$$CreditNoteRequestModelImplCopyWithImpl<$Res>
    extends _$CreditNoteRequestModelCopyWithImpl<$Res,
        _$CreditNoteRequestModelImpl>
    implements _$$CreditNoteRequestModelImplCopyWith<$Res> {
  __$$CreditNoteRequestModelImplCopyWithImpl(
      _$CreditNoteRequestModelImpl _value,
      $Res Function(_$CreditNoteRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteIDPK = freezed,
    Object? customerIDPK = freezed,
    Object? creditNoteNo = freezed,
    Object? referenceNo = freezed,
    Object? creditNoteDate = freezed,
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
    Object? customerName = freezed,
    Object? customerBalance = freezed,
    Object? creditNoteEntryDetails = freezed,
  }) {
    return _then(_$CreditNoteRequestModelImpl(
      creditNoteIDPK: freezed == creditNoteIDPK
          ? _value.creditNoteIDPK
          : creditNoteIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIDPK: freezed == customerIDPK
          ? _value.customerIDPK
          : customerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      creditNoteNo: freezed == creditNoteNo
          ? _value.creditNoteNo
          : creditNoteNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      creditNoteDate: freezed == creditNoteDate
          ? _value.creditNoteDate
          : creditNoteDate // ignore: cast_nullable_to_non_nullable
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
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerBalance: freezed == customerBalance
          ? _value.customerBalance
          : customerBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      creditNoteEntryDetails: freezed == creditNoteEntryDetails
          ? _value._creditNoteEntryDetails
          : creditNoteEntryDetails // ignore: cast_nullable_to_non_nullable
              as List<CreditNoteEntryDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditNoteRequestModelImpl implements _CreditNoteRequestModel {
  const _$CreditNoteRequestModelImpl(
      {this.creditNoteIDPK,
      this.customerIDPK,
      this.creditNoteNo,
      this.referenceNo,
      this.creditNoteDate,
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
      this.customerName,
      this.customerBalance,
      final List<CreditNoteEntryDetails>? creditNoteEntryDetails})
      : _creditNoteEntryDetails = creditNoteEntryDetails;

  factory _$CreditNoteRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditNoteRequestModelImplFromJson(json);

  @override
  final String? creditNoteIDPK;
  @override
  final String? customerIDPK;
  @override
  final int? creditNoteNo;
  @override
  final String? referenceNo;
  @override
  final DateTime? creditNoteDate;
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
  final String? customerName;
  @override
  final double? customerBalance;
  final List<CreditNoteEntryDetails>? _creditNoteEntryDetails;
  @override
  List<CreditNoteEntryDetails>? get creditNoteEntryDetails {
    final value = _creditNoteEntryDetails;
    if (value == null) return null;
    if (_creditNoteEntryDetails is EqualUnmodifiableListView)
      return _creditNoteEntryDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreditNoteRequestModel(creditNoteIDPK: $creditNoteIDPK, customerIDPK: $customerIDPK, creditNoteNo: $creditNoteNo, referenceNo: $referenceNo, creditNoteDate: $creditNoteDate, description: $description, totalAmount: $totalAmount, remarks: $remarks, isEditable: $isEditable, isCanceled: $isCanceled, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, companyIDPK: $companyIDPK, customerName: $customerName, customerBalance: $customerBalance, creditNoteEntryDetails: $creditNoteEntryDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditNoteRequestModelImpl &&
            (identical(other.creditNoteIDPK, creditNoteIDPK) ||
                other.creditNoteIDPK == creditNoteIDPK) &&
            (identical(other.customerIDPK, customerIDPK) ||
                other.customerIDPK == customerIDPK) &&
            (identical(other.creditNoteNo, creditNoteNo) ||
                other.creditNoteNo == creditNoteNo) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.creditNoteDate, creditNoteDate) ||
                other.creditNoteDate == creditNoteDate) &&
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
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerBalance, customerBalance) ||
                other.customerBalance == customerBalance) &&
            const DeepCollectionEquality().equals(
                other._creditNoteEntryDetails, _creditNoteEntryDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        creditNoteIDPK,
        customerIDPK,
        creditNoteNo,
        referenceNo,
        creditNoteDate,
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
        customerName,
        customerBalance,
        const DeepCollectionEquality().hash(_creditNoteEntryDetails)
      ]);

  /// Create a copy of CreditNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditNoteRequestModelImplCopyWith<_$CreditNoteRequestModelImpl>
      get copyWith => __$$CreditNoteRequestModelImplCopyWithImpl<
          _$CreditNoteRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditNoteRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreditNoteRequestModel implements CreditNoteRequestModel {
  const factory _CreditNoteRequestModel(
          {final String? creditNoteIDPK,
          final String? customerIDPK,
          final int? creditNoteNo,
          final String? referenceNo,
          final DateTime? creditNoteDate,
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
          final String? customerName,
          final double? customerBalance,
          final List<CreditNoteEntryDetails>? creditNoteEntryDetails}) =
      _$CreditNoteRequestModelImpl;

  factory _CreditNoteRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreditNoteRequestModelImpl.fromJson;

  @override
  String? get creditNoteIDPK;
  @override
  String? get customerIDPK;
  @override
  int? get creditNoteNo;
  @override
  String? get referenceNo;
  @override
  DateTime? get creditNoteDate;
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
  String? get customerName;
  @override
  double? get customerBalance;
  @override
  List<CreditNoteEntryDetails>? get creditNoteEntryDetails;

  /// Create a copy of CreditNoteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditNoteRequestModelImplCopyWith<_$CreditNoteRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreditNoteEntryDetails _$CreditNoteEntryDetailsFromJson(
    Map<String, dynamic> json) {
  return _CreditNoteEntryDetails.fromJson(json);
}

/// @nodoc
mixin _$CreditNoteEntryDetails {
  String? get creditNoteIDPK => throw _privateConstructorUsedError;
  String? get ledgerIDPK => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get drAmount => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get taxPercentage => throw _privateConstructorUsedError;
  double? get netTotal => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;
  double? get ledgerBalance => throw _privateConstructorUsedError;
  String? get ledgerName => throw _privateConstructorUsedError;

  /// Serializes this CreditNoteEntryDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreditNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditNoteEntryDetailsCopyWith<CreditNoteEntryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditNoteEntryDetailsCopyWith<$Res> {
  factory $CreditNoteEntryDetailsCopyWith(CreditNoteEntryDetails value,
          $Res Function(CreditNoteEntryDetails) then) =
      _$CreditNoteEntryDetailsCopyWithImpl<$Res, CreditNoteEntryDetails>;
  @useResult
  $Res call(
      {String? creditNoteIDPK,
      String? ledgerIDPK,
      String? description,
      double? drAmount,
      double? tax,
      double? taxPercentage,
      double? netTotal,
      String? companyIDPK,
      double? ledgerBalance,
      String? ledgerName});
}

/// @nodoc
class _$CreditNoteEntryDetailsCopyWithImpl<$Res,
        $Val extends CreditNoteEntryDetails>
    implements $CreditNoteEntryDetailsCopyWith<$Res> {
  _$CreditNoteEntryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? description = freezed,
    Object? drAmount = freezed,
    Object? tax = freezed,
    Object? taxPercentage = freezed,
    Object? netTotal = freezed,
    Object? companyIDPK = freezed,
    Object? ledgerBalance = freezed,
    Object? ledgerName = freezed,
  }) {
    return _then(_value.copyWith(
      creditNoteIDPK: freezed == creditNoteIDPK
          ? _value.creditNoteIDPK
          : creditNoteIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      drAmount: freezed == drAmount
          ? _value.drAmount
          : drAmount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CreditNoteEntryDetailsImplCopyWith<$Res>
    implements $CreditNoteEntryDetailsCopyWith<$Res> {
  factory _$$CreditNoteEntryDetailsImplCopyWith(
          _$CreditNoteEntryDetailsImpl value,
          $Res Function(_$CreditNoteEntryDetailsImpl) then) =
      __$$CreditNoteEntryDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? creditNoteIDPK,
      String? ledgerIDPK,
      String? description,
      double? drAmount,
      double? tax,
      double? taxPercentage,
      double? netTotal,
      String? companyIDPK,
      double? ledgerBalance,
      String? ledgerName});
}

/// @nodoc
class __$$CreditNoteEntryDetailsImplCopyWithImpl<$Res>
    extends _$CreditNoteEntryDetailsCopyWithImpl<$Res,
        _$CreditNoteEntryDetailsImpl>
    implements _$$CreditNoteEntryDetailsImplCopyWith<$Res> {
  __$$CreditNoteEntryDetailsImplCopyWithImpl(
      _$CreditNoteEntryDetailsImpl _value,
      $Res Function(_$CreditNoteEntryDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? description = freezed,
    Object? drAmount = freezed,
    Object? tax = freezed,
    Object? taxPercentage = freezed,
    Object? netTotal = freezed,
    Object? companyIDPK = freezed,
    Object? ledgerBalance = freezed,
    Object? ledgerName = freezed,
  }) {
    return _then(_$CreditNoteEntryDetailsImpl(
      creditNoteIDPK: freezed == creditNoteIDPK
          ? _value.creditNoteIDPK
          : creditNoteIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      drAmount: freezed == drAmount
          ? _value.drAmount
          : drAmount // ignore: cast_nullable_to_non_nullable
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
class _$CreditNoteEntryDetailsImpl implements _CreditNoteEntryDetails {
  const _$CreditNoteEntryDetailsImpl(
      {this.creditNoteIDPK,
      this.ledgerIDPK,
      this.description,
      this.drAmount,
      this.tax,
      this.taxPercentage,
      this.netTotal,
      this.companyIDPK,
      this.ledgerBalance,
      this.ledgerName});

  factory _$CreditNoteEntryDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditNoteEntryDetailsImplFromJson(json);

  @override
  final String? creditNoteIDPK;
  @override
  final String? ledgerIDPK;
  @override
  final String? description;
  @override
  final double? drAmount;
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
    return 'CreditNoteEntryDetails(creditNoteIDPK: $creditNoteIDPK, ledgerIDPK: $ledgerIDPK, description: $description, drAmount: $drAmount, tax: $tax, taxPercentage: $taxPercentage, netTotal: $netTotal, companyIDPK: $companyIDPK, ledgerBalance: $ledgerBalance, ledgerName: $ledgerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditNoteEntryDetailsImpl &&
            (identical(other.creditNoteIDPK, creditNoteIDPK) ||
                other.creditNoteIDPK == creditNoteIDPK) &&
            (identical(other.ledgerIDPK, ledgerIDPK) ||
                other.ledgerIDPK == ledgerIDPK) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.drAmount, drAmount) ||
                other.drAmount == drAmount) &&
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
      creditNoteIDPK,
      ledgerIDPK,
      description,
      drAmount,
      tax,
      taxPercentage,
      netTotal,
      companyIDPK,
      ledgerBalance,
      ledgerName);

  /// Create a copy of CreditNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditNoteEntryDetailsImplCopyWith<_$CreditNoteEntryDetailsImpl>
      get copyWith => __$$CreditNoteEntryDetailsImplCopyWithImpl<
          _$CreditNoteEntryDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditNoteEntryDetailsImplToJson(
      this,
    );
  }
}

abstract class _CreditNoteEntryDetails implements CreditNoteEntryDetails {
  const factory _CreditNoteEntryDetails(
      {final String? creditNoteIDPK,
      final String? ledgerIDPK,
      final String? description,
      final double? drAmount,
      final double? tax,
      final double? taxPercentage,
      final double? netTotal,
      final String? companyIDPK,
      final double? ledgerBalance,
      final String? ledgerName}) = _$CreditNoteEntryDetailsImpl;

  factory _CreditNoteEntryDetails.fromJson(Map<String, dynamic> json) =
      _$CreditNoteEntryDetailsImpl.fromJson;

  @override
  String? get creditNoteIDPK;
  @override
  String? get ledgerIDPK;
  @override
  String? get description;
  @override
  double? get drAmount;
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

  /// Create a copy of CreditNoteEntryDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditNoteEntryDetailsImplCopyWith<_$CreditNoteEntryDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
