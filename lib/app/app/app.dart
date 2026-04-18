import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/connectivity_cubit/cunectivity_cubit.dart';
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
          return Scaffold(
            body: Column(
              children: [
                BlocBuilder<ConnectivityCubit, bool>(
                  builder: (context, hasConnection) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: hasConnection ? 0 : 24, // Узкая строчка
                      color: Colors.redAccent,
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          'Нет подключения к интернету',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    );
                  },
                ),
                Expanded(child: child!),
              ],
            ),
          );
        },
      ),
    );
  }
}