// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_sales_invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateSalesInvoiceState {
  CustomerEntity? get selectedCustomer => throw _privateConstructorUsedError;
  CreateSalesInvoiceStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CreateSalesInvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSalesInvoiceStateCopyWith<CreateSalesInvoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSalesInvoiceStateCopyWith<$Res> {
  factory $CreateSalesInvoiceStateCopyWith(CreateSalesInvoiceState value,
          $Res Function(CreateSalesInvoiceState) then) =
      _$CreateSalesInvoiceStateCopyWithImpl<$Res, CreateSalesInvoiceState>;
  @useResult
  $Res call(
      {CustomerEntity? selectedCustomer,
      CreateSalesInvoiceStatus status,
      String? errorMessage});
}

/// @nodoc
class _$CreateSalesInvoiceStateCopyWithImpl<$Res,
        $Val extends CreateSalesInvoiceState>
    implements $CreateSalesInvoiceStateCopyWith<$Res> {
  _$CreateSalesInvoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSalesInvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCustomer = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateSalesInvoiceStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateSalesInvoiceStateImplCopyWith<$Res>
    implements $CreateSalesInvoiceStateCopyWith<$Res> {
  factory _$$CreateSalesInvoiceStateImplCopyWith(
          _$CreateSalesInvoiceStateImpl value,
          $Res Function(_$CreateSalesInvoiceStateImpl) then) =
      __$$CreateSalesInvoiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerEntity? selectedCustomer,
      CreateSalesInvoiceStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$CreateSalesInvoiceStateImplCopyWithImpl<$Res>
    extends _$CreateSalesInvoiceStateCopyWithImpl<$Res,
        _$CreateSalesInvoiceStateImpl>
    implements _$$CreateSalesInvoiceStateImplCopyWith<$Res> {
  __$$CreateSalesInvoiceStateImplCopyWithImpl(
      _$CreateSalesInvoiceStateImpl _value,
      $Res Function(_$CreateSalesInvoiceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateSalesInvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCustomer = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CreateSalesInvoiceStateImpl(
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateSalesInvoiceStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateSalesInvoiceStateImpl implements _CreateSalesInvoiceState {
  const _$CreateSalesInvoiceStateImpl(
      {required this.selectedCustomer,
      required this.status,
      this.errorMessage});

  @override
  final CustomerEntity? selectedCustomer;
  @override
  final CreateSalesInvoiceStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CreateSalesInvoiceState(selectedCustomer: $selectedCustomer, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSalesInvoiceStateImpl &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedCustomer, status, errorMessage);

  /// Create a copy of CreateSalesInvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSalesInvoiceStateImplCopyWith<_$CreateSalesInvoiceStateImpl>
      get copyWith => __$$CreateSalesInvoiceStateImplCopyWithImpl<
          _$CreateSalesInvoiceStateImpl>(this, _$identity);
}

abstract class _CreateSalesInvoiceState implements CreateSalesInvoiceState {
  const factory _CreateSalesInvoiceState(
      {required final CustomerEntity? selectedCustomer,
      required final CreateSalesInvoiceStatus status,
      final String? errorMessage}) = _$CreateSalesInvoiceStateImpl;

  @override
  CustomerEntity? get selectedCustomer;
  @override
  CreateSalesInvoiceStatus get status;
  @override
  String? get errorMessage;

  /// Create a copy of CreateSalesInvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSalesInvoiceStateImplCopyWith<_$CreateSalesInvoiceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
