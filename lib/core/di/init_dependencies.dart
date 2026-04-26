import 'package:auth_template/features/auth/data/datasources/firebase_auth_datasource_abstract.dart';
import 'package:auth_template/features/auth/data/datasources/firebase_auth_remote_datasource_impl.dart';
import 'package:auth_template/features/catalog/presentation/catalog_cubit/catalog_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repo/firebase_auth_repo_impl.dart';
import '../../features/auth/domain/repo/auth_repo_abstract.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/catalog/data/datasource/product_remote_data_soucre.dart';
import '../../features/catalog/data/repos/catalog_repo.dart';
import '../../features/catalog/presentation/cart_cubit/cart_cubit.dart';
import '../network/dio_factory.dart';
final  getIt  = GetIt.instance;
Future<void> initDependencies () async {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseAuthRemoteDataSourceAbst>(
        () => FirebaseAuthRemoteDataSourceImpl(getIt()),
  );
  // Catalog
  getIt.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton(
        () => CatalogRepo(getIt()),
  );
  getIt.registerLazySingleton<Dio>(
          () => DioFactory().create()
  );
  getIt.registerLazySingleton<AuthRepo>(
        () => FirebaseAuthRepoImpl(getIt()),
  );
  getIt.registerFactory<CatalogCubit>(
        () => CatalogCubit(getIt()),
  );
  getIt.registerLazySingleton<AuthBloc>(
        () => AuthBloc(getIt<AuthRepo>()),
  );
  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton(() => CartCubit());
}