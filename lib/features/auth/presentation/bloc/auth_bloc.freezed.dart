// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )
    sendPhoneCode,
    required TResult Function(String verificationId, String smsCode)
    verifySmsCode,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult? Function(String verificationId, String smsCode)? verifySmsCode,
    TResult? Function(String? displayName, String? photoUrl)? updateProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult Function(String verificationId, String smsCode)? verifySmsCode,
    TResult Function(String? displayName, String? photoUrl)? updateProfile,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_SendPhoneCode value) sendPhoneCode,
    required TResult Function(_VerifySmsCode value) verifySmsCode,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_SendPhoneCode value)? sendPhoneCode,
    TResult? Function(_VerifySmsCode value)? verifySmsCode,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_SendPhoneCode value)? sendPhoneCode,
    TResult Function(_VerifySmsCode value)? verifySmsCode,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthBlocEventCopyWith<$Res> {
  factory $AuthBlocEventCopyWith(
    AuthBlocEvent value,
    $Res Function(AuthBlocEvent) then,
  ) = _$AuthBlocEventCopyWithImpl<$Res, AuthBlocEvent>;
}

/// @nodoc
class _$AuthBlocEventCopyWithImpl<$Res, $Val extends AuthBlocEvent>
    implements $AuthBlocEventCopyWith<$Res> {
  _$AuthBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignInWithEmailImplCopyWith<$Res> {
  factory _$$SignInWithEmailImplCopyWith(
    _$SignInWithEmailImpl value,
    $Res Function(_$SignInWithEmailImpl) then,
  ) = __$$SignInWithEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInWithEmailImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$SignInWithEmailImpl>
    implements _$$SignInWithEmailImplCopyWith<$Res> {
  __$$SignInWithEmailImplCopyWithImpl(
    _$SignInWithEmailImpl _value,
    $Res Function(_$SignInWithEmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignInWithEmailImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignInWithEmailImpl implements _SignInWithEmail {
  const _$SignInWithEmailImpl(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthBlocEvent.signInWithEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithEmailImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInWithEmailImplCopyWith<_$SignInWithEmailImpl> get copyWith =>
      __$$SignInWithEmailImplCopyWithImpl<_$SignInWithEmailImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )
    sendPhoneCode,
    required TResult Function(String verificationId, String smsCode)
    verifySmsCode,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfile,
  }) {
    return signInWithEmail(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult? Function(String verificationId, String smsCode)? verifySmsCode,
    TResult? Function(String? displayName, String? photoUrl)? updateProfile,
  }) {
    return signInWithEmail?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult Function(String verificationId, String smsCode)? verifySmsCode,
    TResult Function(String? displayName, String? photoUrl)? updateProfile,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_SendPhoneCode value) sendPhoneCode,
    required TResult Function(_VerifySmsCode value) verifySmsCode,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return signInWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_SendPhoneCode value)? sendPhoneCode,
    TResult? Function(_VerifySmsCode value)? verifySmsCode,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return signInWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_SendPhoneCode value)? sendPhoneCode,
    TResult Function(_VerifySmsCode value)? verifySmsCode,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmail implements AuthBlocEvent {
  const factory _SignInWithEmail(final String email, final String password) =
      _$SignInWithEmailImpl;

  String get email;
  String get password;

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInWithEmailImplCopyWith<_$SignInWithEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpWithEmailImplCopyWith<$Res> {
  factory _$$SignUpWithEmailImplCopyWith(
    _$SignUpWithEmailImpl value,
    $Res Function(_$SignUpWithEmailImpl) then,
  ) = __$$SignUpWithEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignUpWithEmailImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$SignUpWithEmailImpl>
    implements _$$SignUpWithEmailImplCopyWith<$Res> {
  __$$SignUpWithEmailImplCopyWithImpl(
    _$SignUpWithEmailImpl _value,
    $Res Function(_$SignUpWithEmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignUpWithEmailImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignUpWithEmailImpl implements _SignUpWithEmail {
  const _$SignUpWithEmailImpl(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthBlocEvent.signUpWithEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpWithEmailImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpWithEmailImplCopyWith<_$SignUpWithEmailImpl> get copyWith =>
      __$$SignUpWithEmailImplCopyWithImpl<_$SignUpWithEmailImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )
    sendPhoneCode,
    required TResult Function(String verificationId, String smsCode)
    verifySmsCode,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfile,
  }) {
    return signUpWithEmail(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult? Function(String verificationId, String smsCode)? verifySmsCode,
    TResult? Function(String? displayName, String? photoUrl)? updateProfile,
  }) {
    return signUpWithEmail?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult Function(String verificationId, String smsCode)? verifySmsCode,
    TResult Function(String? displayName, String? photoUrl)? updateProfile,
    required TResult orElse(),
  }) {
    if (signUpWithEmail != null) {
      return signUpWithEmail(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_SendPhoneCode value) sendPhoneCode,
    required TResult Function(_VerifySmsCode value) verifySmsCode,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return signUpWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_SendPhoneCode value)? sendPhoneCode,
    TResult? Function(_VerifySmsCode value)? verifySmsCode,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return signUpWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_SendPhoneCode value)? sendPhoneCode,
    TResult Function(_VerifySmsCode value)? verifySmsCode,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (signUpWithEmail != null) {
      return signUpWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignUpWithEmail implements AuthBlocEvent {
  const factory _SignUpWithEmail(final String email, final String password) =
      _$SignUpWithEmailImpl;

  String get email;
  String get password;

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpWithEmailImplCopyWith<_$SignUpWithEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutImplCopyWith<$Res> {
  factory _$$SignOutImplCopyWith(
    _$SignOutImpl value,
    $Res Function(_$SignOutImpl) then,
  ) = __$$SignOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$SignOutImpl>
    implements _$$SignOutImplCopyWith<$Res> {
  __$$SignOutImplCopyWithImpl(
    _$SignOutImpl _value,
    $Res Function(_$SignOutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutImpl implements _SignOut {
  const _$SignOutImpl();

  @override
  String toString() {
    return 'AuthBlocEvent.signOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )
    sendPhoneCode,
    required TResult Function(String verificationId, String smsCode)
    verifySmsCode,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfile,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult? Function(String verificationId, String smsCode)? verifySmsCode,
    TResult? Function(String? displayName, String? photoUrl)? updateProfile,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult Function(String verificationId, String smsCode)? verifySmsCode,
    TResult Function(String? displayName, String? photoUrl)? updateProfile,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_SendPhoneCode value) sendPhoneCode,
    required TResult Function(_VerifySmsCode value) verifySmsCode,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_SendPhoneCode value)? sendPhoneCode,
    TResult? Function(_VerifySmsCode value)? verifySmsCode,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_SendPhoneCode value)? sendPhoneCode,
    TResult Function(_VerifySmsCode value)? verifySmsCode,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOut implements AuthBlocEvent {
  const factory _SignOut() = _$SignOutImpl;
}

/// @nodoc
abstract class _$$SendPhoneCodeImplCopyWith<$Res> {
  factory _$$SendPhoneCodeImplCopyWith(
    _$SendPhoneCodeImpl value,
    $Res Function(_$SendPhoneCodeImpl) then,
  ) = __$$SendPhoneCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String phoneNumber,
    void Function(String) codeSent,
    void Function(AuthException) onError,
  });
}

/// @nodoc
class __$$SendPhoneCodeImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$SendPhoneCodeImpl>
    implements _$$SendPhoneCodeImplCopyWith<$Res> {
  __$$SendPhoneCodeImplCopyWithImpl(
    _$SendPhoneCodeImpl _value,
    $Res Function(_$SendPhoneCodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? codeSent = null,
    Object? onError = null,
  }) {
    return _then(
      _$SendPhoneCodeImpl(
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        codeSent: null == codeSent
            ? _value.codeSent
            : codeSent // ignore: cast_nullable_to_non_nullable
                  as void Function(String),
        onError: null == onError
            ? _value.onError
            : onError // ignore: cast_nullable_to_non_nullable
                  as void Function(AuthException),
      ),
    );
  }
}

/// @nodoc

class _$SendPhoneCodeImpl implements _SendPhoneCode {
  const _$SendPhoneCodeImpl({
    required this.phoneNumber,
    required this.codeSent,
    required this.onError,
  });

  @override
  final String phoneNumber;
  @override
  final void Function(String) codeSent;
  @override
  final void Function(AuthException) onError;

  @override
  String toString() {
    return 'AuthBlocEvent.sendPhoneCode(phoneNumber: $phoneNumber, codeSent: $codeSent, onError: $onError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPhoneCodeImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.codeSent, codeSent) ||
                other.codeSent == codeSent) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, codeSent, onError);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPhoneCodeImplCopyWith<_$SendPhoneCodeImpl> get copyWith =>
      __$$SendPhoneCodeImplCopyWithImpl<_$SendPhoneCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )
    sendPhoneCode,
    required TResult Function(String verificationId, String smsCode)
    verifySmsCode,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfile,
  }) {
    return sendPhoneCode(phoneNumber, codeSent, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult? Function(String verificationId, String smsCode)? verifySmsCode,
    TResult? Function(String? displayName, String? photoUrl)? updateProfile,
  }) {
    return sendPhoneCode?.call(phoneNumber, codeSent, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult Function(String verificationId, String smsCode)? verifySmsCode,
    TResult Function(String? displayName, String? photoUrl)? updateProfile,
    required TResult orElse(),
  }) {
    if (sendPhoneCode != null) {
      return sendPhoneCode(phoneNumber, codeSent, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_SendPhoneCode value) sendPhoneCode,
    required TResult Function(_VerifySmsCode value) verifySmsCode,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return sendPhoneCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_SendPhoneCode value)? sendPhoneCode,
    TResult? Function(_VerifySmsCode value)? verifySmsCode,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return sendPhoneCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_SendPhoneCode value)? sendPhoneCode,
    TResult Function(_VerifySmsCode value)? verifySmsCode,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (sendPhoneCode != null) {
      return sendPhoneCode(this);
    }
    return orElse();
  }
}

abstract class _SendPhoneCode implements AuthBlocEvent {
  const factory _SendPhoneCode({
    required final String phoneNumber,
    required final void Function(String) codeSent,
    required final void Function(AuthException) onError,
  }) = _$SendPhoneCodeImpl;

  String get phoneNumber;
  void Function(String) get codeSent;
  void Function(AuthException) get onError;

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendPhoneCodeImplCopyWith<_$SendPhoneCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifySmsCodeImplCopyWith<$Res> {
  factory _$$VerifySmsCodeImplCopyWith(
    _$VerifySmsCodeImpl value,
    $Res Function(_$VerifySmsCodeImpl) then,
  ) = __$$VerifySmsCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, String smsCode});
}

/// @nodoc
class __$$VerifySmsCodeImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$VerifySmsCodeImpl>
    implements _$$VerifySmsCodeImplCopyWith<$Res> {
  __$$VerifySmsCodeImplCopyWithImpl(
    _$VerifySmsCodeImpl _value,
    $Res Function(_$VerifySmsCodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? verificationId = null, Object? smsCode = null}) {
    return _then(
      _$VerifySmsCodeImpl(
        verificationId: null == verificationId
            ? _value.verificationId
            : verificationId // ignore: cast_nullable_to_non_nullable
                  as String,
        smsCode: null == smsCode
            ? _value.smsCode
            : smsCode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifySmsCodeImpl implements _VerifySmsCode {
  const _$VerifySmsCodeImpl({
    required this.verificationId,
    required this.smsCode,
  });

  @override
  final String verificationId;
  @override
  final String smsCode;

  @override
  String toString() {
    return 'AuthBlocEvent.verifySmsCode(verificationId: $verificationId, smsCode: $smsCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifySmsCodeImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.smsCode, smsCode) || other.smsCode == smsCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, smsCode);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifySmsCodeImplCopyWith<_$VerifySmsCodeImpl> get copyWith =>
      __$$VerifySmsCodeImplCopyWithImpl<_$VerifySmsCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )
    sendPhoneCode,
    required TResult Function(String verificationId, String smsCode)
    verifySmsCode,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfile,
  }) {
    return verifySmsCode(verificationId, smsCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult? Function(String verificationId, String smsCode)? verifySmsCode,
    TResult? Function(String? displayName, String? photoUrl)? updateProfile,
  }) {
    return verifySmsCode?.call(verificationId, smsCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult Function(String verificationId, String smsCode)? verifySmsCode,
    TResult Function(String? displayName, String? photoUrl)? updateProfile,
    required TResult orElse(),
  }) {
    if (verifySmsCode != null) {
      return verifySmsCode(verificationId, smsCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_SendPhoneCode value) sendPhoneCode,
    required TResult Function(_VerifySmsCode value) verifySmsCode,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return verifySmsCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_SendPhoneCode value)? sendPhoneCode,
    TResult? Function(_VerifySmsCode value)? verifySmsCode,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return verifySmsCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_SendPhoneCode value)? sendPhoneCode,
    TResult Function(_VerifySmsCode value)? verifySmsCode,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (verifySmsCode != null) {
      return verifySmsCode(this);
    }
    return orElse();
  }
}

abstract class _VerifySmsCode implements AuthBlocEvent {
  const factory _VerifySmsCode({
    required final String verificationId,
    required final String smsCode,
  }) = _$VerifySmsCodeImpl;

  String get verificationId;
  String get smsCode;

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifySmsCodeImplCopyWith<_$VerifySmsCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileImplCopyWith<$Res> {
  factory _$$UpdateProfileImplCopyWith(
    _$UpdateProfileImpl value,
    $Res Function(_$UpdateProfileImpl) then,
  ) = __$$UpdateProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? displayName, String? photoUrl});
}

/// @nodoc
class __$$UpdateProfileImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$UpdateProfileImpl>
    implements _$$UpdateProfileImplCopyWith<$Res> {
  __$$UpdateProfileImplCopyWithImpl(
    _$UpdateProfileImpl _value,
    $Res Function(_$UpdateProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? displayName = freezed, Object? photoUrl = freezed}) {
    return _then(
      _$UpdateProfileImpl(
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UpdateProfileImpl implements _UpdateProfile {
  const _$UpdateProfileImpl({this.displayName, this.photoUrl});

  @override
  final String? displayName;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'AuthBlocEvent.updateProfile(displayName: $displayName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName, photoUrl);

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileImplCopyWith<_$UpdateProfileImpl> get copyWith =>
      __$$UpdateProfileImplCopyWithImpl<_$UpdateProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )
    sendPhoneCode,
    required TResult Function(String verificationId, String smsCode)
    verifySmsCode,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfile,
  }) {
    return updateProfile(displayName, photoUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult? Function(String verificationId, String smsCode)? verifySmsCode,
    TResult? Function(String? displayName, String? photoUrl)? updateProfile,
  }) {
    return updateProfile?.call(displayName, photoUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(
      String phoneNumber,
      void Function(String) codeSent,
      void Function(AuthException) onError,
    )?
    sendPhoneCode,
    TResult Function(String verificationId, String smsCode)? verifySmsCode,
    TResult Function(String? displayName, String? photoUrl)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(displayName, photoUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_SendPhoneCode value) sendPhoneCode,
    required TResult Function(_VerifySmsCode value) verifySmsCode,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_SendPhoneCode value)? sendPhoneCode,
    TResult? Function(_VerifySmsCode value)? verifySmsCode,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_SendPhoneCode value)? sendPhoneCode,
    TResult Function(_VerifySmsCode value)? verifySmsCode,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfile implements AuthBlocEvent {
  const factory _UpdateProfile({
    final String? displayName,
    final String? photoUrl,
  }) = _$UpdateProfileImpl;

  String? get displayName;
  String? get photoUrl;

  /// Create a copy of AuthBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileImplCopyWith<_$UpdateProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(AuthException exception) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(AuthException exception)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(AuthException exception)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthBlocStateCopyWith<$Res> {
  factory $AuthBlocStateCopyWith(
    AuthBlocState value,
    $Res Function(AuthBlocState) then,
  ) = _$AuthBlocStateCopyWithImpl<$Res, AuthBlocState>;
}

/// @nodoc
class _$AuthBlocStateCopyWithImpl<$Res, $Val extends AuthBlocState>
    implements $AuthBlocStateCopyWith<$Res> {
  _$AuthBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthBlocStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthBlocState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(AuthException exception) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(AuthException exception)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(AuthException exception)? failure,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthBlocState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthBlocStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthBlocState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(AuthException exception) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(AuthException exception)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(AuthException exception)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthBlocState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AuthBlocStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'AuthBlocState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(AuthException exception) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(AuthException exception)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(AuthException exception)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AuthBlocState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
    _$FailureImpl value,
    $Res Function(_$FailureImpl) then,
  ) = __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthException exception});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$AuthBlocStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
    _$FailureImpl _value,
    $Res Function(_$FailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exception = null}) {
    return _then(
      _$FailureImpl(
        null == exception
            ? _value.exception
            : exception // ignore: cast_nullable_to_non_nullable
                  as AuthException,
      ),
    );
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.exception);

  @override
  final AuthException exception;

  @override
  String toString() {
    return 'AuthBlocState.failure(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  /// Create a copy of AuthBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(AuthException exception) failure,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(AuthException exception)? failure,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(AuthException exception)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AuthBlocState {
  const factory _Failure(final AuthException exception) = _$FailureImpl;

  AuthException get exception;

  /// Create a copy of AuthBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
