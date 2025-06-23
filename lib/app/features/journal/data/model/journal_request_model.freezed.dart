// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JournalRequestModel _$JournalRequestModelFromJson(Map<String, dynamic> json) {
  return _JournalRequestModel.fromJson(json);
}

/// @nodoc
mixin _$JournalRequestModel {
  String? get journalIDPK => throw _privateConstructorUsedError;
  int? get journalNo => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  DateTime? get journalDate => throw _privateConstructorUsedError;
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
  String? get entryMode => throw _privateConstructorUsedError;
  String? get toAccount => throw _privateConstructorUsedError;
  List<JournalDetail>? get journalEntryDetail =>
      throw _privateConstructorUsedError;

  /// Serializes this JournalRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalRequestModelCopyWith<JournalRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalRequestModelCopyWith<$Res> {
  factory $JournalRequestModelCopyWith(
          JournalRequestModel value, $Res Function(JournalRequestModel) then) =
      _$JournalRequestModelCopyWithImpl<$Res, JournalRequestModel>;
  @useResult
  $Res call(
      {String? journalIDPK,
      int? journalNo,
      String? referenceNo,
      DateTime? journalDate,
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
      String? entryMode,
      String? toAccount,
      List<JournalDetail>? journalEntryDetail});
}

/// @nodoc
class _$JournalRequestModelCopyWithImpl<$Res, $Val extends JournalRequestModel>
    implements $JournalRequestModelCopyWith<$Res> {
  _$JournalRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journalIDPK = freezed,
    Object? journalNo = freezed,
    Object? referenceNo = freezed,
    Object? journalDate = freezed,
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
    Object? entryMode = freezed,
    Object? toAccount = freezed,
    Object? journalEntryDetail = freezed,
  }) {
    return _then(_value.copyWith(
      journalIDPK: freezed == journalIDPK
          ? _value.journalIDPK
          : journalIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      journalNo: freezed == journalNo
          ? _value.journalNo
          : journalNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      journalDate: freezed == journalDate
          ? _value.journalDate
          : journalDate // ignore: cast_nullable_to_non_nullable
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
      entryMode: freezed == entryMode
          ? _value.entryMode
          : entryMode // ignore: cast_nullable_to_non_nullable
              as String?,
      toAccount: freezed == toAccount
          ? _value.toAccount
          : toAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      journalEntryDetail: freezed == journalEntryDetail
          ? _value.journalEntryDetail
          : journalEntryDetail // ignore: cast_nullable_to_non_nullable
              as List<JournalDetail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalRequestModelImplCopyWith<$Res>
    implements $JournalRequestModelCopyWith<$Res> {
  factory _$$JournalRequestModelImplCopyWith(_$JournalRequestModelImpl value,
          $Res Function(_$JournalRequestModelImpl) then) =
      __$$JournalRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? journalIDPK,
      int? journalNo,
      String? referenceNo,
      DateTime? journalDate,
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
      String? entryMode,
      String? toAccount,
      List<JournalDetail>? journalEntryDetail});
}

/// @nodoc
class __$$JournalRequestModelImplCopyWithImpl<$Res>
    extends _$JournalRequestModelCopyWithImpl<$Res, _$JournalRequestModelImpl>
    implements _$$JournalRequestModelImplCopyWith<$Res> {
  __$$JournalRequestModelImplCopyWithImpl(_$JournalRequestModelImpl _value,
      $Res Function(_$JournalRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journalIDPK = freezed,
    Object? journalNo = freezed,
    Object? referenceNo = freezed,
    Object? journalDate = freezed,
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
    Object? entryMode = freezed,
    Object? toAccount = freezed,
    Object? journalEntryDetail = freezed,
  }) {
    return _then(_$JournalRequestModelImpl(
      journalIDPK: freezed == journalIDPK
          ? _value.journalIDPK
          : journalIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      journalNo: freezed == journalNo
          ? _value.journalNo
          : journalNo // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      journalDate: freezed == journalDate
          ? _value.journalDate
          : journalDate // ignore: cast_nullable_to_non_nullable
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
      entryMode: freezed == entryMode
          ? _value.entryMode
          : entryMode // ignore: cast_nullable_to_non_nullable
              as String?,
      toAccount: freezed == toAccount
          ? _value.toAccount
          : toAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      journalEntryDetail: freezed == journalEntryDetail
          ? _value._journalEntryDetail
          : journalEntryDetail // ignore: cast_nullable_to_non_nullable
              as List<JournalDetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalRequestModelImpl implements _JournalRequestModel {
  const _$JournalRequestModelImpl(
      {this.journalIDPK,
      this.journalNo,
      this.referenceNo,
      this.journalDate,
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
      this.entryMode,
      this.toAccount,
      final List<JournalDetail>? journalEntryDetail})
      : _journalEntryDetail = journalEntryDetail;

  factory _$JournalRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalRequestModelImplFromJson(json);

  @override
  final String? journalIDPK;
  @override
  final int? journalNo;
  @override
  final String? referenceNo;
  @override
  final DateTime? journalDate;
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
  final String? entryMode;
  @override
  final String? toAccount;
  final List<JournalDetail>? _journalEntryDetail;
  @override
  List<JournalDetail>? get journalEntryDetail {
    final value = _journalEntryDetail;
    if (value == null) return null;
    if (_journalEntryDetail is EqualUnmodifiableListView)
      return _journalEntryDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'JournalRequestModel(journalIDPK: $journalIDPK, journalNo: $journalNo, referenceNo: $referenceNo, journalDate: $journalDate, description: $description, totalAmount: $totalAmount, remarks: $remarks, isEditable: $isEditable, isCanceled: $isCanceled, createdBy: $createdBy, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedDate: $modifiedDate, rowguid: $rowguid, companyIDPK: $companyIDPK, entryMode: $entryMode, toAccount: $toAccount, journalEntryDetail: $journalEntryDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalRequestModelImpl &&
            (identical(other.journalIDPK, journalIDPK) ||
                other.journalIDPK == journalIDPK) &&
            (identical(other.journalNo, journalNo) ||
                other.journalNo == journalNo) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.journalDate, journalDate) ||
                other.journalDate == journalDate) &&
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
            (identical(other.entryMode, entryMode) ||
                other.entryMode == entryMode) &&
            (identical(other.toAccount, toAccount) ||
                other.toAccount == toAccount) &&
            const DeepCollectionEquality()
                .equals(other._journalEntryDetail, _journalEntryDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      journalIDPK,
      journalNo,
      referenceNo,
      journalDate,
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
      entryMode,
      toAccount,
      const DeepCollectionEquality().hash(_journalEntryDetail));

  /// Create a copy of JournalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalRequestModelImplCopyWith<_$JournalRequestModelImpl> get copyWith =>
      __$$JournalRequestModelImplCopyWithImpl<_$JournalRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalRequestModelImplToJson(
      this,
    );
  }
}

abstract class _JournalRequestModel implements JournalRequestModel {
  const factory _JournalRequestModel(
          {final String? journalIDPK,
          final int? journalNo,
          final String? referenceNo,
          final DateTime? journalDate,
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
          final String? entryMode,
          final String? toAccount,
          final List<JournalDetail>? journalEntryDetail}) =
      _$JournalRequestModelImpl;

  factory _JournalRequestModel.fromJson(Map<String, dynamic> json) =
      _$JournalRequestModelImpl.fromJson;

  @override
  String? get journalIDPK;
  @override
  int? get journalNo;
  @override
  String? get referenceNo;
  @override
  DateTime? get journalDate;
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
  String? get entryMode;
  @override
  String? get toAccount;
  @override
  List<JournalDetail>? get journalEntryDetail;

  /// Create a copy of JournalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalRequestModelImplCopyWith<_$JournalRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JournalDetail _$JournalDetailFromJson(Map<String, dynamic> json) {
  return _JournalDetail.fromJson(json);
}

/// @nodoc
mixin _$JournalDetail {
  String? get journalIDPK => throw _privateConstructorUsedError;
  String? get ledgerIDPK => throw _privateConstructorUsedError;
  String? get ledgerName => throw _privateConstructorUsedError;
  double? get currentBalance => throw _privateConstructorUsedError;
  String? get currentBalanceType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get drAmount => throw _privateConstructorUsedError;
  double? get crAmount => throw _privateConstructorUsedError;
  String? get companyIDPK => throw _privateConstructorUsedError;

  /// Serializes this JournalDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalDetailCopyWith<JournalDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalDetailCopyWith<$Res> {
  factory $JournalDetailCopyWith(
          JournalDetail value, $Res Function(JournalDetail) then) =
      _$JournalDetailCopyWithImpl<$Res, JournalDetail>;
  @useResult
  $Res call(
      {String? journalIDPK,
      String? ledgerIDPK,
      String? ledgerName,
      double? currentBalance,
      String? currentBalanceType,
      String? description,
      double? drAmount,
      double? crAmount,
      String? companyIDPK});
}

/// @nodoc
class _$JournalDetailCopyWithImpl<$Res, $Val extends JournalDetail>
    implements $JournalDetailCopyWith<$Res> {
  _$JournalDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journalIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? ledgerName = freezed,
    Object? currentBalance = freezed,
    Object? currentBalanceType = freezed,
    Object? description = freezed,
    Object? drAmount = freezed,
    Object? crAmount = freezed,
    Object? companyIDPK = freezed,
  }) {
    return _then(_value.copyWith(
      journalIDPK: freezed == journalIDPK
          ? _value.journalIDPK
          : journalIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerName: freezed == ledgerName
          ? _value.ledgerName
          : ledgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentBalance: freezed == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      currentBalanceType: freezed == currentBalanceType
          ? _value.currentBalanceType
          : currentBalanceType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      drAmount: freezed == drAmount
          ? _value.drAmount
          : drAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      crAmount: freezed == crAmount
          ? _value.crAmount
          : crAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalDetailImplCopyWith<$Res>
    implements $JournalDetailCopyWith<$Res> {
  factory _$$JournalDetailImplCopyWith(
          _$JournalDetailImpl value, $Res Function(_$JournalDetailImpl) then) =
      __$$JournalDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? journalIDPK,
      String? ledgerIDPK,
      String? ledgerName,
      double? currentBalance,
      String? currentBalanceType,
      String? description,
      double? drAmount,
      double? crAmount,
      String? companyIDPK});
}

/// @nodoc
class __$$JournalDetailImplCopyWithImpl<$Res>
    extends _$JournalDetailCopyWithImpl<$Res, _$JournalDetailImpl>
    implements _$$JournalDetailImplCopyWith<$Res> {
  __$$JournalDetailImplCopyWithImpl(
      _$JournalDetailImpl _value, $Res Function(_$JournalDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journalIDPK = freezed,
    Object? ledgerIDPK = freezed,
    Object? ledgerName = freezed,
    Object? currentBalance = freezed,
    Object? currentBalanceType = freezed,
    Object? description = freezed,
    Object? drAmount = freezed,
    Object? crAmount = freezed,
    Object? companyIDPK = freezed,
  }) {
    return _then(_$JournalDetailImpl(
      journalIDPK: freezed == journalIDPK
          ? _value.journalIDPK
          : journalIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerIDPK: freezed == ledgerIDPK
          ? _value.ledgerIDPK
          : ledgerIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
      ledgerName: freezed == ledgerName
          ? _value.ledgerName
          : ledgerName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentBalance: freezed == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      currentBalanceType: freezed == currentBalanceType
          ? _value.currentBalanceType
          : currentBalanceType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      drAmount: freezed == drAmount
          ? _value.drAmount
          : drAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      crAmount: freezed == crAmount
          ? _value.crAmount
          : crAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      companyIDPK: freezed == companyIDPK
          ? _value.companyIDPK
          : companyIDPK // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalDetailImpl implements _JournalDetail {
  const _$JournalDetailImpl(
      {this.journalIDPK,
      this.ledgerIDPK,
      this.ledgerName,
      this.currentBalance,
      this.currentBalanceType,
      this.description,
      this.drAmount,
      this.crAmount,
      this.companyIDPK});

  factory _$JournalDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalDetailImplFromJson(json);

  @override
  final String? journalIDPK;
  @override
  final String? ledgerIDPK;
  @override
  final String? ledgerName;
  @override
  final double? currentBalance;
  @override
  final String? currentBalanceType;
  @override
  final String? description;
  @override
  final double? drAmount;
  @override
  final double? crAmount;
  @override
  final String? companyIDPK;

  @override
  String toString() {
    return 'JournalDetail(journalIDPK: $journalIDPK, ledgerIDPK: $ledgerIDPK, ledgerName: $ledgerName, currentBalance: $currentBalance, currentBalanceType: $currentBalanceType, description: $description, drAmount: $drAmount, crAmount: $crAmount, companyIDPK: $companyIDPK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalDetailImpl &&
            (identical(other.journalIDPK, journalIDPK) ||
                other.journalIDPK == journalIDPK) &&
            (identical(other.ledgerIDPK, ledgerIDPK) ||
                other.ledgerIDPK == ledgerIDPK) &&
            (identical(other.ledgerName, ledgerName) ||
                other.ledgerName == ledgerName) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.currentBalanceType, currentBalanceType) ||
                other.currentBalanceType == currentBalanceType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.drAmount, drAmount) ||
                other.drAmount == drAmount) &&
            (identical(other.crAmount, crAmount) ||
                other.crAmount == crAmount) &&
            (identical(other.companyIDPK, companyIDPK) ||
                other.companyIDPK == companyIDPK));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      journalIDPK,
      ledgerIDPK,
      ledgerName,
      currentBalance,
      currentBalanceType,
      description,
      drAmount,
      crAmount,
      companyIDPK);

  /// Create a copy of JournalDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalDetailImplCopyWith<_$JournalDetailImpl> get copyWith =>
      __$$JournalDetailImplCopyWithImpl<_$JournalDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalDetailImplToJson(
      this,
    );
  }
}

abstract class _JournalDetail implements JournalDetail {
  const factory _JournalDetail(
      {final String? journalIDPK,
      final String? ledgerIDPK,
      final String? ledgerName,
      final double? currentBalance,
      final String? currentBalanceType,
      final String? description,
      final double? drAmount,
      final double? crAmount,
      final String? companyIDPK}) = _$JournalDetailImpl;

  factory _JournalDetail.fromJson(Map<String, dynamic> json) =
      _$JournalDetailImpl.fromJson;

  @override
  String? get journalIDPK;
  @override
  String? get ledgerIDPK;
  @override
  String? get ledgerName;
  @override
  double? get currentBalance;
  @override
  String? get currentBalanceType;
  @override
  String? get description;
  @override
  double? get drAmount;
  @override
  double? get crAmount;
  @override
  String? get companyIDPK;

  /// Create a copy of JournalDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalDetailImplCopyWith<_$JournalDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
