import 'dart:async';
import 'package:auth_template/features/auth/domain/entity/user_entity.dart';
import 'package:auth_template/features/auth/domain/repo/auth_repo_abstract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_cubit_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepo _repo;
  late final StreamSubscription _sub;

  AuthCubit(this._repo) : super(const AuthCubitState.initial()) {
    _sub = _repo.authStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthCubitState.unauthenticated());
      } else {
        emit(AuthCubitState.authenticated(user));
      }
    });
  }


  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}


