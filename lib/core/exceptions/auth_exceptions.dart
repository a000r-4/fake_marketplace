import 'package:firebase_auth/firebase_auth.dart';

enum AuthErrorType {
  invalidEmail,
  userNotFound,
  weakPassword,
  wrongPassword,
  network,
  unknown,
}

class AuthException implements Exception {
  final String message;
  final AuthErrorType type;

  const AuthException(this.message, {this.type = AuthErrorType.unknown});

  factory AuthException.fromFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return const AuthException(
          'Email уже зарегистрирован',
          type: AuthErrorType.weakPassword,
        );
      case 'invalid-email':
        return const AuthException(
          'Некорректный email',
          type: AuthErrorType.invalidEmail,
        );
      case 'weak-password':
        return const AuthException(
          'Слишком слабый пароль',
          type: AuthErrorType.weakPassword,
        );
      case 'user-not-found':
        return const AuthException(
          'Пользователь не найден',
          type: AuthErrorType.userNotFound,
        );
      case 'wrong-password':
        return const AuthException(
          'Неверный пароль',
          type: AuthErrorType.wrongPassword,
        );
      case 'network-request-failed':
        return const AuthException(
          'Нет подключения к интернету',
          type: AuthErrorType.network,
        );
      default:
        return const AuthException(
          'Ошибка авторизации',
          type: AuthErrorType.unknown,
        );
    }
  }

  factory AuthException.unknown() => const AuthException(
    'Что-то пошло не так',
    type: AuthErrorType.unknown,
  );
}