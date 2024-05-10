import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/core/error/failures.dart';
import 'package:elden_ring_cl/features/boss/domain/entities/boss.dart';
import 'package:elden_ring_cl/features/boss/domain/repositories/bosses_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../models/boss_model.dart';

class BossesRepositoryImpl implements BossesRepository {
  final BossesRemoteDataSource remoteDataSource;
  final BossesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BossesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Boss>>> getBosses() async {
    return await _getBosses(() async => await remoteDataSource.getBosses());
  }

  //Todo:
  Future<Either<Failure, List<Boss>>> _getBosses(
      Future<List<Boss>> Function() call) async {
    if (await networkInfo.isConnected) {
      try {
        var remoteBosses = await call();
        localDataSource.cache(remoteBosses as List<BossModel>);
        return Right(remoteBosses);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        var localBosses = await localDataSource.getAll();
        return Right(localBosses);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
