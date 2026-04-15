import 'package:auth_template/core/exceptions/auth_exceptions.dart';
import 'package:auth_template/features/auth/domain/entity/user_entity.dart';
import 'package:auth_template/features/auth/domain/repo/auth_repo_abstract.dart';
import '../datasources/firebase_auth_datasource_abstract.dart';
import '../model/user_model.dart';

class FirebaseAuthRepoImpl implements AuthRepo {
  FirebaseAuthRepoImpl(this._remote);

  final FirebaseAuthRemoteDataSourceAbst _remote;

  @override
  Stream<UserEntity?> authStateChanges() {
    return _remote.authStateChanges().map(
          (UserModel? model) => model?.toEntity(),
    );
  }
  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final model = await _remote.getCurrentUser();
      return model?.toEntity();
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<UserEntity> signUpWithEmail(
      String email,
      String password,
      ) async {
    try {
      final model =
      await _remote.signUpWithEmail(email, password);
      return model.toEntity();
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<UserEntity> signInWithEmail(
      String email,
      String password,
      ) async {
    try {
      final model =
      await _remote.signInWithEmail(email, password);
      return model.toEntity();
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<void> sendEmailVerification() async {
    try {
      await _remote.sendEmailVerification();
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _remote.sendPasswordResetEmail(email);
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<void> signOut() async {
    try {
      await _remote.signOut();
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<void> deleteAccount() async {
    try {
      await _remote.deleteAccount();
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<void> reloadUser() async {
    try {
      await _remote.reloadUser();
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<void> sendPhoneCode(
      String phoneNumber, {
        required void Function(String verificationId) codeSent,
        required void Function(AuthException e) onError,
      }) async {
    try {
      await _remote.sendPhoneCode(
        phoneNumber,
        codeSent: codeSent,
        onError: onError,
      );
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<UserEntity> verifySmsCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final model = await _remote.verifySmsCode(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      return model.toEntity();
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
  @override
  Future<UserEntity> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    try {
      final model = await _remote.updateProfile(
        displayName: displayName,
        photoUrl: photoUrl,
      );
      return model.toEntity();
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException.unknown();
    }
  }
}