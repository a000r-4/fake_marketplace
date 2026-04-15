import 'package:auth_template/core/exceptions/auth_exceptions.dart';
import 'package:auth_template/features/auth/data/datasources/firebase_auth_datasource_abstract.dart';
import 'package:auth_template/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSourceAbst {
  FirebaseAuthRemoteDataSourceImpl(this._auth);

  final FirebaseAuth _auth;

  @override
  Stream<UserModel?> authStateChanges() {
    return _auth.authStateChanges().map(
          (user) => user == null ? null : UserModel.fromFirebase(user),
    ).handleError((e) {
      if (e is FirebaseAuthException) {
        throw AuthException.fromFirebase(e);
      } else {
        throw AuthException.unknown();
      }
    });
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return null;
      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }

  @override
  Future<UserModel> signUpWithEmail(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebase(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }

  @override
  Future<UserModel> signInWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebase(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      await user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }

  @override
  Future<void> reloadUser() async {
    try {
      await _auth.currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
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
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          onError(AuthException.fromFirebase(e));
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      onError(AuthException.fromFirebase(e));
    } catch (_) {
      onError(AuthException.unknown());
    }
  }

  @override
  Future<UserModel> verifySmsCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final result = await _auth.signInWithCredential(credential);
      return UserModel.fromFirebase(result.user!);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }

  @override
  Future<UserModel> updateProfile({String? displayName, String? photoUrl}) async {
    try {
      final user = _auth.currentUser!;
      if (displayName != null) await user.updateDisplayName(displayName);
      if (photoUrl != null) await user.updatePhotoURL(photoUrl);
      await user.reload();
      return UserModel.fromFirebase(_auth.currentUser!);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    } catch (_) {
      throw AuthException.unknown();
    }
  }
}