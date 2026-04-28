import 'package:auth_template/app/app/app.dart';
import 'package:auth_template/app/router/router.dart';
import 'package:auth_template/features/catalog/presentation/purchase_history_cubit/purchase_history_cubit.dart';
import 'package:auth_template/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/init_dependencies.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/catalog/data/model/cart_purchase_model/cart_purchase_model.dart';
import 'features/catalog/domain/entity/cart_item_entity/cart_item_entity.dart';
import 'features/catalog/domain/entity/product_enitity/product_entity.dart';
import 'features/catalog/presentation/cart_cubit/cart_cubit.dart';
import 'features/catalog/presentation/catalog_cubit/catalog_cubit.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await Hive.initFlutter();

    Hive.registerAdapter(ProductEntityImplAdapter());
    Hive.registerAdapter(CartItemEntityImplAdapter());
    Hive.registerAdapter(PurchaseModelAdapter());

    await Hive.openBox<CartItemEntity>('cart_box');
    await Hive.openBox<PurchaseModel>('history_box');

    await initDependencies();

    final authCubit = getIt<AuthCubit>();
    final cartCubit = getIt<CartCubit>();
    final authBloc = getIt<AuthBloc>();

    final router = createRouter(authCubit);

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>.value(value: authCubit),
          BlocProvider<AuthBloc>.value(value: authBloc),
          BlocProvider<CartCubit>.value(value: cartCubit),
          BlocProvider<CatalogCubit>(
            create: (context) => getIt<CatalogCubit>()..loadProducts(),
          ),
          BlocProvider<PurchaseHistoryCubit>(
            create: (context) => getIt<PurchaseHistoryCubit>(),
          ),
        ],
        child: MyApp(router: router),
      ),
    );
  } catch (e) {
    debugPrint("Критическая ошибка при запуске: $e");
  }
}