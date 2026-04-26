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

import '../../core/di/init_dependencies.dart';
import '../../features/catalog/domain/entity/cart_item_entity/cart_item_entity.dart';
import '../../features/catalog/domain/entity/product_enitity/product_entity.dart';
import '../../features/catalog/presentation/cart_cubit/cart_cubit.dart';
import '../../features/catalog/presentation/catalog_cubit/catalog_cubit.dart';
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
    initialLocation: '/catalog', // Поменяли на основной экран после логина
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: (context, state) {
      final authState = authCubit.state;
      final isSplash = state.matchedLocation == '/splash';
      final isAuthPage = state.matchedLocation == '/login' || state.matchedLocation == '/phone';

      return authState.when(
        initial: () => isSplash ? null : '/splash',
        unauthenticated: () => isAuthPage ? null : '/login',
        authenticated: (_) {
          // Если пользователь авторизован и пытается зайти на логин или сплеш — редирект на каталог
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
            body: navigationShell, // Это "окно", где меняются экраны
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(index),
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Каталог'),
                const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
                BottomNavigationBarItem(
                  icon: BlocBuilder<CartCubit, List<CartItemEntity>>(
                    builder: (context, state) {
                      return Badge(
                        label: Text('${state.length}'),
                        isLabelVisible: state.isNotEmpty,
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
          // Ветка 1: Каталог и его вложенные экраны
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/catalog',
                builder: (context, state) => BlocProvider(
                  create: (context) => getIt<CatalogCubit>()..loadProducts(),
                  child: const CatalogPage(),
                ),
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
                routes: [
                  GoRoute(
                    path: '/edit_profile_page',
                    name: 'profile_edit',
                    builder: (context, state) => const EditProfilePage(),
                  ),
                ],
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
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
