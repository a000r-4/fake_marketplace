import 'package:auth_template/core/exceptions/auth_exceptions.dart';

import '../model/user_model.dart';

abstract class FirebaseAuthRemoteDataSourceAbst {
  Stream<UserModel?> authStateChanges();

  Future<UserModel?> getCurrentUser();

  Future<UserModel> signUpWithEmail(String email, String password);

  Future<UserModel> signInWithEmail(String email, String password);

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();

  Future<void> deleteAccount();

  Future<void> reloadUser();

  Future<void> sendPhoneCode(
      String phoneNumber, {
        required void Function(String verificationId) codeSent,
        required void Function(AuthException e) onError,
      });

  Future<UserModel> verifySmsCode({
    required String verificationId,
    required String smsCode,
  });

  Future<UserModel> updateProfile({String? displayName, String? photoUrl});
}
