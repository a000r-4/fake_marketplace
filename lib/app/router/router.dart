import 'dart:async';

import 'package:auth_template/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_template/features/auth/presentation/pages/home_page.dart';
import 'package:auth_template/features/auth/presentation/pages/login.dart';
import 'package:auth_template/features/auth/presentation/pages/phone_page.dart';
import 'package:auth_template/features/auth/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter createRouter(AuthCubit authCubit) {
  return GoRouter(
    initialLocation: '/splash',

    refreshListenable: GoRouterRefreshStream(authCubit.stream),

    redirect: (context, state) {
      final authState = authCubit.state;

      final isSplash = state.matchedLocation == '/splash';
      final isAuthPage =
          state.matchedLocation == '/login' ||
              state.matchedLocation == '/phone';

      return authState.when(
        initial: () => isSplash ? null : '/splash',

        unauthenticated: () {
          if (isAuthPage) return null;
          return '/login';
        },

        authenticated: (_) {
          final bool isOnMapTab = state.matchedLocation.startsWith('/home');
          if (!isOnMapTab) {
            return '/home';
          }
          return null;
        },
      );
    },

    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) =>
        const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) =>
        LoginPage()
      ),
      GoRoute(
        path: '/phone',
        builder: (context, state) =>
        PhonePage()
      ),
      GoRoute(
        path: '/home/profile',
        builder: (context, state) =>
        ProfilePage()
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) =>
        HomePage()
      ),
    ],
  );
}