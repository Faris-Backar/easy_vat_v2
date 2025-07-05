// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ledger_mode_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LedgerModeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debitLedger,
    required TResult Function() creditLedger,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? debitLedger,
    TResult? Function()? creditLedger,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debitLedger,
    TResult Function()? creditLedger,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DebitLedger value) debitLedger,
    required TResult Function(_CreditLedger value) creditLedger,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DebitLedger value)? debitLedger,
    TResult? Function(_CreditLedger value)? creditLedger,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DebitLedger value)? debitLedger,
    TResult Function(_CreditLedger value)? creditLedger,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerModeStateCopyWith<$Res> {
  factory $LedgerModeStateCopyWith(
          LedgerModeState value, $Res Function(LedgerModeState) then) =
      _$LedgerModeStateCopyWithImpl<$Res, LedgerModeState>;
}

/// @nodoc
class _$LedgerModeStateCopyWithImpl<$Res, $Val extends LedgerModeState>
    implements $LedgerModeStateCopyWith<$Res> {
  _$LedgerModeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LedgerModeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DebitLedgerImplCopyWith<$Res> {
  factory _$$DebitLedgerImplCopyWith(
          _$DebitLedgerImpl value, $Res Function(_$DebitLedgerImpl) then) =
      __$$DebitLedgerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DebitLedgerImplCopyWithImpl<$Res>
    extends _$LedgerModeStateCopyWithImpl<$Res, _$DebitLedgerImpl>
    implements _$$DebitLedgerImplCopyWith<$Res> {
  __$$DebitLedgerImplCopyWithImpl(
      _$DebitLedgerImpl _value, $Res Function(_$DebitLedgerImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerModeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DebitLedgerImpl implements _DebitLedger {
  const _$DebitLedgerImpl();

  @override
  String toString() {
    return 'LedgerModeState.debitLedger()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DebitLedgerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debitLedger,
    required TResult Function() creditLedger,
  }) {
    return debitLedger();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? debitLedger,
    TResult? Function()? creditLedger,
  }) {
    return debitLedger?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debitLedger,
    TResult Function()? creditLedger,
    required TResult orElse(),
  }) {
    if (debitLedger != null) {
      return debitLedger();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DebitLedger value) debitLedger,
    required TResult Function(_CreditLedger value) creditLedger,
  }) {
    return debitLedger(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DebitLedger value)? debitLedger,
    TResult? Function(_CreditLedger value)? creditLedger,
  }) {
    return debitLedger?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DebitLedger value)? debitLedger,
    TResult Function(_CreditLedger value)? creditLedger,
    required TResult orElse(),
  }) {
    if (debitLedger != null) {
      return debitLedger(this);
    }
    return orElse();
  }
}

abstract class _DebitLedger implements LedgerModeState {
  const factory _DebitLedger() = _$DebitLedgerImpl;
}

/// @nodoc
abstract class _$$CreditLedgerImplCopyWith<$Res> {
  factory _$$CreditLedgerImplCopyWith(
          _$CreditLedgerImpl value, $Res Function(_$CreditLedgerImpl) then) =
      __$$CreditLedgerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreditLedgerImplCopyWithImpl<$Res>
    extends _$LedgerModeStateCopyWithImpl<$Res, _$CreditLedgerImpl>
    implements _$$CreditLedgerImplCopyWith<$Res> {
  __$$CreditLedgerImplCopyWithImpl(
      _$CreditLedgerImpl _value, $Res Function(_$CreditLedgerImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerModeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreditLedgerImpl implements _CreditLedger {
  const _$CreditLedgerImpl();

  @override
  String toString() {
    return 'LedgerModeState.creditLedger()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreditLedgerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debitLedger,
    required TResult Function() creditLedger,
  }) {
    return creditLedger();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? debitLedger,
    TResult? Function()? creditLedger,
  }) {
    return creditLedger?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debitLedger,
    TResult Function()? creditLedger,
    required TResult orElse(),
  }) {
    if (creditLedger != null) {
      return creditLedger();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DebitLedger value) debitLedger,
    required TResult Function(_CreditLedger value) creditLedger,
  }) {
    return creditLedger(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DebitLedger value)? debitLedger,
    TResult? Function(_CreditLedger value)? creditLedger,
  }) {
    return creditLedger?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DebitLedger value)? debitLedger,
    TResult Function(_CreditLedger value)? creditLedger,
    required TResult orElse(),
  }) {
    if (creditLedger != null) {
      return creditLedger(this);
    }
    return orElse();
  }
}

abstract class _CreditLedger implements LedgerModeState {
  const factory _CreditLedger() = _$CreditLedgerImpl;
}
