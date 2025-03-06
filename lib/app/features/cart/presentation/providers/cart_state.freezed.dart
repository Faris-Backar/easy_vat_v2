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
  double get totalBeforeTax => throw _privateConstructorUsedError;
  CustomerEntity? get selectedCustomer => throw _privateConstructorUsedError;

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
      double totalBeforeTax,
      CustomerEntity? selectedCustomer});
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
    Object? totalBeforeTax = null,
    Object? selectedCustomer = freezed,
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
      totalBeforeTax: null == totalBeforeTax
          ? _value.totalBeforeTax
          : totalBeforeTax // ignore: cast_nullable_to_non_nullable
              as double,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
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
      double totalBeforeTax,
      CustomerEntity? selectedCustomer});
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
    Object? totalBeforeTax = null,
    Object? selectedCustomer = freezed,
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
      totalBeforeTax: null == totalBeforeTax
          ? _value.totalBeforeTax
          : totalBeforeTax // ignore: cast_nullable_to_non_nullable
              as double,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
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
      required this.totalBeforeTax,
      this.selectedCustomer})
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
  final double totalBeforeTax;
  @override
  final CustomerEntity? selectedCustomer;

  @override
  String toString() {
    return 'CartState(itemList: $itemList, totalAmount: $totalAmount, discount: $discount, roundOf: $roundOf, totalTax: $totalTax, totalBeforeTax: $totalBeforeTax, selectedCustomer: $selectedCustomer)';
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
            (identical(other.totalBeforeTax, totalBeforeTax) ||
                other.totalBeforeTax == totalBeforeTax) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_itemList),
      totalAmount,
      discount,
      roundOf,
      totalTax,
      totalBeforeTax,
      selectedCustomer);

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
      required final double totalBeforeTax,
      final CustomerEntity? selectedCustomer}) = _$CartStateImpl;

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
  double get totalBeforeTax;
  @override
  CustomerEntity? get selectedCustomer;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
