import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/connectivity_cubit/connectivity_cubit.dart';
import '../theme/theme.dart';

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityCubit(),
      child: MaterialApp.router(
        routerConfig: router,
        theme: AppTheme.lightTheme,
        builder: (context, child) {
          return BlocBuilder<ConnectivityCubit, bool>(
            builder: (context, hasConnection) {
              // Определяем цвет шапки: синий (основной) или красный (ошибка)
              final statusBarColor = hasConnection
                  ? Theme.of(context).colorScheme.primary
                  : Colors.redAccent;

              return Scaffold(
                body: Column(
                  children: [
                    // Этот контейнер окрашивает область системных иконок
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      color: statusBarColor,
                      child: SafeArea(
                        bottom: false,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          // Высота текста: 0 если интернет есть, ~30 если нет
                          height: hasConnection ? 0 : 30,
                          width: double.infinity,
                          child: const Center(
                            child: SingleChildScrollView( // Чтобы текст не дергался при анимации высоты
                              child: Text(
                                'Нет подключения к интернету',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: child!),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}