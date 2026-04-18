
import 'package:auth_template/app/app/app.dart';
import 'package:auth_template/app/router/router.dart';
import 'package:auth_template/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/init_dependencies.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/catalog/presentation/cart_cubit/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependencies();

  final authCubit = getIt<AuthCubit>();
  final cartCubit = getIt<CartCubit>();
  final authBloc = getIt<AuthBloc>();
  final router = createRouter(authCubit);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthCubit>.value(value: authCubit,),
      BlocProvider<AuthBloc>.value(value: authBloc,),
      BlocProvider<CartCubit>.value(value: cartCubit,),
    ],
    child: MyApp(
      router: router,
    ),
  ));

}