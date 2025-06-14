// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseCartState {
  List<ExpenseCartEntity>? get ledgerList => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get roundOf => throw _privateConstructorUsedError;
  double get grossTotal => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  String? get expenseNo => throw _privateConstructorUsedError;
  String? get refNo => throw _privateConstructorUsedError;
  SupplierEntity? get selectedSupplier => throw _privateConstructorUsedError;
  String? get paymentMode => throw _privateConstructorUsedError;
  String? get purchasedBy => throw _privateConstructorUsedError;
  LedgerAccountEntity? get cashAccount => throw _privateConstructorUsedError;
  LedgerAccountEntity? get expenseAccount => throw _privateConstructorUsedError;
  String? get supplierInvoiceNo => throw _privateConstructorUsedError;
  LedgerAccountEntity? get drledger => throw _privateConstructorUsedError;
  LedgerAccountEntity? get crledger => throw _privateConstructorUsedError;
  bool? get isForUpdate => throw _privateConstructorUsedError;
  DateTime? get expenseDate => throw _privateConstructorUsedError;
  bool get isTaxEnabled => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseCartStateCopyWith<ExpenseCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCartStateCopyWith<$Res> {
  factory $ExpenseCartStateCopyWith(
          ExpenseCartState value, $Res Function(ExpenseCartState) then) =
      _$ExpenseCartStateCopyWithImpl<$Res, ExpenseCartState>;
  @useResult
  $Res call(
      {List<ExpenseCartEntity>? ledgerList,
      double totalAmount,
      double discount,
      double roundOf,
      double grossTotal,
      double taxAmount,
      String? expenseNo,
      String? refNo,
      SupplierEntity? selectedSupplier,
      String? paymentMode,
      String? purchasedBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? expenseAccount,
      String? supplierInvoiceNo,
      LedgerAccountEntity? drledger,
      LedgerAccountEntity? crledger,
      bool? isForUpdate,
      DateTime? expenseDate,
      bool isTaxEnabled});
}

/// @nodoc
class _$ExpenseCartStateCopyWithImpl<$Res, $Val extends ExpenseCartState>
    implements $ExpenseCartStateCopyWith<$Res> {
  _$ExpenseCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseCartState
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
    Object? expenseNo = freezed,
    Object? refNo = freezed,
    Object? selectedSupplier = freezed,
    Object? paymentMode = freezed,
    Object? purchasedBy = freezed,
    Object? cashAccount = freezed,
    Object? expenseAccount = freezed,
    Object? supplierInvoiceNo = freezed,
    Object? drledger = freezed,
    Object? crledger = freezed,
    Object? isForUpdate = freezed,
    Object? expenseDate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_value.copyWith(
      ledgerList: freezed == ledgerList
          ? _value.ledgerList
          : ledgerList // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCartEntity>?,
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
      expenseNo: freezed == expenseNo
          ? _value.expenseNo
          : expenseNo // ignore: cast_nullable_to_non_nullable
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
      expenseAccount: freezed == expenseAccount
          ? _value.expenseAccount
          : expenseAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      supplierInvoiceNo: freezed == supplierInvoiceNo
          ? _value.supplierInvoiceNo
          : supplierInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      expenseDate: freezed == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseCartStateImplCopyWith<$Res>
    implements $ExpenseCartStateCopyWith<$Res> {
  factory _$$ExpenseCartStateImplCopyWith(_$ExpenseCartStateImpl value,
          $Res Function(_$ExpenseCartStateImpl) then) =
      __$$ExpenseCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExpenseCartEntity>? ledgerList,
      double totalAmount,
      double discount,
      double roundOf,
      double grossTotal,
      double taxAmount,
      String? expenseNo,
      String? refNo,
      SupplierEntity? selectedSupplier,
      String? paymentMode,
      String? purchasedBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? expenseAccount,
      String? supplierInvoiceNo,
      LedgerAccountEntity? drledger,
      LedgerAccountEntity? crledger,
      bool? isForUpdate,
      DateTime? expenseDate,
      bool isTaxEnabled});
}

