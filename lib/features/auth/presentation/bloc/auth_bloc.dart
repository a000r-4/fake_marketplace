import 'package:auth_template/core/exceptions/auth_exceptions.dart';
import 'package:auth_template/features/auth/domain/repo/auth_repo_abstract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepo _repo;

  AuthBloc(this._repo) : super(const AuthBlocState.initial()) {
    on<AuthBlocEvent>((event, emit) async {
      await event.map(
        deleteAccount: (e) => _handleAuthTask(emit,
                () => _repo.deleteAccount()
        ),
        signInWithEmail: (e) => _handleAuthTask(emit,
              () => _repo.signInWithEmail(e.email, e.password),
        ),
        signUpWithEmail: (e) => _handleAuthTask(emit,
              () => _repo.signUpWithEmail(e.email, e.password),
        ),
        signOut: (e) => _handleAuthTask(emit,
              () => _repo.signOut(),
        ),
        verifySmsCode: (e) => _handleAuthTask(emit,
              () => _repo.verifySmsCode(
            verificationId: e.verificationId,
            smsCode: e.smsCode,
          ),
        ),
        updateProfile: (e) => _handleAuthTask(emit,
              () => _repo.updateProfile(
            displayName: e.displayName,
            photoUrl: e.photoUrl,
          ),
        ),
        sendPhoneCode: (e) async {
          try {
            await _repo.sendPhoneCode(
              e.phoneNumber,
              codeSent: e.codeSent,
              onError: e.onError,
            );
          } catch (_) {
            emit(AuthBlocState.failure(const AuthException('Ошибка при отправке кода')));
          }
        },
      );
    });
  }

  Future<void> _handleAuthTask(
      Emitter<AuthBlocState> emit,
      Future<dynamic> Function() task,
      ) async {
    emit(const AuthBlocState.loading());
    try {
      await task();
      emit(const AuthBlocState.success());
    } on AuthException catch (ex) {
      emit(AuthBlocState.failure(ex));
    } catch (e) {
      emit(AuthBlocState.failure(const AuthException('Произошла непредвиденная ошибка')));
    }
  }
}