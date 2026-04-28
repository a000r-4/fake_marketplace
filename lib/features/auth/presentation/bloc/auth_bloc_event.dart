part of 'auth_bloc.dart';


@freezed
class AuthBlocEvent with _$AuthBlocEvent {
  const factory AuthBlocEvent.signInWithEmail(String email, String password) =_SignInWithEmail;
  const factory AuthBlocEvent.signUpWithEmail(String email, String password) =_SignUpWithEmail;
  const factory AuthBlocEvent.signOut() = _SignOut;
  const factory AuthBlocEvent.sendPhoneCode({
    required String phoneNumber,
    required void Function(String verificationId) codeSent,
    required void Function(AuthException e) onError,
  }) = _SendPhoneCode;

  const factory AuthBlocEvent.verifySmsCode({
    required String verificationId,
    required String smsCode,
  }) = _VerifySmsCode;

  const factory AuthBlocEvent.updateProfile({
    String? displayName,
    String? photoUrl,
  }) = _UpdateProfile;

  const factory AuthBlocEvent.deleteAccount({required String password}) = _DeleteAccount;
}