/// @nodoc
class __$$ExpenseCartStateImplCopyWithImpl<$Res>
    extends _$ExpenseCartStateCopyWithImpl<$Res, _$ExpenseCartStateImpl>
    implements _$$ExpenseCartStateImplCopyWith<$Res> {
  __$$ExpenseCartStateImplCopyWithImpl(_$ExpenseCartStateImpl _value,
      $Res Function(_$ExpenseCartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseCartState
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
    Object? expenseNo = freezed,
    Object? refNo = freezed,
    Object? selectedSupplier = freezed,
    Object? paymentMode = freezed,
    Object? purchasedBy = freezed,
    Object? cashAccount = freezed,
    Object? expenseAccount = freezed,
    Object? supplierInvoiceNo = freezed,
    Object? drledger = freezed,
    Object? crledger = freezed,
    Object? isForUpdate = freezed,
    Object? expenseDate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_$ExpenseCartStateImpl(
      ledgerList: freezed == ledgerList
          ? _value._ledgerList
          : ledgerList // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCartEntity>?,
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
      expenseNo: freezed == expenseNo
          ? _value.expenseNo
          : expenseNo // ignore: cast_nullable_to_non_nullable
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
      expenseAccount: freezed == expenseAccount
          ? _value.expenseAccount
          : expenseAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      supplierInvoiceNo: freezed == supplierInvoiceNo
          ? _value.supplierInvoiceNo
          : supplierInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      expenseDate: freezed == expenseDate
          ? _value.expenseDate
          : expenseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ExpenseCartStateImpl implements _ExpenseCartState {
  const _$ExpenseCartStateImpl(
      {final List<ExpenseCartEntity>? ledgerList,
      required this.totalAmount,
      required this.discount,
      required this.roundOf,
      required this.grossTotal,
      required this.taxAmount,
      this.expenseNo,
      this.refNo,
      this.selectedSupplier,
      this.paymentMode,
      this.purchasedBy,
      this.cashAccount,
      this.expenseAccount,
      this.supplierInvoiceNo,
      this.drledger,
      this.crledger,
      this.isForUpdate,
      this.expenseDate,
      required this.isTaxEnabled})
      : _ledgerList = ledgerList;

  final List<ExpenseCartEntity>? _ledgerList;
  @override
  List<ExpenseCartEntity>? get ledgerList {
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
  final String? expenseNo;
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
  final LedgerAccountEntity? expenseAccount;
  @override
  final String? supplierInvoiceNo;
  @override
  final LedgerAccountEntity? drledger;
  @override
  final LedgerAccountEntity? crledger;
  @override
  final bool? isForUpdate;
  @override
  final DateTime? expenseDate;
  @override
  final bool isTaxEnabled;

  @override
  String toString() {
    return 'ExpenseCartState(ledgerList: $ledgerList, totalAmount: $totalAmount, discount: $discount, roundOf: $roundOf, grossTotal: $grossTotal, taxAmount: $taxAmount, expenseNo: $expenseNo, refNo: $refNo, selectedSupplier: $selectedSupplier, paymentMode: $paymentMode, purchasedBy: $purchasedBy, cashAccount: $cashAccount, expenseAccount: $expenseAccount, supplierInvoiceNo: $supplierInvoiceNo, drledger: $drledger, crledger: $crledger, isForUpdate: $isForUpdate, expenseDate: $expenseDate, isTaxEnabled: $isTaxEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseCartStateImpl &&
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
            (identical(other.expenseNo, expenseNo) ||
                other.expenseNo == expenseNo) &&
            (identical(other.refNo, refNo) || other.refNo == refNo) &&
            (identical(other.selectedSupplier, selectedSupplier) ||
                other.selectedSupplier == selectedSupplier) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.purchasedBy, purchasedBy) ||
                other.purchasedBy == purchasedBy) &&
            (identical(other.cashAccount, cashAccount) ||
                other.cashAccount == cashAccount) &&
            (identical(other.expenseAccount, expenseAccount) ||
                other.expenseAccount == expenseAccount) &&
            (identical(other.supplierInvoiceNo, supplierInvoiceNo) ||
                other.supplierInvoiceNo == supplierInvoiceNo) &&
            (identical(other.drledger, drledger) ||
                other.drledger == drledger) &&
            (identical(other.crledger, crledger) ||
                other.crledger == crledger) &&
            (identical(other.isForUpdate, isForUpdate) ||
                other.isForUpdate == isForUpdate) &&
            (identical(other.expenseDate, expenseDate) ||
                other.expenseDate == expenseDate) &&
            (identical(other.isTaxEnabled, isTaxEnabled) ||
                other.isTaxEnabled == isTaxEnabled));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_ledgerList),
        totalAmount,
        discount,
        roundOf,
        grossTotal,
        taxAmount,
        expenseNo,
        refNo,
        selectedSupplier,
        paymentMode,
        purchasedBy,
        cashAccount,
        expenseAccount,
        supplierInvoiceNo,
        drledger,
        crledger,
        isForUpdate,
        expenseDate,
        isTaxEnabled
      ]);

  /// Create a copy of ExpenseCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseCartStateImplCopyWith<_$ExpenseCartStateImpl> get copyWith =>
      __$$ExpenseCartStateImplCopyWithImpl<_$ExpenseCartStateImpl>(
          this, _$identity);
}

abstract class _ExpenseCartState implements ExpenseCartState {
  const factory _ExpenseCartState(
      {final List<ExpenseCartEntity>? ledgerList,
      required final double totalAmount,
      required final double discount,
      required final double roundOf,
      required final double grossTotal,
      required final double taxAmount,
      final String? expenseNo,
      final String? refNo,
      final SupplierEntity? selectedSupplier,
      final String? paymentMode,
      final String? purchasedBy,
      final LedgerAccountEntity? cashAccount,
      final LedgerAccountEntity? expenseAccount,
      final String? supplierInvoiceNo,
      final LedgerAccountEntity? drledger,
      final LedgerAccountEntity? crledger,
      final bool? isForUpdate,
      final DateTime? expenseDate,
      required final bool isTaxEnabled}) = _$ExpenseCartStateImpl;

  @override
  List<ExpenseCartEntity>? get ledgerList;
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
  String? get expenseNo;
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
  LedgerAccountEntity? get expenseAccount;
  @override
  String? get supplierInvoiceNo;
  @override
  LedgerAccountEntity? get drledger;
  @override
  LedgerAccountEntity? get crledger;
  @override
  bool? get isForUpdate;
  @override
  DateTime? get expenseDate;
  @override
  bool get isTaxEnabled;

  /// Create a copy of ExpenseCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseCartStateImplCopyWith<_$ExpenseCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
