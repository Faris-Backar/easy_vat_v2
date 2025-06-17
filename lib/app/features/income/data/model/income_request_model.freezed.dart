// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IncomeRequestModel _$IncomeRequestModelFromJson(Map<String, dynamic> json) {
  return _IncomeRequestModel.fromJson(json);
}

/// @nodoc
mixin _$IncomeRequestModel {
  String? get incomeIDPK => throw _privateConstructorUsedError;
  int? get incomeNo => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  DateTime? get incomeDate => throw _privateConstructorUsedError;
  String? get paymentMode => throw _privateConstructorUsedError;
  String? get purchasedBy => throw _privateConstructorUsedError;
  String? get customerIDFK => throw _privateConstructorUsedError;
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
  String? get customerName => throw _privateConstructorUsedError;
  List<IncomeDetails>? get incomeDetails => throw _privateConstructorUsedError;

  /// Serializes this IncomeRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IncomeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IncomeRequestModelCopyWith<IncomeRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeRequestModelCopyWith<$Res> {
  factory $IncomeRequestModelCopyWith(
          IncomeRequestModel value, $Res Function(IncomeRequestModel) then) =
      _$IncomeRequestModelCopyWithImpl<$Res, IncomeRequestModel>;
  @useResult
  $Res call(
      {String? incomeIDPK,
      int? incomeNo,
      String? referenceNo,
      DateTime? incomeDate,
      String? paymentMode,
      String? purchasedBy,
      String? customerIDFK,
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
      String? customerName,
      List<IncomeDetails>? incomeDetails});
}

