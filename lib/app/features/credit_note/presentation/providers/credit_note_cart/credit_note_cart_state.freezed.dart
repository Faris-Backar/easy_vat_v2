// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_note_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreditNoteCartState {
  List<CreditNoteCartEntity>? get ledgerList =>
      throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get drAmount => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  String? get creditNoteNo => throw _privateConstructorUsedError;
  String? get refNo => throw _privateConstructorUsedError;
  CustomerEntity? get selectedCustomer => throw _privateConstructorUsedError;
  String? get paymentMode => throw _privateConstructorUsedError;
  String? get soldBy => throw _privateConstructorUsedError;
  LedgerAccountEntity? get cashAccount => throw _privateConstructorUsedError;
  LedgerAccountEntity? get allAccount => throw _privateConstructorUsedError;
  bool? get isForUpdate => throw _privateConstructorUsedError;
  DateTime? get creditNoteDate => throw _privateConstructorUsedError;
  bool get isTaxEnabled => throw _privateConstructorUsedError;

  /// Create a copy of CreditNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditNoteCartStateCopyWith<CreditNoteCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditNoteCartStateCopyWith<$Res> {
  factory $CreditNoteCartStateCopyWith(
          CreditNoteCartState value, $Res Function(CreditNoteCartState) then) =
      _$CreditNoteCartStateCopyWithImpl<$Res, CreditNoteCartState>;
  @useResult
  $Res call(
      {List<CreditNoteCartEntity>? ledgerList,
      double totalAmount,
      double drAmount,
      double taxAmount,
      String? creditNoteNo,
      String? refNo,
      CustomerEntity? selectedCustomer,
      String? paymentMode,
      String? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? allAccount,
      bool? isForUpdate,
      DateTime? creditNoteDate,
      bool isTaxEnabled});
}

/// @nodoc
class _$CreditNoteCartStateCopyWithImpl<$Res, $Val extends CreditNoteCartState>
    implements $CreditNoteCartStateCopyWith<$Res> {
  _$CreditNoteCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerList = freezed,
    Object? totalAmount = null,
    Object? drAmount = null,
    Object? taxAmount = null,
    Object? creditNoteNo = freezed,
    Object? refNo = freezed,
    Object? selectedCustomer = freezed,
    Object? paymentMode = freezed,
    Object? soldBy = freezed,
    Object? cashAccount = freezed,
    Object? allAccount = freezed,
    Object? isForUpdate = freezed,
    Object? creditNoteDate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_value.copyWith(
      ledgerList: freezed == ledgerList
          ? _value.ledgerList
          : ledgerList // ignore: cast_nullable_to_non_nullable
              as List<CreditNoteCartEntity>?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      drAmount: null == drAmount
          ? _value.drAmount
          : drAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      creditNoteNo: freezed == creditNoteNo
          ? _value.creditNoteNo
          : creditNoteNo // ignore: cast_nullable_to_non_nullable
              as String?,
      refNo: freezed == refNo
          ? _value.refNo
          : refNo // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      soldBy: freezed == soldBy
          ? _value.soldBy
          : soldBy // ignore: cast_nullable_to_non_nullable
              as String?,
      cashAccount: freezed == cashAccount
          ? _value.cashAccount
          : cashAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      allAccount: freezed == allAccount
          ? _value.allAccount
          : allAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      isForUpdate: freezed == isForUpdate
          ? _value.isForUpdate
          : isForUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      creditNoteDate: freezed == creditNoteDate
          ? _value.creditNoteDate
          : creditNoteDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditNoteCartStateImplCopyWith<$Res>
    implements $CreditNoteCartStateCopyWith<$Res> {
  factory _$$CreditNoteCartStateImplCopyWith(_$CreditNoteCartStateImpl value,
          $Res Function(_$CreditNoteCartStateImpl) then) =
      __$$CreditNoteCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CreditNoteCartEntity>? ledgerList,
      double totalAmount,
      double drAmount,
      double taxAmount,
      String? creditNoteNo,
      String? refNo,
      CustomerEntity? selectedCustomer,
      String? paymentMode,
      String? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? allAccount,
      bool? isForUpdate,
      DateTime? creditNoteDate,
      bool isTaxEnabled});
}

