import 'dart:async';

import 'package:auth_template/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_template/features/auth/presentation/pages/home_page.dart';
import 'package:auth_template/features/auth/presentation/pages/login.dart';
import 'package:auth_template/features/auth/presentation/pages/phone_page.dart';
import 'package:auth_template/features/auth/presentation/pages/profile_page.dart';
import 'package:auth_template/features/catalog/presentation/pages/catalog_page.dart';
import 'package:auth_template/features/catalog/presentation/pages/edit_profile_page.dart';
import 'package:auth_template/features/catalog/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/catalog/domain/entity/product_enitity/product_entity.dart';
import '../../features/catalog/presentation/cart_cubit/cart_cubit.dart';
import '../../features/catalog/presentation/pages/product_cart_page.dart';

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
    initialLocation: '/catalog',
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: (context, state) {
      final authState = authCubit.state;
      final isSplash = state.matchedLocation == '/splash';
      final isAuthPage = state.matchedLocation == '/login' || state.matchedLocation == '/phone';

      return authState.when(
        initial: () => isSplash ? null : '/splash',
        unauthenticated: () => isAuthPage ? null : '/login',
        authenticated: (_) {
          if (isAuthPage || isSplash) return '/catalog';
          return null;
        },
      );
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/phone', builder: (context, state) => PhonePage()),

      // --- ГЛАВНАЯ ОБОЛОЧКА ПРИЛОЖЕНИЯ ---
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(index),
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Каталог'),
                const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
                BottomNavigationBarItem(
                  // ИСПРАВЛЕНО: Работаем с CartState вместо List
                  icon: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final count = state.maybeWhen(
                        success: (items, _) => items.length,
                        orElse: () => 0,
                      );
                      return Badge(
                        label: Text('$count'),
                        isLabelVisible: count > 0,
                        child: const Icon(Icons.shopping_cart),
                      );
                    },
                  ),
                  label: 'Корзина',
                ),
              ],
            ),
          );
        },
        branches: [
          // Ветка 1: Каталог
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/catalog',
                // ИСПРАВЛЕНО: Убрали BlocProvider отсюда.
                // Кубит должен инициализироваться глобально в main.dart,
                // чтобы не терять данные при переключении вкладок.
                builder: (context, state) => const CatalogPage(),
                routes: [
                  GoRoute(
                    name: 'product-details',
                    path: 'product-details',
                    builder: (context, state) {
                      final product = state.extra as ProductEntity;
                      return ProductDetailsPage(product: product);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Ветка 2: Профиль
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
                routes: [
                  GoRoute(
                    path: 'edit', // Пути внутри веток лучше делать относительными
                    name: 'profile_edit',
                    builder: (context, state) => const EditProfilePage(),
                  ),
                ],
              ),
            ],
          ),
          // Ветка 3: Корзина
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cart',
                name: 'cart',
                builder: (context, state) => const CartPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
