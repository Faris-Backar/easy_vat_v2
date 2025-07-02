// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IncomeCartState {
  List<IncomeCartEntity>? get ledgerList => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get roundOf => throw _privateConstructorUsedError;
  double get grossTotal => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  String? get incomeNo => throw _privateConstructorUsedError;
  String? get refNo => throw _privateConstructorUsedError;
  CustomerEntity? get selectedCustomer => throw _privateConstructorUsedError;
  String? get paymentMode => throw _privateConstructorUsedError;
  String? get soldBy => throw _privateConstructorUsedError;
  LedgerAccountEntity? get cashAccount => throw _privateConstructorUsedError;
  LedgerAccountEntity? get incomeAccount => throw _privateConstructorUsedError;
  LedgerAccountEntity? get drledger => throw _privateConstructorUsedError;
  LedgerAccountEntity? get crledger => throw _privateConstructorUsedError;
  bool? get isForUpdate => throw _privateConstructorUsedError;
  DateTime? get incomeDate => throw _privateConstructorUsedError;
  bool get isTaxEnabled => throw _privateConstructorUsedError;

  /// Create a copy of IncomeCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IncomeCartStateCopyWith<IncomeCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCartStateCopyWith<$Res> {
  factory $IncomeCartStateCopyWith(
          IncomeCartState value, $Res Function(IncomeCartState) then) =
      _$IncomeCartStateCopyWithImpl<$Res, IncomeCartState>;
  @useResult
  $Res call(
      {List<IncomeCartEntity>? ledgerList,
      double totalAmount,
      double discount,
      double roundOf,
      double grossTotal,
      double taxAmount,
      String? incomeNo,
      String? refNo,
      CustomerEntity? selectedCustomer,
      String? paymentMode,
      String? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? incomeAccount,
      LedgerAccountEntity? drledger,
      LedgerAccountEntity? crledger,
      bool? isForUpdate,
      DateTime? incomeDate,
      bool isTaxEnabled});
}

/// @nodoc
class _$IncomeCartStateCopyWithImpl<$Res, $Val extends IncomeCartState>
    implements $IncomeCartStateCopyWith<$Res> {
  _$IncomeCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncomeCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerList = freezed,
    Object? totalAmount = null,
    Object? discount = null,
    Object? roundOf = null,
    Object? grossTotal = null,
    Object? taxAmount = null,
    Object? incomeNo = freezed,
    Object? refNo = freezed,
    Object? selectedCustomer = freezed,
    Object? paymentMode = freezed,
    Object? soldBy = freezed,
    Object? cashAccount = freezed,
    Object? incomeAccount = freezed,
    Object? drledger = freezed,
    Object? crledger = freezed,
    Object? isForUpdate = freezed,
    Object? incomeDate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_value.copyWith(
      ledgerList: freezed == ledgerList
          ? _value.ledgerList
          : ledgerList // ignore: cast_nullable_to_non_nullable
              as List<IncomeCartEntity>?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      roundOf: null == roundOf
          ? _value.roundOf
          : roundOf // ignore: cast_nullable_to_non_nullable
              as double,
      grossTotal: null == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      incomeNo: freezed == incomeNo
          ? _value.incomeNo
          : incomeNo // ignore: cast_nullable_to_non_nullable
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
      incomeAccount: freezed == incomeAccount
          ? _value.incomeAccount
          : incomeAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      drledger: freezed == drledger
          ? _value.drledger
          : drledger // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      crledger: freezed == crledger
          ? _value.crledger
          : crledger // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      isForUpdate: freezed == isForUpdate
          ? _value.isForUpdate
          : isForUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      incomeDate: freezed == incomeDate
          ? _value.incomeDate
          : incomeDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeCartStateImplCopyWith<$Res>
    implements $IncomeCartStateCopyWith<$Res> {
  factory _$$IncomeCartStateImplCopyWith(_$IncomeCartStateImpl value,
          $Res Function(_$IncomeCartStateImpl) then) =
      __$$IncomeCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<IncomeCartEntity>? ledgerList,
      double totalAmount,
      double discount,
      double roundOf,
      double grossTotal,
      double taxAmount,
      String? incomeNo,
      String? refNo,
      CustomerEntity? selectedCustomer,
      String? paymentMode,
      String? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? incomeAccount,
      LedgerAccountEntity? drledger,
      LedgerAccountEntity? crledger,
      bool? isForUpdate,
      DateTime? incomeDate,
      bool isTaxEnabled});
}