/// @nodoc
class _$IncomeRequestModelCopyWithImpl<$Res, $Val extends IncomeRequestModel>
    implements $IncomeRequestModelCopyWith<$Res> {
  _$IncomeRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncomeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeIDPK = freezed,
    Object? incomeNo = freezed,
    Object? referenceNo = freezed,
    Object? incomeDate = freezed,
    Object? paymentMode = freezed,
    Object? purchasedBy = freezed,
    Object? customerIDFK = freezed,
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
    Object? customerName = freezed,
    Object? incomeDetails = freezed,
  }) {
    return _then(_value.copyWith(
      incomeIDPK: freezed == incomeIDPK
          ? _value.incomeIDPK
          : incomeIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      incomeNo: freezed == incomeNo
          ? _value.incomeNo
          : incomeNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      incomeDate: freezed == incomeDate
          ? _value.incomeDate
          : incomeDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIDFK: freezed == customerIDFK
          ? _value.customerIDFK
          : customerIDFK // ignore: cast_nullable_to_non_nullable
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
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      incomeDetails: freezed == incomeDetails
          ? _value.incomeDetails
          : incomeDetails // ignore: cast_nullable_to_non_nullable
              as List<IncomeDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeRequestModelImplCopyWith<$Res>
    implements $IncomeRequestModelCopyWith<$Res> {
  factory _$$IncomeRequestModelImplCopyWith(_$IncomeRequestModelImpl value,
          $Res Function(_$IncomeRequestModelImpl) then) =
      __$$IncomeRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? incomeIDPK,
      int? incomeNo,
      String? referenceNo,
      DateTime? incomeDate,
      String? paymentMode,
      String? purchasedBy,
      String? customerIDFK,
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
      String? customerName,
      List<IncomeDetails>? incomeDetails});
}

/// @nodoc
class __$$IncomeRequestModelImplCopyWithImpl<$Res>
    extends _$IncomeRequestModelCopyWithImpl<$Res, _$IncomeRequestModelImpl>
    implements _$$IncomeRequestModelImplCopyWith<$Res> {
  __$$IncomeRequestModelImplCopyWithImpl(_$IncomeRequestModelImpl _value,
      $Res Function(_$IncomeRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IncomeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeIDPK = freezed,
    Object? incomeNo = freezed,
    Object? referenceNo = freezed,
    Object? incomeDate = freezed,
    Object? paymentMode = freezed,
    Object? purchasedBy = freezed,
    Object? customerIDFK = freezed,
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
    Object? customerName = freezed,
    Object? incomeDetails = freezed,
  }) {
    return _then(_$IncomeRequestModelImpl(
      incomeIDPK: freezed == incomeIDPK
          ? _value.incomeIDPK
          : incomeIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      incomeNo: freezed == incomeNo
          ? _value.incomeNo
          : incomeNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      incomeDate: freezed == incomeDate
          ? _value.incomeDate
          : incomeDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIDFK: freezed == customerIDFK
          ? _value.customerIDFK
          : customerIDFK // ignore: cast_nullable_to_non_nullable
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
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      incomeDetails: freezed == incomeDetails
          ? _value._incomeDetails
          : incomeDetails // ignore: cast_nullable_to_non_nullable
              as List<IncomeDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeRequestModelImpl implements _IncomeRequestModel {
  const _$IncomeRequestModelImpl(
      {this.incomeIDPK,
      this.incomeNo,
      this.referenceNo,
      this.incomeDate,
      this.paymentMode,
      this.purchasedBy,
      this.customerIDFK,
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
      this.customerName,
      final List<IncomeDetails>? incomeDetails})
      : _incomeDetails = incomeDetails;

  factory _$IncomeRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeRequestModelImplFromJson(json);

  @override
  final String? incomeIDPK;
  @override
  final int? incomeNo;
  @override
  final String? referenceNo;
  @override
  final DateTime? incomeDate;
  @override
  final String? paymentMode;
  @override
  final String? purchasedBy;
  @override
  final String? customerIDFK;
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
  final String? customerName;
  final List<IncomeDetails>? _incomeDetails;
  @override
  List<IncomeDetails>? get incomeDetails {
    final value = _incomeDetails;
    if (value == null) return null;
    if (_incomeDetails is EqualUnmodifiableListView) return _incomeDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IncomeRequestModel(incomeIDPK: $incomeIDPK, incomeNo: $incomeNo, referenceNo: $referenceNo, incomeDate: $incomeDate, paymentMode: $paymentMode, purchasedBy: $purchasedBy, customerIDFK: $customerIDFK, crLedgerIDFK: $crLedgerIDFK, drLedgerIDFK: $drLedgerIDFK, supplierInvoiceNo: $supplierInvoiceNo, grossTotal: $grossTotal, discount: $discount, tax: $tax, netTotal: $netTotal, roundOff: $roundOff, remarks: $remarks, isEditable: $isEditable, isCanceled: $isCanceled, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, companyIDPK: $companyIDPK, customerName: $customerName, incomeDetails: $incomeDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeRequestModelImpl &&
            (identical(other.incomeIDPK, incomeIDPK) ||
                other.incomeIDPK == incomeIDPK) &&
            (identical(other.incomeNo, incomeNo) ||
                other.incomeNo == incomeNo) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.incomeDate, incomeDate) ||
                other.incomeDate == incomeDate) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.purchasedBy, purchasedBy) ||
                other.purchasedBy == purchasedBy) &&
            (identical(other.customerIDFK, customerIDFK) ||
                other.customerIDFK == customerIDFK) &&
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
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            const DeepCollectionEquality()
                .equals(other._incomeDetails, _incomeDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        incomeIDPK,
        incomeNo,
        referenceNo,
        incomeDate,
        paymentMode,
        purchasedBy,
        customerIDFK,
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
        customerName,
        const DeepCollectionEquality().hash(_incomeDetails)
      ]);

  /// Create a copy of IncomeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeRequestModelImplCopyWith<_$IncomeRequestModelImpl> get copyWith =>
      __$$IncomeRequestModelImplCopyWithImpl<_$IncomeRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeRequestModelImplToJson(
      this,
    );
  }
}

abstract class _IncomeRequestModel implements IncomeRequestModel {
  const factory _IncomeRequestModel(
      {final String? incomeIDPK,
      final int? incomeNo,
      final String? referenceNo,
      final DateTime? incomeDate,
      final String? paymentMode,
      final String? purchasedBy,
      final String? customerIDFK,
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
      final String? customerName,
      final List<IncomeDetails>? incomeDetails}) = _$IncomeRequestModelImpl;

  factory _IncomeRequestModel.fromJson(Map<String, dynamic> json) =
      _$IncomeRequestModelImpl.fromJson;

  @override
  String? get incomeIDPK;
  @override
  int? get incomeNo;
  @override
  String? get referenceNo;
  @override
  DateTime? get incomeDate;
  @override
  String? get paymentMode;
  @override
  String? get purchasedBy;
  @override
  String? get customerIDFK;
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
  String? get customerName;
  @override
  List<IncomeDetails>? get incomeDetails;

  /// Create a copy of IncomeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomeRequestModelImplCopyWith<_$IncomeRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IncomeDetails _$IncomeDetailsFromJson(Map<String, dynamic> json) {
  return _IncomeDetails.fromJson(json);
}

/// @nodoc
mixin _$IncomeDetails {
  String? get incomeIDPK => throw _privateConstructorUsedError;
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

  /// Serializes this IncomeDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IncomeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IncomeDetailsCopyWith<IncomeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeDetailsCopyWith<$Res> {
  factory $IncomeDetailsCopyWith(
          IncomeDetails value, $Res Function(IncomeDetails) then) =
      _$IncomeDetailsCopyWithImpl<$Res, IncomeDetails>;
  @useResult
  $Res call(
      {String? incomeIDPK,
      String? ledgerIDPK,
      String? description,
      double? grossTotal,
      double? taxAmount,
      double? taxPercentage,
      double? netTotal,
      String? rowguid,
      String? companyIDPK,
      double? currentBalance,
      String? ledgerName});
}

/// @nodoc
class _$IncomeDetailsCopyWithImpl<$Res, $Val extends IncomeDetails>
    implements $IncomeDetailsCopyWith<$Res> {
  _$IncomeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncomeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeIDPK = freezed,
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
  }) {
    return _then(_value.copyWith(
      incomeIDPK: freezed == incomeIDPK
          ? _value.incomeIDPK
          : incomeIDPK // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeDetailsImplCopyWith<$Res>
    implements $IncomeDetailsCopyWith<$Res> {
  factory _$$IncomeDetailsImplCopyWith(
          _$IncomeDetailsImpl value, $Res Function(_$IncomeDetailsImpl) then) =
      __$$IncomeDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? incomeIDPK,
      String? ledgerIDPK,
      String? description,
      double? grossTotal,
      double? taxAmount,
      double? taxPercentage,
      double? netTotal,
      String? rowguid,
      String? companyIDPK,
      double? currentBalance,
      String? ledgerName});
}

/// @nodoc
class __$$IncomeDetailsImplCopyWithImpl<$Res>
    extends _$IncomeDetailsCopyWithImpl<$Res, _$IncomeDetailsImpl>
    implements _$$IncomeDetailsImplCopyWith<$Res> {
  __$$IncomeDetailsImplCopyWithImpl(
      _$IncomeDetailsImpl _value, $Res Function(_$IncomeDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of IncomeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeIDPK = freezed,
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
  }) {
    return _then(_$IncomeDetailsImpl(
      incomeIDPK: freezed == incomeIDPK
          ? _value.incomeIDPK
          : incomeIDPK // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeDetailsImpl implements _IncomeDetails {
  const _$IncomeDetailsImpl(
      {this.incomeIDPK,
      this.ledgerIDPK,
      this.description,
      this.grossTotal,
      this.taxAmount,
      this.taxPercentage,
      this.netTotal,
      this.rowguid,
      this.companyIDPK,
      this.currentBalance,
      this.ledgerName});

  factory _$IncomeDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeDetailsImplFromJson(json);

  @override
  final String? incomeIDPK;
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
  String toString() {
    return 'IncomeDetails(incomeIDPK: $incomeIDPK, ledgerIDPK: $ledgerIDPK, description: $description, grossTotal: $grossTotal, taxAmount: $taxAmount, taxPercentage: $taxPercentage, netTotal: $netTotal, rowguid: $rowguid, companyIDPK: $companyIDPK, currentBalance: $currentBalance, ledgerName: $ledgerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeDetailsImpl &&
            (identical(other.incomeIDPK, incomeIDPK) ||
                other.incomeIDPK == incomeIDPK) &&
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
                other.ledgerName == ledgerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      incomeIDPK,
      ledgerIDPK,
      description,
      grossTotal,
      taxAmount,
      taxPercentage,
      netTotal,
      rowguid,
      companyIDPK,
      currentBalance,
      ledgerName);

  /// Create a copy of IncomeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeDetailsImplCopyWith<_$IncomeDetailsImpl> get copyWith =>
      __$$IncomeDetailsImplCopyWithImpl<_$IncomeDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeDetailsImplToJson(
      this,
    );
  }
}

abstract class _IncomeDetails implements IncomeDetails {
  const factory _IncomeDetails(
      {final String? incomeIDPK,
      final String? ledgerIDPK,
      final String? description,
      final double? grossTotal,
      final double? taxAmount,
      final double? taxPercentage,
      final double? netTotal,
      final String? rowguid,
      final String? companyIDPK,
      final double? currentBalance,
      final String? ledgerName}) = _$IncomeDetailsImpl;

  factory _IncomeDetails.fromJson(Map<String, dynamic> json) =
      _$IncomeDetailsImpl.fromJson;

  @override
  String? get incomeIDPK;
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

  /// Create a copy of IncomeDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomeDetailsImplCopyWith<_$IncomeDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
