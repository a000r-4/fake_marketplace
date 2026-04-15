// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthCubitInitial value) initial,
    required TResult Function(_AuthCubitAuthenticated value) authenticated,
    required TResult Function(_AuthCubitUnauthenticated value) unauthenticated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthCubitInitial value)? initial,
    TResult? Function(_AuthCubitAuthenticated value)? authenticated,
    TResult? Function(_AuthCubitUnauthenticated value)? unauthenticated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthCubitInitial value)? initial,
    TResult Function(_AuthCubitAuthenticated value)? authenticated,
    TResult Function(_AuthCubitUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCubitStateCopyWith<$Res> {
  factory $AuthCubitStateCopyWith(
    AuthCubitState value,
    $Res Function(AuthCubitState) then,
  ) = _$AuthCubitStateCopyWithImpl<$Res, AuthCubitState>;
}

/// @nodoc
class _$AuthCubitStateCopyWithImpl<$Res, $Val extends AuthCubitState>
    implements $AuthCubitStateCopyWith<$Res> {
  _$AuthCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthCubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthCubitInitialImplCopyWith<$Res> {
  factory _$$AuthCubitInitialImplCopyWith(
    _$AuthCubitInitialImpl value,
    $Res Function(_$AuthCubitInitialImpl) then,
  ) = __$$AuthCubitInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthCubitInitialImplCopyWithImpl<$Res>
    extends _$AuthCubitStateCopyWithImpl<$Res, _$AuthCubitInitialImpl>
    implements _$$AuthCubitInitialImplCopyWith<$Res> {
  __$$AuthCubitInitialImplCopyWithImpl(
    _$AuthCubitInitialImpl _value,
    $Res Function(_$AuthCubitInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthCubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthCubitInitialImpl implements _AuthCubitInitial {
  const _$AuthCubitInitialImpl();

  @override
  String toString() {
    return 'AuthCubitState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthCubitInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthCubitInitial value) initial,
    required TResult Function(_AuthCubitAuthenticated value) authenticated,
    required TResult Function(_AuthCubitUnauthenticated value) unauthenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthCubitInitial value)? initial,
    TResult? Function(_AuthCubitAuthenticated value)? authenticated,
    TResult? Function(_AuthCubitUnauthenticated value)? unauthenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthCubitInitial value)? initial,
    TResult Function(_AuthCubitAuthenticated value)? authenticated,
    TResult Function(_AuthCubitUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthCubitInitial implements AuthCubitState {
  const factory _AuthCubitInitial() = _$AuthCubitInitialImpl;
}

/// @nodoc
abstract class _$$AuthCubitAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthCubitAuthenticatedImplCopyWith(
    _$AuthCubitAuthenticatedImpl value,
    $Res Function(_$AuthCubitAuthenticatedImpl) then,
  ) = __$$AuthCubitAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});

  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthCubitAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthCubitStateCopyWithImpl<$Res, _$AuthCubitAuthenticatedImpl>
    implements _$$AuthCubitAuthenticatedImplCopyWith<$Res> {
  __$$AuthCubitAuthenticatedImplCopyWithImpl(
    _$AuthCubitAuthenticatedImpl _value,
    $Res Function(_$AuthCubitAuthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$AuthCubitAuthenticatedImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserEntity,
      ),
    );
  }

  /// Create a copy of AuthCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthCubitAuthenticatedImpl implements _AuthCubitAuthenticated {
  const _$AuthCubitAuthenticatedImpl(this.user);

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'AuthCubitState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCubitAuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCubitAuthenticatedImplCopyWith<_$AuthCubitAuthenticatedImpl>
  get copyWith =>
      __$$AuthCubitAuthenticatedImplCopyWithImpl<_$AuthCubitAuthenticatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthCubitInitial value) initial,
    required TResult Function(_AuthCubitAuthenticated value) authenticated,
    required TResult Function(_AuthCubitUnauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthCubitInitial value)? initial,
    TResult? Function(_AuthCubitAuthenticated value)? authenticated,
    TResult? Function(_AuthCubitUnauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthCubitInitial value)? initial,
    TResult Function(_AuthCubitAuthenticated value)? authenticated,
    TResult Function(_AuthCubitUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthCubitAuthenticated implements AuthCubitState {
  const factory _AuthCubitAuthenticated(final UserEntity user) =
      _$AuthCubitAuthenticatedImpl;

  UserEntity get user;

  /// Create a copy of AuthCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthCubitAuthenticatedImplCopyWith<_$AuthCubitAuthenticatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthCubitUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthCubitUnauthenticatedImplCopyWith(
    _$AuthCubitUnauthenticatedImpl value,
    $Res Function(_$AuthCubitUnauthenticatedImpl) then,
  ) = __$$AuthCubitUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthCubitUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthCubitStateCopyWithImpl<$Res, _$AuthCubitUnauthenticatedImpl>
    implements _$$AuthCubitUnauthenticatedImplCopyWith<$Res> {
  __$$AuthCubitUnauthenticatedImplCopyWithImpl(
    _$AuthCubitUnauthenticatedImpl _value,
    $Res Function(_$AuthCubitUnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthCubitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthCubitUnauthenticatedImpl implements _AuthCubitUnauthenticated {
  const _$AuthCubitUnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthCubitState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCubitUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthCubitInitial value) initial,
    required TResult Function(_AuthCubitAuthenticated value) authenticated,
    required TResult Function(_AuthCubitUnauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthCubitInitial value)? initial,
    TResult? Function(_AuthCubitAuthenticated value)? authenticated,
    TResult? Function(_AuthCubitUnauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthCubitInitial value)? initial,
    TResult Function(_AuthCubitAuthenticated value)? authenticated,
    TResult Function(_AuthCubitUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthCubitUnauthenticated implements AuthCubitState {
  const factory _AuthCubitUnauthenticated() = _$AuthCubitUnauthenticatedImpl;
}