/// @nodoc
class __$$CreditNoteCartStateImplCopyWithImpl<$Res>
    extends _$CreditNoteCartStateCopyWithImpl<$Res, _$CreditNoteCartStateImpl>
    implements _$$CreditNoteCartStateImplCopyWith<$Res> {
  __$$CreditNoteCartStateImplCopyWithImpl(_$CreditNoteCartStateImpl _value,
      $Res Function(_$CreditNoteCartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerList = freezed,
    Object? totalAmount = null,
    Object? drAmount = null,
    Object? taxAmount = null,
    Object? creditNoteNo = freezed,
    Object? refNo = freezed,
    Object? selectedCustomer = freezed,
    Object? paymentMode = freezed,
    Object? soldBy = freezed,
    Object? cashAccount = freezed,
    Object? allAccount = freezed,
    Object? isForUpdate = freezed,
    Object? creditNoteDate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_$CreditNoteCartStateImpl(
      ledgerList: freezed == ledgerList
          ? _value._ledgerList
          : ledgerList // ignore: cast_nullable_to_non_nullable
              as List<CreditNoteCartEntity>?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      drAmount: null == drAmount
          ? _value.drAmount
          : drAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      creditNoteNo: freezed == creditNoteNo
          ? _value.creditNoteNo
          : creditNoteNo // ignore: cast_nullable_to_non_nullable
              as String?,
      refNo: freezed == refNo
          ? _value.refNo
          : refNo // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      soldBy: freezed == soldBy
          ? _value.soldBy
          : soldBy // ignore: cast_nullable_to_non_nullable
              as String?,
      cashAccount: freezed == cashAccount
          ? _value.cashAccount
          : cashAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      allAccount: freezed == allAccount
          ? _value.allAccount
          : allAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      isForUpdate: freezed == isForUpdate
          ? _value.isForUpdate
          : isForUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      creditNoteDate: freezed == creditNoteDate
          ? _value.creditNoteDate
          : creditNoteDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreditNoteCartStateImpl implements _CreditNoteCartState {
  const _$CreditNoteCartStateImpl(
      {final List<CreditNoteCartEntity>? ledgerList,
      required this.totalAmount,
      required this.drAmount,
      required this.taxAmount,
      this.creditNoteNo,
      this.refNo,
      this.selectedCustomer,
      this.paymentMode,
      this.soldBy,
      this.cashAccount,
      this.allAccount,
      this.isForUpdate,
      this.creditNoteDate,
      required this.isTaxEnabled})
      : _ledgerList = ledgerList;

  final List<CreditNoteCartEntity>? _ledgerList;
  @override
  List<CreditNoteCartEntity>? get ledgerList {
    final value = _ledgerList;
    if (value == null) return null;
    if (_ledgerList is EqualUnmodifiableListView) return _ledgerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double totalAmount;
  @override
  final double drAmount;
  @override
  final double taxAmount;
  @override
  final String? creditNoteNo;
  @override
  final String? refNo;
  @override
  final CustomerEntity? selectedCustomer;
  @override
  final String? paymentMode;
  @override
  final String? soldBy;
  @override
  final LedgerAccountEntity? cashAccount;
  @override
  final LedgerAccountEntity? allAccount;
  @override
  final bool? isForUpdate;
  @override
  final DateTime? creditNoteDate;
  @override
  final bool isTaxEnabled;

  @override
  String toString() {
    return 'CreditNoteCartState(ledgerList: $ledgerList, totalAmount: $totalAmount, drAmount: $drAmount, taxAmount: $taxAmount, creditNoteNo: $creditNoteNo, refNo: $refNo, selectedCustomer: $selectedCustomer, paymentMode: $paymentMode, soldBy: $soldBy, cashAccount: $cashAccount, allAccount: $allAccount, isForUpdate: $isForUpdate, creditNoteDate: $creditNoteDate, isTaxEnabled: $isTaxEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditNoteCartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._ledgerList, _ledgerList) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.drAmount, drAmount) ||
                other.drAmount == drAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.creditNoteNo, creditNoteNo) ||
                other.creditNoteNo == creditNoteNo) &&
            (identical(other.refNo, refNo) || other.refNo == refNo) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.soldBy, soldBy) || other.soldBy == soldBy) &&
            (identical(other.cashAccount, cashAccount) ||
                other.cashAccount == cashAccount) &&
            (identical(other.allAccount, allAccount) ||
                other.allAccount == allAccount) &&
            (identical(other.isForUpdate, isForUpdate) ||
                other.isForUpdate == isForUpdate) &&
            (identical(other.creditNoteDate, creditNoteDate) ||
                other.creditNoteDate == creditNoteDate) &&
            (identical(other.isTaxEnabled, isTaxEnabled) ||
                other.isTaxEnabled == isTaxEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ledgerList),
      totalAmount,
      drAmount,
      taxAmount,
      creditNoteNo,
      refNo,
      selectedCustomer,
      paymentMode,
      soldBy,
      cashAccount,
      allAccount,
      isForUpdate,
      creditNoteDate,
      isTaxEnabled);

  /// Create a copy of CreditNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditNoteCartStateImplCopyWith<_$CreditNoteCartStateImpl> get copyWith =>
      __$$CreditNoteCartStateImplCopyWithImpl<_$CreditNoteCartStateImpl>(
          this, _$identity);
}

abstract class _CreditNoteCartState implements CreditNoteCartState {
  const factory _CreditNoteCartState(
      {final List<CreditNoteCartEntity>? ledgerList,
      required final double totalAmount,
      required final double drAmount,
      required final double taxAmount,
      final String? creditNoteNo,
      final String? refNo,
      final CustomerEntity? selectedCustomer,
      final String? paymentMode,
      final String? soldBy,
      final LedgerAccountEntity? cashAccount,
      final LedgerAccountEntity? allAccount,
      final bool? isForUpdate,
      final DateTime? creditNoteDate,
      required final bool isTaxEnabled}) = _$CreditNoteCartStateImpl;

  @override
  List<CreditNoteCartEntity>? get ledgerList;
  @override
  double get totalAmount;
  @override
  double get drAmount;
  @override
  double get taxAmount;
  @override
  String? get creditNoteNo;
  @override
  String? get refNo;
  @override
  CustomerEntity? get selectedCustomer;
  @override
  String? get paymentMode;
  @override
  String? get soldBy;
  @override
  LedgerAccountEntity? get cashAccount;
  @override
  LedgerAccountEntity? get allAccount;
  @override
  bool? get isForUpdate;
  @override
  DateTime? get creditNoteDate;
  @override
  bool get isTaxEnabled;

  /// Create a copy of CreditNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditNoteCartStateImplCopyWith<_$CreditNoteCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
