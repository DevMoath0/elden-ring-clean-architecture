// Dependency injector
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:elden_ring_cl/features/bosses/data/datasources/bosses_local_data_source.dart';
import 'package:elden_ring_cl/features/bosses/data/datasources/bosses_remote_data_source.dart';
import 'package:elden_ring_cl/features/bosses/data/repositories/bosses_repository_impl.dart';
import 'package:elden_ring_cl/features/bosses/domain/repositories/bosses_repository.dart';
import 'package:elden_ring_cl/features/bosses/domain/usecases/get_bosses.dart';
import 'package:elden_ring_cl/features/bosses/presentation/bloc/bosses_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Features - Number Trivia
  // Bloc
  // Note: Remember whenever you do disposal logic use a Factory
  // not a Singleton to not get the same instance.
  serviceLocator.registerFactory(
    () => BossesBloc(
      getBosses: serviceLocator(),
    ),
  );

  // Use cases
  serviceLocator.registerLazySingleton(() => GetBosses(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<BossesRepository>(
    () => BossesRepositoryImpl(
        remoteDataSource: serviceLocator(),
        localDataSource: serviceLocator(),
        networkInfo: serviceLocator()),
  );

  // Data sources
  serviceLocator.registerLazySingleton<BossesRemoteDataSource>(
    () => BossesRemoteDataSourceImpl(
      dio: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<BossesLocalDataSource>(
    () => BossesLocalDataSourceImpl(
      sharedPreferences: serviceLocator(),
    ),
  );

  // Core Stuff
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => DataConnectionChecker());
}
