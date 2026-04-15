part of 'auth_bloc.dart';

@freezed
class AuthBlocState with _$AuthBlocState {
  const factory AuthBlocState.initial() = _Initial;
  const factory AuthBlocState.loading() = _Loading;
  const factory AuthBlocState.success() = _Success;
  const factory AuthBlocState.failure(AuthException exception) = _Failure;
}
