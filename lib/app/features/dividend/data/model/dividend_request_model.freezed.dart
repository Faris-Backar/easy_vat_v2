// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dividend_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DividendRequestModel _$DividendRequestModelFromJson(Map<String, dynamic> json) {
  return _DividendRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DividendRequestModel {
  String? get dividendIDPK => throw _privateConstructorUsedError;
  int? get dividendNo => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  DateTime? get dividendDate => throw _privateConstructorUsedError;
  String? get paymentMode => throw _privateConstructorUsedError;
  String? get crLedgerIDFK => throw _privateConstructorUsedError;
  String? get drLedgerIDFK => throw _privateConstructorUsedError;
  String? get expenseLedger => throw _privateConstructorUsedError;
  String? get cashAccount => throw _privateConstructorUsedError;
  String? get issuedBy => throw _privateConstructorUsedError;
  double? get netTotal => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  bool? get isEditable => throw _privateConstructorUsedError;
  bool? get isCanceled => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedBy => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  String? get rowguid => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;
  List<DividendDetails>? get dividendDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this DividendRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DividendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DividendRequestModelCopyWith<DividendRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DividendRequestModelCopyWith<$Res> {
  factory $DividendRequestModelCopyWith(DividendRequestModel value,
          $Res Function(DividendRequestModel) then) =
      _$DividendRequestModelCopyWithImpl<$Res, DividendRequestModel>;
  @useResult
  $Res call(
      {String? dividendIDPK,
      int? dividendNo,
      String? referenceNo,
      DateTime? dividendDate,
      String? paymentMode,
      String? crLedgerIDFK,
      String? drLedgerIDFK,
      String? expenseLedger,
      String? cashAccount,
      String? issuedBy,
      double? netTotal,
      String? remarks,
      bool? isEditable,
      bool? isCanceled,
      String? createdBy,
      DateTime? createdDate,
      String? modifiedBy,
      DateTime? modifiedDate,
      String? rowguid,
      String? companyIDPK,
      List<DividendDetails>? dividendDetails});
}

/// @nodoc
class _$DividendRequestModelCopyWithImpl<$Res,
        $Val extends DividendRequestModel>
    implements $DividendRequestModelCopyWith<$Res> {
  _$DividendRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DividendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dividendIDPK = freezed,
    Object? dividendNo = freezed,
    Object? referenceNo = freezed,
    Object? dividendDate = freezed,
    Object? paymentMode = freezed,
    Object? crLedgerIDFK = freezed,
    Object? drLedgerIDFK = freezed,
    Object? expenseLedger = freezed,
    Object? cashAccount = freezed,
    Object? issuedBy = freezed,
    Object? netTotal = freezed,
    Object? remarks = freezed,
    Object? isEditable = freezed,
    Object? isCanceled = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedDate = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
    Object? dividendDetails = freezed,
  }) {
    return _then(_value.copyWith(
      dividendIDPK: freezed == dividendIDPK
          ? _value.dividendIDPK
          : dividendIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      dividendNo: freezed == dividendNo
          ? _value.dividendNo
          : dividendNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      dividendDate: freezed == dividendDate
          ? _value.dividendDate
          : dividendDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      crLedgerIDFK: freezed == crLedgerIDFK
          ? _value.crLedgerIDFK
          : crLedgerIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerIDFK: freezed == drLedgerIDFK
          ? _value.drLedgerIDFK
          : drLedgerIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseLedger: freezed == expenseLedger
          ? _value.expenseLedger
          : expenseLedger // ignore: cast_nullable_to_non_nullable
              as String?,
      cashAccount: freezed == cashAccount
          ? _value.cashAccount
          : cashAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedBy: freezed == issuedBy
          ? _value.issuedBy
          : issuedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
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
      dividendDetails: freezed == dividendDetails
          ? _value.dividendDetails
          : dividendDetails // ignore: cast_nullable_to_non_nullable
              as List<DividendDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DividendRequestModelImplCopyWith<$Res>
    implements $DividendRequestModelCopyWith<$Res> {
  factory _$$DividendRequestModelImplCopyWith(_$DividendRequestModelImpl value,
          $Res Function(_$DividendRequestModelImpl) then) =
      __$$DividendRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dividendIDPK,
      int? dividendNo,
      String? referenceNo,
      DateTime? dividendDate,
      String? paymentMode,
      String? crLedgerIDFK,
      String? drLedgerIDFK,
      String? expenseLedger,
      String? cashAccount,
      String? issuedBy,
      double? netTotal,
      String? remarks,
      bool? isEditable,
      bool? isCanceled,
      String? createdBy,
      DateTime? createdDate,
      String? modifiedBy,
      DateTime? modifiedDate,
      String? rowguid,
      String? companyIDPK,
      List<DividendDetails>? dividendDetails});
}

/// @nodoc
class __$$DividendRequestModelImplCopyWithImpl<$Res>
    extends _$DividendRequestModelCopyWithImpl<$Res, _$DividendRequestModelImpl>
    implements _$$DividendRequestModelImplCopyWith<$Res> {
  __$$DividendRequestModelImplCopyWithImpl(_$DividendRequestModelImpl _value,
      $Res Function(_$DividendRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DividendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dividendIDPK = freezed,
    Object? dividendNo = freezed,
    Object? referenceNo = freezed,
    Object? dividendDate = freezed,
    Object? paymentMode = freezed,
    Object? crLedgerIDFK = freezed,
    Object? drLedgerIDFK = freezed,
    Object? expenseLedger = freezed,
    Object? cashAccount = freezed,
    Object? issuedBy = freezed,
    Object? netTotal = freezed,
    Object? remarks = freezed,
    Object? isEditable = freezed,
    Object? isCanceled = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedDate = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
    Object? dividendDetails = freezed,
  }) {
    return _then(_$DividendRequestModelImpl(
      dividendIDPK: freezed == dividendIDPK
          ? _value.dividendIDPK
          : dividendIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      dividendNo: freezed == dividendNo
          ? _value.dividendNo
          : dividendNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      dividendDate: freezed == dividendDate
          ? _value.dividendDate
          : dividendDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      crLedgerIDFK: freezed == crLedgerIDFK
          ? _value.crLedgerIDFK
          : crLedgerIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      drLedgerIDFK: freezed == drLedgerIDFK
          ? _value.drLedgerIDFK
          : drLedgerIDFK // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseLedger: freezed == expenseLedger
          ? _value.expenseLedger
          : expenseLedger // ignore: cast_nullable_to_non_nullable
              as String?,
      cashAccount: freezed == cashAccount
          ? _value.cashAccount
          : cashAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedBy: freezed == issuedBy
          ? _value.issuedBy
          : issuedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      netTotal: freezed == netTotal
          ? _value.netTotal
          : netTotal // ignore: cast_nullable_to_non_nullable
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
      dividendDetails: freezed == dividendDetails
          ? _value._dividendDetails
          : dividendDetails // ignore: cast_nullable_to_non_nullable
              as List<DividendDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DividendRequestModelImpl implements _DividendRequestModel {
  const _$DividendRequestModelImpl(
      {this.dividendIDPK,
      this.dividendNo,
      this.referenceNo,
      this.dividendDate,
      this.paymentMode,
      this.crLedgerIDFK,
      this.drLedgerIDFK,
      this.expenseLedger,
      this.cashAccount,
      this.issuedBy,
      this.netTotal,
      this.remarks,
      this.isEditable,
      this.isCanceled,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.rowguid,
      this.companyIDPK,
      final List<DividendDetails>? dividendDetails})
      : _dividendDetails = dividendDetails;

  factory _$DividendRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DividendRequestModelImplFromJson(json);

  @override
  final String? dividendIDPK;
  @override
  final int? dividendNo;
  @override
  final String? referenceNo;
  @override
  final DateTime? dividendDate;
  @override
  final String? paymentMode;
  @override
  final String? crLedgerIDFK;
  @override
  final String? drLedgerIDFK;
  @override
  final String? expenseLedger;
  @override
  final String? cashAccount;
  @override
  final String? issuedBy;
  @override
  final double? netTotal;
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
  final List<DividendDetails>? _dividendDetails;
  @override
  List<DividendDetails>? get dividendDetails {
    final value = _dividendDetails;
    if (value == null) return null;
    if (_dividendDetails is EqualUnmodifiableListView) return _dividendDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DividendRequestModel(dividendIDPK: $dividendIDPK, dividendNo: $dividendNo, referenceNo: $referenceNo, dividendDate: $dividendDate, paymentMode: $paymentMode, crLedgerIDFK: $crLedgerIDFK, drLedgerIDFK: $drLedgerIDFK, expenseLedger: $expenseLedger, cashAccount: $cashAccount, issuedBy: $issuedBy, netTotal: $netTotal, remarks: $remarks, isEditable: $isEditable, isCanceled: $isCanceled, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, companyIDPK: $companyIDPK, dividendDetails: $dividendDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DividendRequestModelImpl &&
            (identical(other.dividendIDPK, dividendIDPK) ||
                other.dividendIDPK == dividendIDPK) &&
            (identical(other.dividendNo, dividendNo) ||
                other.dividendNo == dividendNo) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.dividendDate, dividendDate) ||
                other.dividendDate == dividendDate) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.crLedgerIDFK, crLedgerIDFK) ||
                other.crLedgerIDFK == crLedgerIDFK) &&
            (identical(other.drLedgerIDFK, drLedgerIDFK) ||
                other.drLedgerIDFK == drLedgerIDFK) &&
            (identical(other.expenseLedger, expenseLedger) ||
                other.expenseLedger == expenseLedger) &&
            (identical(other.cashAccount, cashAccount) ||
                other.cashAccount == cashAccount) &&
            (identical(other.issuedBy, issuedBy) ||
                other.issuedBy == issuedBy) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
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
            const DeepCollectionEquality()
                .equals(other._dividendDetails, _dividendDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        dividendIDPK,
        dividendNo,
        referenceNo,
        dividendDate,
        paymentMode,
        crLedgerIDFK,
        drLedgerIDFK,
        expenseLedger,
        cashAccount,
        issuedBy,
        netTotal,
        remarks,
        isEditable,
        isCanceled,
        createdBy,
        createdDate,
        modifiedBy,
        modifiedDate,
        rowguid,
        companyIDPK,
        const DeepCollectionEquality().hash(_dividendDetails)
      ]);

  /// Create a copy of DividendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DividendRequestModelImplCopyWith<_$DividendRequestModelImpl>
      get copyWith =>
          __$$DividendRequestModelImplCopyWithImpl<_$DividendRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DividendRequestModelImplToJson(
      this,
    );
  }
}

abstract class _DividendRequestModel implements DividendRequestModel {
  const factory _DividendRequestModel(
          {final String? dividendIDPK,
          final int? dividendNo,
          final String? referenceNo,
          final DateTime? dividendDate,
          final String? paymentMode,
          final String? crLedgerIDFK,
          final String? drLedgerIDFK,
          final String? expenseLedger,
          final String? cashAccount,
          final String? issuedBy,
          final double? netTotal,
          final String? remarks,
          final bool? isEditable,
          final bool? isCanceled,
          final String? createdBy,
          final DateTime? createdDate,
          final String? modifiedBy,
          final DateTime? modifiedDate,
          final String? rowguid,
          final String? companyIDPK,
          final List<DividendDetails>? dividendDetails}) =
      _$DividendRequestModelImpl;

  factory _DividendRequestModel.fromJson(Map<String, dynamic> json) =
      _$DividendRequestModelImpl.fromJson;

  @override
  String? get dividendIDPK;
  @override
  int? get dividendNo;
  @override
  String? get referenceNo;
  @override
  DateTime? get dividendDate;
  @override
  String? get paymentMode;
  @override
  String? get crLedgerIDFK;
  @override
  String? get drLedgerIDFK;
  @override
  String? get expenseLedger;
  @override
  String? get cashAccount;
  @override
  String? get issuedBy;
  @override
  double? get netTotal;
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
  List<DividendDetails>? get dividendDetails;

  /// Create a copy of DividendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DividendRequestModelImplCopyWith<_$DividendRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DividendDetails _$DividendDetailsFromJson(Map<String, dynamic> json) {
  return _DividendDetails.fromJson(json);
}

/// @nodoc
mixin _$DividendDetails {
  String? get dividendIDPK => throw _privateConstructorUsedError;
  String? get ledgerIDPK => throw _privateConstructorUsedError;
  double? get currentBalance => throw _privateConstructorUsedError;
  String? get currentBalanceType => throw _privateConstructorUsedError;
  String? get ledgerName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get netTotal => throw _privateConstructorUsedError;
  String? get rowguid => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;

  /// Serializes this DividendDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DividendDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DividendDetailsCopyWith<DividendDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DividendDetailsCopyWith<$Res> {
  factory $DividendDetailsCopyWith(
          DividendDetails value, $Res Function(DividendDetails) then) =
      _$DividendDetailsCopyWithImpl<$Res, DividendDetails>;
  @useResult
  $Res call(
      {String? dividendIDPK,
      String? ledgerIDPK,
      double? currentBalance,
      String? currentBalanceType,
      String? ledgerName,
      String? description,
      double? netTotal,
      String? rowguid,
      String? companyIDPK});
}

/// @nodoc
class _$DividendDetailsCopyWithImpl<$Res, $Val extends DividendDetails>
    implements $DividendDetailsCopyWith<$Res> {
  _$DividendDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DividendDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dividendIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? currentBalance = freezed,
    Object? currentBalanceType = freezed,
    Object? ledgerName = freezed,
    Object? description = freezed,
    Object? netTotal = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
  }) {
    return _then(_value.copyWith(
      dividendIDPK: freezed == dividendIDPK
          ? _value.dividendIDPK
          : dividendIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      currentBalance: freezed == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      currentBalanceType: freezed == currentBalanceType
          ? _value.currentBalanceType
          : currentBalanceType // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerName: freezed == ledgerName
          ? _value.ledgerName
          : ledgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DividendDetailsImplCopyWith<$Res>
    implements $DividendDetailsCopyWith<$Res> {
  factory _$$DividendDetailsImplCopyWith(_$DividendDetailsImpl value,
          $Res Function(_$DividendDetailsImpl) then) =
      __$$DividendDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dividendIDPK,
      String? ledgerIDPK,
      double? currentBalance,
      String? currentBalanceType,
      String? ledgerName,
      String? description,
      double? netTotal,
      String? rowguid,
      String? companyIDPK});
}

/// @nodoc
class __$$DividendDetailsImplCopyWithImpl<$Res>
    extends _$DividendDetailsCopyWithImpl<$Res, _$DividendDetailsImpl>
    implements _$$DividendDetailsImplCopyWith<$Res> {
  __$$DividendDetailsImplCopyWithImpl(
      _$DividendDetailsImpl _value, $Res Function(_$DividendDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DividendDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dividendIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? currentBalance = freezed,
    Object? currentBalanceType = freezed,
    Object? ledgerName = freezed,
    Object? description = freezed,
    Object? netTotal = freezed,
    Object? rowguid = freezed,
    Object? companyIDPK = freezed,
  }) {
    return _then(_$DividendDetailsImpl(
      dividendIDPK: freezed == dividendIDPK
          ? _value.dividendIDPK
          : dividendIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      currentBalance: freezed == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      currentBalanceType: freezed == currentBalanceType
          ? _value.currentBalanceType
          : currentBalanceType // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerName: freezed == ledgerName
          ? _value.ledgerName
          : ledgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DividendDetailsImpl implements _DividendDetails {
  const _$DividendDetailsImpl(
      {this.dividendIDPK,
      this.ledgerIDPK,
      this.currentBalance,
      this.currentBalanceType,
      this.ledgerName,
      this.description,
      this.netTotal,
      this.rowguid,
      this.companyIDPK});

  factory _$DividendDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DividendDetailsImplFromJson(json);

  @override
  final String? dividendIDPK;
  @override
  final String? ledgerIDPK;
  @override
  final double? currentBalance;
  @override
  final String? currentBalanceType;
  @override
  final String? ledgerName;
  @override
  final String? description;
  @override
  final double? netTotal;
  @override
  final String? rowguid;
  @override
  final String? companyIDPK;

  @override
  String toString() {
    return 'DividendDetails(dividendIDPK: $dividendIDPK, ledgerIDPK: $ledgerIDPK, currentBalance: $currentBalance, currentBalanceType: $currentBalanceType, ledgerName: $ledgerName, description: $description, netTotal: $netTotal, rowguid: $rowguid, companyIDPK: $companyIDPK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DividendDetailsImpl &&
            (identical(other.dividendIDPK, dividendIDPK) ||
                other.dividendIDPK == dividendIDPK) &&
            (identical(other.ledgerIDPK, ledgerIDPK) ||
                other.ledgerIDPK == ledgerIDPK) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.currentBalanceType, currentBalanceType) ||
                other.currentBalanceType == currentBalanceType) &&
            (identical(other.ledgerName, ledgerName) ||
                other.ledgerName == ledgerName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.netTotal, netTotal) ||
                other.netTotal == netTotal) &&
            (identical(other.rowguid, rowguid) || other.rowguid == rowguid) &&
            (identical(other.companyIDPK, companyIDPK) ||
                other.companyIDPK == companyIDPK));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dividendIDPK,
      ledgerIDPK,
      currentBalance,
      currentBalanceType,
      ledgerName,
      description,
      netTotal,
      rowguid,
      companyIDPK);

  /// Create a copy of DividendDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DividendDetailsImplCopyWith<_$DividendDetailsImpl> get copyWith =>
      __$$DividendDetailsImplCopyWithImpl<_$DividendDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DividendDetailsImplToJson(
      this,
    );
  }
}

abstract class _DividendDetails implements DividendDetails {
  const factory _DividendDetails(
      {final String? dividendIDPK,
      final String? ledgerIDPK,
      final double? currentBalance,
      final String? currentBalanceType,
      final String? ledgerName,
      final String? description,
      final double? netTotal,
      final String? rowguid,
      final String? companyIDPK}) = _$DividendDetailsImpl;

  factory _DividendDetails.fromJson(Map<String, dynamic> json) =
      _$DividendDetailsImpl.fromJson;

  @override
  String? get dividendIDPK;
  @override
  String? get ledgerIDPK;
  @override
  double? get currentBalance;
  @override
  String? get currentBalanceType;
  @override
  String? get ledgerName;
  @override
  String? get description;
  @override
  double? get netTotal;
  @override
  String? get rowguid;
  @override
  String? get companyIDPK;

  /// Create a copy of DividendDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DividendDetailsImplCopyWith<_$DividendDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
