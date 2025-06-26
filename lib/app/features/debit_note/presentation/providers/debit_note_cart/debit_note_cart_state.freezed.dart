// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debit_note_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DebitNoteCartState {
  List<DebitNoteCartEntity>? get ledgerList =>
      throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get crAmount => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  String? get debitNoteNo => throw _privateConstructorUsedError;
  String? get refNo => throw _privateConstructorUsedError;
  SupplierEntity? get selectedSupplier => throw _privateConstructorUsedError;
  String? get paymentMode => throw _privateConstructorUsedError;
  String? get purchasedBy => throw _privateConstructorUsedError;
  LedgerAccountEntity? get cashAccount => throw _privateConstructorUsedError;
  LedgerAccountEntity? get allAccount => throw _privateConstructorUsedError;
  bool? get isForUpdate => throw _privateConstructorUsedError;
  DateTime? get debitNoteDate => throw _privateConstructorUsedError;
  bool get isTaxEnabled => throw _privateConstructorUsedError;

  /// Create a copy of DebitNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebitNoteCartStateCopyWith<DebitNoteCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebitNoteCartStateCopyWith<$Res> {
  factory $DebitNoteCartStateCopyWith(
          DebitNoteCartState value, $Res Function(DebitNoteCartState) then) =
      _$DebitNoteCartStateCopyWithImpl<$Res, DebitNoteCartState>;
  @useResult
  $Res call(
      {List<DebitNoteCartEntity>? ledgerList,
      double totalAmount,
      double crAmount,
      double taxAmount,
      String? debitNoteNo,
      String? refNo,
      SupplierEntity? selectedSupplier,
      String? paymentMode,
      String? purchasedBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? allAccount,
      bool? isForUpdate,
      DateTime? debitNoteDate,
      bool isTaxEnabled});
}

/// @nodoc
class _$DebitNoteCartStateCopyWithImpl<$Res, $Val extends DebitNoteCartState>
    implements $DebitNoteCartStateCopyWith<$Res> {
  _$DebitNoteCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebitNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerList = freezed,
    Object? totalAmount = null,
    Object? crAmount = null,
    Object? taxAmount = null,
    Object? debitNoteNo = freezed,
    Object? refNo = freezed,
    Object? selectedSupplier = freezed,
    Object? paymentMode = freezed,
    Object? purchasedBy = freezed,
    Object? cashAccount = freezed,
    Object? allAccount = freezed,
    Object? isForUpdate = freezed,
    Object? debitNoteDate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_value.copyWith(
      ledgerList: freezed == ledgerList
          ? _value.ledgerList
          : ledgerList // ignore: cast_nullable_to_non_nullable
              as List<DebitNoteCartEntity>?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      crAmount: null == crAmount
          ? _value.crAmount
          : crAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      debitNoteNo: freezed == debitNoteNo
          ? _value.debitNoteNo
          : debitNoteNo // ignore: cast_nullable_to_non_nullable
              as String?,
      refNo: freezed == refNo
          ? _value.refNo
          : refNo // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSupplier: freezed == selectedSupplier
          ? _value.selectedSupplier
          : selectedSupplier // ignore: cast_nullable_to_non_nullable
              as SupplierEntity?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
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
      debitNoteDate: freezed == debitNoteDate
          ? _value.debitNoteDate
          : debitNoteDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebitNoteCartStateImplCopyWith<$Res>
    implements $DebitNoteCartStateCopyWith<$Res> {
  factory _$$DebitNoteCartStateImplCopyWith(_$DebitNoteCartStateImpl value,
          $Res Function(_$DebitNoteCartStateImpl) then) =
      __$$DebitNoteCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DebitNoteCartEntity>? ledgerList,
      double totalAmount,
      double crAmount,
      double taxAmount,
      String? debitNoteNo,
      String? refNo,
      SupplierEntity? selectedSupplier,
      String? paymentMode,
      String? purchasedBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? allAccount,
      bool? isForUpdate,
      DateTime? debitNoteDate,
      bool isTaxEnabled});
}

