// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  List<CartEntity>? get itemList => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get roundOf => throw _privateConstructorUsedError;
  double get totalTax => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  String? get salesNo => throw _privateConstructorUsedError;
  String? get refNo => throw _privateConstructorUsedError;
  DateTime? get saleDate => throw _privateConstructorUsedError;
  CustomerEntity? get selectedCustomer => throw _privateConstructorUsedError;
  String? get salesMode => throw _privateConstructorUsedError;
  SalesManEntity? get soldBy => throw _privateConstructorUsedError;
  LedgerAccountEntity? get cashAccount => throw _privateConstructorUsedError;
  LedgerAccountEntity? get salesAccount => throw _privateConstructorUsedError;
  bool? get isForUpdate => throw _privateConstructorUsedError;
  bool get isTaxEnabled => throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {List<CartEntity>? itemList,
      double totalAmount,
      double discount,
      double roundOf,
      double totalTax,
      double subtotal,
      String? salesNo,
      String? refNo,
      DateTime? saleDate,
      CustomerEntity? selectedCustomer,
      String? salesMode,
      SalesManEntity? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? salesAccount,
      bool? isForUpdate,
      bool isTaxEnabled});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemList = freezed,
    Object? totalAmount = null,
    Object? discount = null,
    Object? roundOf = null,
    Object? totalTax = null,
    Object? subtotal = null,
    Object? salesNo = freezed,
    Object? refNo = freezed,
    Object? saleDate = freezed,
    Object? selectedCustomer = freezed,
    Object? salesMode = freezed,
    Object? soldBy = freezed,
    Object? cashAccount = freezed,
    Object? salesAccount = freezed,
    Object? isForUpdate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_value.copyWith(
      itemList: freezed == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>?,
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
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      salesNo: freezed == salesNo
          ? _value.salesNo
          : salesNo // ignore: cast_nullable_to_non_nullable
              as String?,
      refNo: freezed == refNo
          ? _value.refNo
          : refNo // ignore: cast_nullable_to_non_nullable
              as String?,
      saleDate: freezed == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      salesMode: freezed == salesMode
          ? _value.salesMode
          : salesMode // ignore: cast_nullable_to_non_nullable
              as String?,
      soldBy: freezed == soldBy
          ? _value.soldBy
          : soldBy // ignore: cast_nullable_to_non_nullable
              as SalesManEntity?,
      cashAccount: freezed == cashAccount
          ? _value.cashAccount
          : cashAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      salesAccount: freezed == salesAccount
          ? _value.salesAccount
          : salesAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      isForUpdate: freezed == isForUpdate
          ? _value.isForUpdate
          : isForUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartEntity>? itemList,
      double totalAmount,
      double discount,
      double roundOf,
      double totalTax,
      double subtotal,
      String? salesNo,
      String? refNo,
      DateTime? saleDate,
      CustomerEntity? selectedCustomer,
      String? salesMode,
      SalesManEntity? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? salesAccount,
      bool? isForUpdate,
      bool isTaxEnabled});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemList = freezed,
    Object? totalAmount = null,
    Object? discount = null,
    Object? roundOf = null,
    Object? totalTax = null,
    Object? subtotal = null,
    Object? salesNo = freezed,
    Object? refNo = freezed,
    Object? saleDate = freezed,
    Object? selectedCustomer = freezed,
    Object? salesMode = freezed,
    Object? soldBy = freezed,
    Object? cashAccount = freezed,
    Object? salesAccount = freezed,
    Object? isForUpdate = freezed,
    Object? isTaxEnabled = null,
  }) {
    return _then(_$CartStateImpl(
      itemList: freezed == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>?,
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
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      salesNo: freezed == salesNo
          ? _value.salesNo
          : salesNo // ignore: cast_nullable_to_non_nullable
              as String?,
      refNo: freezed == refNo
          ? _value.refNo
          : refNo // ignore: cast_nullable_to_non_nullable
              as String?,
      saleDate: freezed == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      salesMode: freezed == salesMode
          ? _value.salesMode
          : salesMode // ignore: cast_nullable_to_non_nullable
              as String?,
      soldBy: freezed == soldBy
          ? _value.soldBy
          : soldBy // ignore: cast_nullable_to_non_nullable
              as SalesManEntity?,
      cashAccount: freezed == cashAccount
          ? _value.cashAccount
          : cashAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      salesAccount: freezed == salesAccount
          ? _value.salesAccount
          : salesAccount // ignore: cast_nullable_to_non_nullable
              as LedgerAccountEntity?,
      isForUpdate: freezed == isForUpdate
          ? _value.isForUpdate
          : isForUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTaxEnabled: null == isTaxEnabled
          ? _value.isTaxEnabled
          : isTaxEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {final List<CartEntity>? itemList,
      required this.totalAmount,
      required this.discount,
      required this.roundOf,
      required this.totalTax,
      required this.subtotal,
      this.salesNo,
      this.refNo,
      this.saleDate,
      this.selectedCustomer,
      this.salesMode,
      this.soldBy,
      this.cashAccount,
      this.salesAccount,
      this.isForUpdate,
      required this.isTaxEnabled})
      : _itemList = itemList;

  final List<CartEntity>? _itemList;
  @override
  List<CartEntity>? get itemList {
    final value = _itemList;
    if (value == null) return null;
    if (_itemList is EqualUnmodifiableListView) return _itemList;
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
  final double totalTax;
  @override
  final double subtotal;
  @override
  final String? salesNo;
  @override
  final String? refNo;
  @override
  final DateTime? saleDate;
  @override
  final CustomerEntity? selectedCustomer;
  @override
  final String? salesMode;
  @override
  final SalesManEntity? soldBy;
  @override
  final LedgerAccountEntity? cashAccount;
  @override
  final LedgerAccountEntity? salesAccount;
  @override
  final bool? isForUpdate;
  @override
  final bool isTaxEnabled;

  @override
  String toString() {
    return 'CartState(itemList: $itemList, totalAmount: $totalAmount, discount: $discount, roundOf: $roundOf, totalTax: $totalTax, subtotal: $subtotal, salesNo: $salesNo, refNo: $refNo, saleDate: $saleDate, selectedCustomer: $selectedCustomer, salesMode: $salesMode, soldBy: $soldBy, cashAccount: $cashAccount, salesAccount: $salesAccount, isForUpdate: $isForUpdate, isTaxEnabled: $isTaxEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            const DeepCollectionEquality().equals(other._itemList, _itemList) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.roundOf, roundOf) || other.roundOf == roundOf) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.salesNo, salesNo) || other.salesNo == salesNo) &&
            (identical(other.refNo, refNo) || other.refNo == refNo) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer) &&
            (identical(other.salesMode, salesMode) ||
                other.salesMode == salesMode) &&
            (identical(other.soldBy, soldBy) || other.soldBy == soldBy) &&
            (identical(other.cashAccount, cashAccount) ||
                other.cashAccount == cashAccount) &&
            (identical(other.salesAccount, salesAccount) ||
                other.salesAccount == salesAccount) &&
            (identical(other.isForUpdate, isForUpdate) ||
                other.isForUpdate == isForUpdate) &&
            (identical(other.isTaxEnabled, isTaxEnabled) ||
                other.isTaxEnabled == isTaxEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_itemList),
      totalAmount,
      discount,
      roundOf,
      totalTax,
      subtotal,
      salesNo,
      refNo,
      saleDate,
      selectedCustomer,
      salesMode,
      soldBy,
      cashAccount,
      salesAccount,
      isForUpdate,
      isTaxEnabled);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {final List<CartEntity>? itemList,
      required final double totalAmount,
      required final double discount,
      required final double roundOf,
      required final double totalTax,
      required final double subtotal,
      final String? salesNo,
      final String? refNo,
      final DateTime? saleDate,
      final CustomerEntity? selectedCustomer,
      final String? salesMode,
      final SalesManEntity? soldBy,
      final LedgerAccountEntity? cashAccount,
      final LedgerAccountEntity? salesAccount,
      final bool? isForUpdate,
      required final bool isTaxEnabled}) = _$CartStateImpl;

  @override
  List<CartEntity>? get itemList;
  @override
  double get totalAmount;
  @override
  double get discount;
  @override
  double get roundOf;
  @override
  double get totalTax;
  @override
  double get subtotal;
  @override
  String? get salesNo;
  @override
  String? get refNo;
  @override
  DateTime? get saleDate;
  @override
  CustomerEntity? get selectedCustomer;
  @override
  String? get salesMode;
  @override
  SalesManEntity? get soldBy;
  @override
  LedgerAccountEntity? get cashAccount;
  @override
  LedgerAccountEntity? get salesAccount;
  @override
  bool? get isForUpdate;
  @override
  bool get isTaxEnabled;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
