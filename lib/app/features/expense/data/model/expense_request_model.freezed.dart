// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseRequestModel _$ExpenseRequestModelFromJson(Map<String, dynamic> json) {
  return _ExpenseRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseRequestModel {
  String? get expenseIDPK => throw _privateConstructorUsedError;
  int? get expenseNo => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  DateTime? get expenseDate => throw _privateConstructorUsedError;
  String? get paymentMode => throw _privateConstructorUsedError;
  String? get purchasedBy => throw _privateConstructorUsedError;
  String? get supplierIDFK => throw _privateConstructorUsedError;
  String? get crLedgerIDFK => throw _privateConstructorUsedError;
  String? get drLedgerIDFK => throw _privateConstructorUsedError;
  String? get supplierInvoiceNo => throw _privateConstructorUsedError;
  double? get grossTotal => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get netTotal => throw _privateConstructorUsedError;
  double? get roundOff => throw _privateConstructorUsedError;
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
  List<ExpenseDetails>? get expenseDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this ExpenseRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseRequestModelCopyWith<ExpenseRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseRequestModelCopyWith<$Res> {
  factory $ExpenseRequestModelCopyWith(
          ExpenseRequestModel value, $Res Function(ExpenseRequestModel) then) =
      _$ExpenseRequestModelCopyWithImpl<$Res, ExpenseRequestModel>;
  @useResult
  $Res call(
      {String? expenseIDPK,
      int? expenseNo,
      String? referenceNo,
      DateTime? expenseDate,
      String? paymentMode,
      String? purchasedBy,
      String? supplierIDFK,
      String? crLedgerIDFK,
      String? drLedgerIDFK,
      String? supplierInvoiceNo,
      double? grossTotal,
      double? discount,
      double? tax,
      double? netTotal,
      double? roundOff,
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
      List<ExpenseDetails>? expenseDetails});
}

/// @nodoc
class _$ExpenseRequestModelCopyWithImpl<$Res, $Val extends ExpenseRequestModel>
    implements $ExpenseRequestModelCopyWith<$Res> {
  _$ExpenseRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseIDPK = freezed,
    Object? expenseNo = freezed,
    Object? referenceNo = freezed,
    Object? expenseDate = freezed,
    Object? paymentMode = freezed,
    Object? purchasedBy = freezed,
    Object? supplierIDFK = freezed,
    Object? crLedgerIDFK = freezed,
    Object? drLedgerIDFK = freezed,
    Object? supplierInvoiceNo = freezed,
    Object? grossTotal = freezed,
    Object? discount = freezed,
    Object? tax = freezed,
    Object? netTotal = freezed,
    Object? roundOff = freezed,
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
    Object? expenseDetails = freezed,
  }) {
    return _then(_value.copyWith(
      expenseIDPK: freezed == expenseIDPK
          ? _value.expenseIDPK
          : expenseIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseNo: freezed == expenseNo
          ? _value.expenseNo
          : expenseNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseDate: freezed == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierIDFK: freezed == supplierIDFK
          ? _value.supplierIDFK
          : supplierIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      crLedgerIDFK: freezed == crLedgerIDFK
          ? _value.crLedgerIDFK
          : crLedgerIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerIDFK: freezed == drLedgerIDFK
          ? _value.drLedgerIDFK
          : drLedgerIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierInvoiceNo: freezed == supplierInvoiceNo
          ? _value.supplierInvoiceNo
          : supplierInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      grossTotal: freezed == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      roundOff: freezed == roundOff
          ? _value.roundOff
          : roundOff // ignore: cast_nullable_to_non_nullable
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
      expenseDetails: freezed == expenseDetails
          ? _value.expenseDetails
          : expenseDetails // ignore: cast_nullable_to_non_nullable
              as List<ExpenseDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseRequestModelImplCopyWith<$Res>
    implements $ExpenseRequestModelCopyWith<$Res> {
  factory _$$ExpenseRequestModelImplCopyWith(_$ExpenseRequestModelImpl value,
          $Res Function(_$ExpenseRequestModelImpl) then) =
      __$$ExpenseRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? expenseIDPK,
      int? expenseNo,
      String? referenceNo,
      DateTime? expenseDate,
      String? paymentMode,
      String? purchasedBy,
      String? supplierIDFK,
      String? crLedgerIDFK,
      String? drLedgerIDFK,
      String? supplierInvoiceNo,
      double? grossTotal,
      double? discount,
      double? tax,
      double? netTotal,
      double? roundOff,
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
      List<ExpenseDetails>? expenseDetails});
}

/// @nodoc
class __$$ExpenseRequestModelImplCopyWithImpl<$Res>
    extends _$ExpenseRequestModelCopyWithImpl<$Res, _$ExpenseRequestModelImpl>
    implements _$$ExpenseRequestModelImplCopyWith<$Res> {
  __$$ExpenseRequestModelImplCopyWithImpl(_$ExpenseRequestModelImpl _value,
      $Res Function(_$ExpenseRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseIDPK = freezed,
    Object? expenseNo = freezed,
    Object? referenceNo = freezed,
    Object? expenseDate = freezed,
    Object? paymentMode = freezed,
    Object? purchasedBy = freezed,
    Object? supplierIDFK = freezed,
    Object? crLedgerIDFK = freezed,
    Object? drLedgerIDFK = freezed,
    Object? supplierInvoiceNo = freezed,
    Object? grossTotal = freezed,
    Object? discount = freezed,
    Object? tax = freezed,
    Object? netTotal = freezed,
    Object? roundOff = freezed,
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
    Object? expenseDetails = freezed,
  }) {
    return _then(_$ExpenseRequestModelImpl(
      expenseIDPK: freezed == expenseIDPK
          ? _value.expenseIDPK
          : expenseIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseNo: freezed == expenseNo
          ? _value.expenseNo
          : expenseNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseDate: freezed == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierIDFK: freezed == supplierIDFK
          ? _value.supplierIDFK
          : supplierIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      crLedgerIDFK: freezed == crLedgerIDFK
          ? _value.crLedgerIDFK
          : crLedgerIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerIDFK: freezed == drLedgerIDFK
          ? _value.drLedgerIDFK
          : drLedgerIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierInvoiceNo: freezed == supplierInvoiceNo
          ? _value.supplierInvoiceNo
          : supplierInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      grossTotal: freezed == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      roundOff: freezed == roundOff
          ? _value.roundOff
          : roundOff // ignore: cast_nullable_to_non_nullable
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
      expenseDetails: freezed == expenseDetails
          ? _value._expenseDetails
          : expenseDetails // ignore: cast_nullable_to_non_nullable
              as List<ExpenseDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseRequestModelImpl implements _ExpenseRequestModel {
  const _$ExpenseRequestModelImpl(
      {this.expenseIDPK,
      this.expenseNo,
      this.referenceNo,
      this.expenseDate,
      this.paymentMode,
      this.purchasedBy,
      this.supplierIDFK,
      this.crLedgerIDFK,
      this.drLedgerIDFK,
      this.supplierInvoiceNo,
      this.grossTotal,
      this.discount,
      this.tax,
      this.netTotal,
      this.roundOff,
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
      final List<ExpenseDetails>? expenseDetails})
      : _expenseDetails = expenseDetails;

  factory _$ExpenseRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseRequestModelImplFromJson(json);

  @override
  final String? expenseIDPK;
  @override
  final int? expenseNo;
  @override
  final String? referenceNo;
  @override
  final DateTime? expenseDate;
  @override
  final String? paymentMode;
  @override
  final String? purchasedBy;
  @override
  final String? supplierIDFK;
  @override
  final String? crLedgerIDFK;
  @override
  final String? drLedgerIDFK;
  @override
  final String? supplierInvoiceNo;
  @override
  final double? grossTotal;
  @override
  final double? discount;
  @override
  final double? tax;
  @override
  final double? netTotal;
  @override
  final double? roundOff;
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
  final List<ExpenseDetails>? _expenseDetails;
  @override
  List<ExpenseDetails>? get expenseDetails {
    final value = _expenseDetails;
    if (value == null) return null;
    if (_expenseDetails is EqualUnmodifiableListView) return _expenseDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExpenseRequestModel(expenseIDPK: $expenseIDPK, expenseNo: $expenseNo, referenceNo: $referenceNo, expenseDate: $expenseDate, paymentMode: $paymentMode, purchasedBy: $purchasedBy, supplierIDFK: $supplierIDFK, crLedgerIDFK: $crLedgerIDFK, drLedgerIDFK: $drLedgerIDFK, supplierInvoiceNo: $supplierInvoiceNo, grossTotal: $grossTotal, discount: $discount, tax: $tax, netTotal: $netTotal, roundOff: $roundOff, remarks: $remarks, isEditable: $isEditable, isCanceled: $isCanceled, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, companyIDPK: $companyIDPK, supplierName: $supplierName, expenseDetails: $expenseDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseRequestModelImpl &&
            (identical(other.expenseIDPK, expenseIDPK) ||
                other.expenseIDPK == expenseIDPK) &&
            (identical(other.expenseNo, expenseNo) ||
                other.expenseNo == expenseNo) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.expenseDate, expenseDate) ||
                other.expenseDate == expenseDate) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.purchasedBy, purchasedBy) ||
                other.purchasedBy == purchasedBy) &&
            (identical(other.supplierIDFK, supplierIDFK) ||
                other.supplierIDFK == supplierIDFK) &&
            (identical(other.crLedgerIDFK, crLedgerIDFK) ||
                other.crLedgerIDFK == crLedgerIDFK) &&
            (identical(other.drLedgerIDFK, drLedgerIDFK) ||
                other.drLedgerIDFK == drLedgerIDFK) &&
            (identical(other.supplierInvoiceNo, supplierInvoiceNo) ||
                other.supplierInvoiceNo == supplierInvoiceNo) &&
            (identical(other.grossTotal, grossTotal) ||
                other.grossTotal == grossTotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
            (identical(other.roundOff, roundOff) ||
                other.roundOff == roundOff) &&
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
            const DeepCollectionEquality()
                .equals(other._expenseDetails, _expenseDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        expenseIDPK,
        expenseNo,
        referenceNo,
        expenseDate,
        paymentMode,
        purchasedBy,
        supplierIDFK,
        crLedgerIDFK,
        drLedgerIDFK,
        supplierInvoiceNo,
        grossTotal,
        discount,
        tax,
        netTotal,
        roundOff,
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
        const DeepCollectionEquality().hash(_expenseDetails)
      ]);

  /// Create a copy of ExpenseRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseRequestModelImplCopyWith<_$ExpenseRequestModelImpl> get copyWith =>
      __$$ExpenseRequestModelImplCopyWithImpl<_$ExpenseRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseRequestModel implements ExpenseRequestModel {
  const factory _ExpenseRequestModel(
      {final String? expenseIDPK,
      final int? expenseNo,
      final String? referenceNo,
      final DateTime? expenseDate,
      final String? paymentMode,
      final String? purchasedBy,
      final String? supplierIDFK,
      final String? crLedgerIDFK,
      final String? drLedgerIDFK,
      final String? supplierInvoiceNo,
      final double? grossTotal,
      final double? discount,
      final double? tax,
      final double? netTotal,
      final double? roundOff,
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
      final List<ExpenseDetails>? expenseDetails}) = _$ExpenseRequestModelImpl;

  factory _ExpenseRequestModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseRequestModelImpl.fromJson;

  @override
  String? get expenseIDPK;
  @override
  int? get expenseNo;
  @override
  String? get referenceNo;
  @override
  DateTime? get expenseDate;
  @override
  String? get paymentMode;
  @override
  String? get purchasedBy;
  @override
  String? get supplierIDFK;
  @override
  String? get crLedgerIDFK;
  @override
  String? get drLedgerIDFK;
  @override
  String? get supplierInvoiceNo;
  @override
  double? get grossTotal;
  @override
  double? get discount;
  @override
  double? get tax;
  @override
  double? get netTotal;
  @override
  double? get roundOff;
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
  List<ExpenseDetails>? get expenseDetails;

  /// Create a copy of ExpenseRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseRequestModelImplCopyWith<_$ExpenseRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseDetails _$ExpenseDetailsFromJson(Map<String, dynamic> json) {
  return _ExpenseDetails.fromJson(json);
}

/// @nodoc
mixin _$ExpenseDetails {
  String? get expenseIDPK => throw _privateConstructorUsedError;
  String? get ledgerIDPK => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get grossTotal => throw _privateConstructorUsedError;
  double? get taxAmount => throw _privateConstructorUsedError;
  double? get taxPercentage => throw _privateConstructorUsedError;
  double? get netTotal => throw _privateConstructorUsedError;
  String? get rowguid => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;
  double? get currentBalance => throw _privateConstructorUsedError;
  String? get ledgerName => throw _privateConstructorUsedError;
  String? get ledgerCode => throw _privateConstructorUsedError;
  double? get openingBalance => throw _privateConstructorUsedError;
  String? get groupName => throw _privateConstructorUsedError;
  String? get nature => throw _privateConstructorUsedError;

  /// Serializes this ExpenseDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseDetailsCopyWith<ExpenseDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseDetailsCopyWith<$Res> {
  factory $ExpenseDetailsCopyWith(
          ExpenseDetails value, $Res Function(ExpenseDetails) then) =
      _$ExpenseDetailsCopyWithImpl<$Res, ExpenseDetails>;
  @useResult
  $Res call(
      {String? expenseIDPK,
      String? ledgerIDPK,
      String? description,
      double? grossTotal,
      double? taxAmount,
      double? taxPercentage,
      double? netTotal,
      String? rowguid,
      String? companyIDPK,
      double? currentBalance,
      String? ledgerName,
      String? ledgerCode,
      double? openingBalance,
      String? groupName,
      String? nature});
}

/// @nodoc
class _$ExpenseDetailsCopyWithImpl<$Res, $Val extends ExpenseDetails>
    implements $ExpenseDetailsCopyWith<$Res> {
  _$ExpenseDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? description = freezed,
    Object? grossTotal = freezed,
    Object? taxAmount = freezed,
    Object? taxPercentage = freezed,
    Object? netTotal = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
    Object? currentBalance = freezed,
    Object? ledgerName = freezed,
    Object? ledgerCode = freezed,
    Object? openingBalance = freezed,
    Object? groupName = freezed,
    Object? nature = freezed,
  }) {
    return _then(_value.copyWith(
      expenseIDPK: freezed == expenseIDPK
          ? _value.expenseIDPK
          : expenseIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      grossTotal: freezed == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      currentBalance: freezed == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      ledgerName: freezed == ledgerName
          ? _value.ledgerName
          : ledgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerCode: freezed == ledgerCode
          ? _value.ledgerCode
          : ledgerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      openingBalance: freezed == openingBalance
          ? _value.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      nature: freezed == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseDetailsImplCopyWith<$Res>
    implements $ExpenseDetailsCopyWith<$Res> {
  factory _$$ExpenseDetailsImplCopyWith(_$ExpenseDetailsImpl value,
          $Res Function(_$ExpenseDetailsImpl) then) =
      __$$ExpenseDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? expenseIDPK,
      String? ledgerIDPK,
      String? description,
      double? grossTotal,
      double? taxAmount,
      double? taxPercentage,
      double? netTotal,
      String? rowguid,
      String? companyIDPK,
      double? currentBalance,
      String? ledgerName,
      String? ledgerCode,
      double? openingBalance,
      String? groupName,
      String? nature});
}

/// @nodoc
class __$$ExpenseDetailsImplCopyWithImpl<$Res>
    extends _$ExpenseDetailsCopyWithImpl<$Res, _$ExpenseDetailsImpl>
    implements _$$ExpenseDetailsImplCopyWith<$Res> {
  __$$ExpenseDetailsImplCopyWithImpl(
      _$ExpenseDetailsImpl _value, $Res Function(_$ExpenseDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? description = freezed,
    Object? grossTotal = freezed,
    Object? taxAmount = freezed,
    Object? taxPercentage = freezed,
    Object? netTotal = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
    Object? currentBalance = freezed,
    Object? ledgerName = freezed,
    Object? ledgerCode = freezed,
    Object? openingBalance = freezed,
    Object? groupName = freezed,
    Object? nature = freezed,
  }) {
    return _then(_$ExpenseDetailsImpl(
      expenseIDPK: freezed == expenseIDPK
          ? _value.expenseIDPK
          : expenseIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      grossTotal: freezed == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      rowguid: freezed == rowguid
          ? _value.rowguid
          : rowguid // ignore: cast_nullable_to_non_nullable
              as String?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      currentBalance: freezed == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      ledgerName: freezed == ledgerName
          ? _value.ledgerName
          : ledgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerCode: freezed == ledgerCode
          ? _value.ledgerCode
          : ledgerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      openingBalance: freezed == openingBalance
          ? _value.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      nature: freezed == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseDetailsImpl implements _ExpenseDetails {
  const _$ExpenseDetailsImpl(
      {this.expenseIDPK,
      this.ledgerIDPK,
      this.description,
      this.grossTotal,
      this.taxAmount,
      this.taxPercentage,
      this.netTotal,
      this.rowguid,
      this.companyIDPK,
      this.currentBalance,
      this.ledgerName,
      this.ledgerCode,
      this.openingBalance,
      this.groupName,
      this.nature});

  factory _$ExpenseDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseDetailsImplFromJson(json);

  @override
  final String? expenseIDPK;
  @override
  final String? ledgerIDPK;
  @override
  final String? description;
  @override
  final double? grossTotal;
  @override
  final double? taxAmount;
  @override
  final double? taxPercentage;
  @override
  final double? netTotal;
  @override
  final String? rowguid;
  @override
  final String? companyIDPK;
  @override
  final double? currentBalance;
  @override
  final String? ledgerName;
  @override
  final String? ledgerCode;
  @override
  final double? openingBalance;
  @override
  final String? groupName;
  @override
  final String? nature;

  @override
  String toString() {
    return 'ExpenseDetails(expenseIDPK: $expenseIDPK, ledgerIDPK: $ledgerIDPK, description: $description, grossTotal: $grossTotal, taxAmount: $taxAmount, taxPercentage: $taxPercentage, netTotal: $netTotal, rowguid: $rowguid, companyIDPK: $companyIDPK, currentBalance: $currentBalance, ledgerName: $ledgerName, ledgerCode: $ledgerCode, openingBalance: $openingBalance, groupName: $groupName, nature: $nature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseDetailsImpl &&
            (identical(other.expenseIDPK, expenseIDPK) ||
                other.expenseIDPK == expenseIDPK) &&
            (identical(other.ledgerIDPK, ledgerIDPK) ||
                other.ledgerIDPK == ledgerIDPK) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.grossTotal, grossTotal) ||
                other.grossTotal == grossTotal) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
            (identical(other.rowguid, rowguid) || other.rowguid == rowguid) &&
            (identical(other.companyIDPK, companyIDPK) ||
                other.companyIDPK == companyIDPK) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.ledgerName, ledgerName) ||
                other.ledgerName == ledgerName) &&
            (identical(other.ledgerCode, ledgerCode) ||
                other.ledgerCode == ledgerCode) &&
            (identical(other.openingBalance, openingBalance) ||
                other.openingBalance == openingBalance) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.nature, nature) || other.nature == nature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      expenseIDPK,
      ledgerIDPK,
      description,
      grossTotal,
      taxAmount,
      taxPercentage,
      netTotal,
      rowguid,
      companyIDPK,
      currentBalance,
      ledgerName,
      ledgerCode,
      openingBalance,
      groupName,
      nature);

  /// Create a copy of ExpenseDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseDetailsImplCopyWith<_$ExpenseDetailsImpl> get copyWith =>
      __$$ExpenseDetailsImplCopyWithImpl<_$ExpenseDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseDetailsImplToJson(
      this,
    );
  }
}

abstract class _ExpenseDetails implements ExpenseDetails {
  const factory _ExpenseDetails(
      {final String? expenseIDPK,
      final String? ledgerIDPK,
      final String? description,
      final double? grossTotal,
      final double? taxAmount,
      final double? taxPercentage,
      final double? netTotal,
      final String? rowguid,
      final String? companyIDPK,
      final double? currentBalance,
      final String? ledgerName,
      final String? ledgerCode,
      final double? openingBalance,
      final String? groupName,
      final String? nature}) = _$ExpenseDetailsImpl;

  factory _ExpenseDetails.fromJson(Map<String, dynamic> json) =
      _$ExpenseDetailsImpl.fromJson;

  @override
  String? get expenseIDPK;
  @override
  String? get ledgerIDPK;
  @override
  String? get description;
  @override
  double? get grossTotal;
  @override
  double? get taxAmount;
  @override
  double? get taxPercentage;
  @override
  double? get netTotal;
  @override
  String? get rowguid;
  @override
  String? get companyIDPK;
  @override
  double? get currentBalance;
  @override
  String? get ledgerName;
  @override
  String? get ledgerCode;
  @override
  double? get openingBalance;
  @override
  String? get groupName;
  @override
  String? get nature;

  /// Create a copy of ExpenseDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseDetailsImplCopyWith<_$ExpenseDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
