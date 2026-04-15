part of 'auth_cubit.dart';

@freezed
class AuthCubitState with _$AuthCubitState {
  const factory AuthCubitState.initial() = _AuthCubitInitial;
  const factory AuthCubitState.authenticated(UserEntity user) = _AuthCubitAuthenticated;
  const factory AuthCubitState.unauthenticated() = _AuthCubitUnauthenticated;
}