/// @nodoc
class __$$IncomeCartStateImplCopyWithImpl<$Res>
    extends _$IncomeCartStateCopyWithImpl<$Res, _$IncomeCartStateImpl>
    implements _$$IncomeCartStateImplCopyWith<$Res> {
  __$$IncomeCartStateImplCopyWithImpl(
      _$IncomeCartStateImpl _value, $Res Function(_$IncomeCartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of IncomeCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerList = freezed,
    Object? totalAmount = null,
    Object? discount = null,
    Object? roundOf = null,
    Object? grossTotal = null,
    Object? taxAmount = null,
    Object? incomeNo = freezed,
    Object? refNo = freezed,
    Object? selectedCustomer = freezed,
    Object? paymentMode = freezed,
    Object? soldBy = freezed,
    Object? cashAccount = freezed,
    Object? incomeAccount = freezed,
    Object? drledger = freezed,
    Object? crledger = freezed,
    Object? isForUpdate = freezed,
    Object? incomeDate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_$IncomeCartStateImpl(
      ledgerList: freezed == ledgerList
          ? _value._ledgerList
          : ledgerList // ignore: cast_nullable_to_non_nullable
              as List<IncomeCartEntity>?,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      roundOf: null == roundOf
          ? _value.roundOf
          : roundOf // ignore: cast_nullable_to_non_nullable
              as double,
      grossTotal: null == grossTotal
          ? _value.grossTotal
          : grossTotal // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      incomeNo: freezed == incomeNo
          ? _value.incomeNo
          : incomeNo // ignore: cast_nullable_to_non_nullable
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
      incomeAccount: freezed == incomeAccount
          ? _value.incomeAccount
          : incomeAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      drledger: freezed == drledger
          ? _value.drledger
          : drledger // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      crledger: freezed == crledger
          ? _value.crledger
          : crledger // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      isForUpdate: freezed == isForUpdate
          ? _value.isForUpdate
          : isForUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      incomeDate: freezed == incomeDate
          ? _value.incomeDate
          : incomeDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IncomeCartStateImpl implements _IncomeCartState {
  const _$IncomeCartStateImpl(
      {final List<IncomeCartEntity>? ledgerList,
      required this.totalAmount,
      required this.discount,
      required this.roundOf,
      required this.grossTotal,
      required this.taxAmount,
      this.incomeNo,
      this.refNo,
      this.selectedCustomer,
      this.paymentMode,
      this.soldBy,
      this.cashAccount,
      this.incomeAccount,
      this.drledger,
      this.crledger,
      this.isForUpdate,
      this.incomeDate,
      required this.isTaxEnabled})
      : _ledgerList = ledgerList;

  final List<IncomeCartEntity>? _ledgerList;
  @override
  List<IncomeCartEntity>? get ledgerList {
    final value = _ledgerList;
    if (value == null) return null;
    if (_ledgerList is EqualUnmodifiableListView) return _ledgerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double totalAmount;
  @override
  final double discount;
  @override
  final double roundOf;
  @override
  final double grossTotal;
  @override
  final double taxAmount;
  @override
  final String? incomeNo;
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
  final LedgerAccountEntity? incomeAccount;
  @override
  final LedgerAccountEntity? drledger;
  @override
  final LedgerAccountEntity? crledger;
  @override
  final bool? isForUpdate;
  @override
  final DateTime? incomeDate;
  @override
  final bool isTaxEnabled;

  @override
  String toString() {
    return 'IncomeCartState(ledgerList: $ledgerList, totalAmount: $totalAmount, discount: $discount, roundOf: $roundOf, grossTotal: $grossTotal, taxAmount: $taxAmount, incomeNo: $incomeNo, refNo: $refNo, selectedCustomer: $selectedCustomer, paymentMode: $paymentMode, soldBy: $soldBy, cashAccount: $cashAccount, incomeAccount: $incomeAccount, drledger: $drledger, crledger: $crledger, isForUpdate: $isForUpdate, incomeDate: $incomeDate, isTaxEnabled: $isTaxEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeCartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._ledgerList, _ledgerList) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.roundOf, roundOf) || other.roundOf == roundOf) &&
            (identical(other.grossTotal, grossTotal) ||
                other.grossTotal == grossTotal) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.incomeNo, incomeNo) ||
                other.incomeNo == incomeNo) &&
            (identical(other.refNo, refNo) || other.refNo == refNo) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.soldBy, soldBy) || other.soldBy == soldBy) &&
            (identical(other.cashAccount, cashAccount) ||
                other.cashAccount == cashAccount) &&
            (identical(other.incomeAccount, incomeAccount) ||
                other.incomeAccount == incomeAccount) &&
            (identical(other.drledger, drledger) ||
                other.drledger == drledger) &&
            (identical(other.crledger, crledger) ||
                other.crledger == crledger) &&
            (identical(other.isForUpdate, isForUpdate) ||
                other.isForUpdate == isForUpdate) &&
            (identical(other.incomeDate, incomeDate) ||
                other.incomeDate == incomeDate) &&
            (identical(other.isTaxEnabled, isTaxEnabled) ||
                other.isTaxEnabled == isTaxEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ledgerList),
      totalAmount,
      discount,
      roundOf,
      grossTotal,
      taxAmount,
      incomeNo,
      refNo,
      selectedCustomer,
      paymentMode,
      soldBy,
      cashAccount,
      incomeAccount,
      drledger,
      crledger,
      isForUpdate,
      incomeDate,
      isTaxEnabled);

  /// Create a copy of IncomeCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeCartStateImplCopyWith<_$IncomeCartStateImpl> get copyWith =>
      __$$IncomeCartStateImplCopyWithImpl<_$IncomeCartStateImpl>(
          this, _$identity);
}

abstract class _IncomeCartState implements IncomeCartState {
  const factory _IncomeCartState(
      {final List<IncomeCartEntity>? ledgerList,
      required final double totalAmount,
      required final double discount,
      required final double roundOf,
      required final double grossTotal,
      required final double taxAmount,
      final String? incomeNo,
      final String? refNo,
      final CustomerEntity? selectedCustomer,
      final String? paymentMode,
      final String? soldBy,
      final LedgerAccountEntity? cashAccount,
      final LedgerAccountEntity? incomeAccount,
      final LedgerAccountEntity? drledger,
      final LedgerAccountEntity? crledger,
      final bool? isForUpdate,
      final DateTime? incomeDate,
      required final bool isTaxEnabled}) = _$IncomeCartStateImpl;

  @override
  List<IncomeCartEntity>? get ledgerList;
  @override
  double get totalAmount;
  @override
  double get discount;
  @override
  double get roundOf;
  @override
  double get grossTotal;
  @override
  double get taxAmount;
  @override
  String? get incomeNo;
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
  LedgerAccountEntity? get incomeAccount;
  @override
  LedgerAccountEntity? get drledger;
  @override
  LedgerAccountEntity? get crledger;
  @override
  bool? get isForUpdate;
  @override
  DateTime? get incomeDate;
  @override
  bool get isTaxEnabled;

  /// Create a copy of IncomeCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomeCartStateImplCopyWith<_$IncomeCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
