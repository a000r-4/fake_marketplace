import 'package:auth_template/core/exceptions/auth_exceptions.dart';
import '../entity/user_entity.dart';

abstract class AuthRepo {
  Stream<UserEntity?> authStateChanges();

  Future<UserEntity?> getCurrentUser();

  Future<UserEntity> signUpWithEmail(
      String email,
      String password,
      );

  Future<UserEntity> signInWithEmail(
      String email,
      String password,
      );

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();

  Future<void> deleteAccount(String password);

  Future<void> reloadUser();

  // Phone auth
  Future<void> sendPhoneCode(
      String phoneNumber, {
        required void Function(String verificationId) codeSent,
        required void Function(AuthException e) onError,
      });

  Future<UserEntity> verifySmsCode({
    required String verificationId,
    required String smsCode,
  });

  Future<UserEntity> updateProfile({
    String? displayName,
    String? photoUrl,
  });
}