/// @nodoc
class __$$DebitNoteCartStateImplCopyWithImpl<$Res>
    extends _$DebitNoteCartStateCopyWithImpl<$Res, _$DebitNoteCartStateImpl>
    implements _$$DebitNoteCartStateImplCopyWith<$Res> {
  __$$DebitNoteCartStateImplCopyWithImpl(_$DebitNoteCartStateImpl _value,
      $Res Function(_$DebitNoteCartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DebitNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerList = freezed,
    Object? totalAmount = null,
    Object? crAmount = null,
    Object? taxAmount = null,
    Object? debitNoteNo = freezed,
    Object? refNo = freezed,
    Object? selectedSupplier = freezed,
    Object? paymentMode = freezed,
    Object? purchasedBy = freezed,
    Object? cashAccount = freezed,
    Object? allAccount = freezed,
    Object? isForUpdate = freezed,
    Object? debitNoteDate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_$DebitNoteCartStateImpl(
      ledgerList: freezed == ledgerList
          ? _value._ledgerList
          : ledgerList // ignore: cast_nullable_to_non_nullable
              as List<DebitNoteCartEntity>?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      crAmount: null == crAmount
          ? _value.crAmount
          : crAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      debitNoteNo: freezed == debitNoteNo
          ? _value.debitNoteNo
          : debitNoteNo // ignore: cast_nullable_to_non_nullable
              as String?,
      refNo: freezed == refNo
          ? _value.refNo
          : refNo // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSupplier: freezed == selectedSupplier
          ? _value.selectedSupplier
          : selectedSupplier // ignore: cast_nullable_to_non_nullable
              as SupplierEntity?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
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
      debitNoteDate: freezed == debitNoteDate
          ? _value.debitNoteDate
          : debitNoteDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DebitNoteCartStateImpl implements _DebitNoteCartState {
  const _$DebitNoteCartStateImpl(
      {final List<DebitNoteCartEntity>? ledgerList,
      required this.totalAmount,
      required this.crAmount,
      required this.taxAmount,
      this.debitNoteNo,
      this.refNo,
      this.selectedSupplier,
      this.paymentMode,
      this.purchasedBy,
      this.cashAccount,
      this.allAccount,
      this.isForUpdate,
      this.debitNoteDate,
      required this.isTaxEnabled})
      : _ledgerList = ledgerList;

  final List<DebitNoteCartEntity>? _ledgerList;
  @override
  List<DebitNoteCartEntity>? get ledgerList {
    final value = _ledgerList;
    if (value == null) return null;
    if (_ledgerList is EqualUnmodifiableListView) return _ledgerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double totalAmount;
  @override
  final double crAmount;
  @override
  final double taxAmount;
  @override
  final String? debitNoteNo;
  @override
  final String? refNo;
  @override
  final SupplierEntity? selectedSupplier;
  @override
  final String? paymentMode;
  @override
  final String? purchasedBy;
  @override
  final LedgerAccountEntity? cashAccount;
  @override
  final LedgerAccountEntity? allAccount;
  @override
  final bool? isForUpdate;
  @override
  final DateTime? debitNoteDate;
  @override
  final bool isTaxEnabled;

  @override
  String toString() {
    return 'DebitNoteCartState(ledgerList: $ledgerList, totalAmount: $totalAmount, crAmount: $crAmount, taxAmount: $taxAmount, debitNoteNo: $debitNoteNo, refNo: $refNo, selectedSupplier: $selectedSupplier, paymentMode: $paymentMode, purchasedBy: $purchasedBy, cashAccount: $cashAccount, allAccount: $allAccount, isForUpdate: $isForUpdate, debitNoteDate: $debitNoteDate, isTaxEnabled: $isTaxEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebitNoteCartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._ledgerList, _ledgerList) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.crAmount, crAmount) ||
                other.crAmount == crAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.debitNoteNo, debitNoteNo) ||
                other.debitNoteNo == debitNoteNo) &&
            (identical(other.refNo, refNo) || other.refNo == refNo) &&
            (identical(other.selectedSupplier, selectedSupplier) ||
                other.selectedSupplier == selectedSupplier) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.purchasedBy, purchasedBy) ||
                other.purchasedBy == purchasedBy) &&
            (identical(other.cashAccount, cashAccount) ||
                other.cashAccount == cashAccount) &&
            (identical(other.allAccount, allAccount) ||
                other.allAccount == allAccount) &&
            (identical(other.isForUpdate, isForUpdate) ||
                other.isForUpdate == isForUpdate) &&
            (identical(other.debitNoteDate, debitNoteDate) ||
                other.debitNoteDate == debitNoteDate) &&
            (identical(other.isTaxEnabled, isTaxEnabled) ||
                other.isTaxEnabled == isTaxEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ledgerList),
      totalAmount,
      crAmount,
      taxAmount,
      debitNoteNo,
      refNo,
      selectedSupplier,
      paymentMode,
      purchasedBy,
      cashAccount,
      allAccount,
      isForUpdate,
      debitNoteDate,
      isTaxEnabled);

  /// Create a copy of DebitNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebitNoteCartStateImplCopyWith<_$DebitNoteCartStateImpl> get copyWith =>
      __$$DebitNoteCartStateImplCopyWithImpl<_$DebitNoteCartStateImpl>(
          this, _$identity);
}

abstract class _DebitNoteCartState implements DebitNoteCartState {
  const factory _DebitNoteCartState(
      {final List<DebitNoteCartEntity>? ledgerList,
      required final double totalAmount,
      required final double crAmount,
      required final double taxAmount,
      final String? debitNoteNo,
      final String? refNo,
      final SupplierEntity? selectedSupplier,
      final String? paymentMode,
      final String? purchasedBy,
      final LedgerAccountEntity? cashAccount,
      final LedgerAccountEntity? allAccount,
      final bool? isForUpdate,
      final DateTime? debitNoteDate,
      required final bool isTaxEnabled}) = _$DebitNoteCartStateImpl;

  @override
  List<DebitNoteCartEntity>? get ledgerList;
  @override
  double get totalAmount;
  @override
  double get crAmount;
  @override
  double get taxAmount;
  @override
  String? get debitNoteNo;
  @override
  String? get refNo;
  @override
  SupplierEntity? get selectedSupplier;
  @override
  String? get paymentMode;
  @override
  String? get purchasedBy;
  @override
  LedgerAccountEntity? get cashAccount;
  @override
  LedgerAccountEntity? get allAccount;
  @override
  bool? get isForUpdate;
  @override
  DateTime? get debitNoteDate;
  @override
  bool get isTaxEnabled;

  /// Create a copy of DebitNoteCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebitNoteCartStateImplCopyWith<_$DebitNoteCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
