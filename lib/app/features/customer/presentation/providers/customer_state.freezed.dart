// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerState {
  List<CustomerEntity>? get customerList => throw _privateConstructorUsedError;
  CustomerStateStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerStateCopyWith<CustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStateCopyWith<$Res> {
  factory $CustomerStateCopyWith(
          CustomerState value, $Res Function(CustomerState) then) =
      _$CustomerStateCopyWithImpl<$Res, CustomerState>;
  @useResult
  $Res call(
      {List<CustomerEntity>? customerList,
      CustomerStateStatus status,
      String? errorMessage});
}

/// @nodoc
class _$CustomerStateCopyWithImpl<$Res, $Val extends CustomerState>
    implements $CustomerStateCopyWith<$Res> {
  _$CustomerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerList = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      customerList: freezed == customerList
          ? _value.customerList
          : customerList // ignore: cast_nullable_to_non_nullable
              as List<CustomerEntity>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CustomerStateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerStateImplCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerStateImplCopyWith(
          _$CustomerStateImpl value, $Res Function(_$CustomerStateImpl) then) =
      __$$CustomerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerEntity>? customerList,
      CustomerStateStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$CustomerStateImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerStateImpl>
    implements _$$CustomerStateImplCopyWith<$Res> {
  __$$CustomerStateImplCopyWithImpl(
      _$CustomerStateImpl _value, $Res Function(_$CustomerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerList = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CustomerStateImpl(
      customerList: freezed == customerList
          ? _value._customerList
          : customerList // ignore: cast_nullable_to_non_nullable
              as List<CustomerEntity>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CustomerStateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CustomerStateImpl implements _CustomerState {
  const _$CustomerStateImpl(
      {final List<CustomerEntity>? customerList,
      required this.status,
      this.errorMessage})
      : _customerList = customerList;

  final List<CustomerEntity>? _customerList;
  @override
  List<CustomerEntity>? get customerList {
    final value = _customerList;
    if (value == null) return null;
    if (_customerList is EqualUnmodifiableListView) return _customerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CustomerStateStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CustomerState(customerList: $customerList, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerStateImpl &&
            const DeepCollectionEquality()
                .equals(other._customerList, _customerList) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_customerList), status, errorMessage);

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerStateImplCopyWith<_$CustomerStateImpl> get copyWith =>
      __$$CustomerStateImplCopyWithImpl<_$CustomerStateImpl>(this, _$identity);
}

abstract class _CustomerState implements CustomerState {
  const factory _CustomerState(
      {final List<CustomerEntity>? customerList,
      required final CustomerStateStatus status,
      final String? errorMessage}) = _$CustomerStateImpl;

  @override
  List<CustomerEntity>? get customerList;
  @override
  CustomerStateStatus get status;
  @override
  String? get errorMessage;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerStateImplCopyWith<_$CustomerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
