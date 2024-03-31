import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/core/error/exceptions.dart';
import 'package:elden_ring_cl/core/error/failures.dart';
import 'package:elden_ring_cl/core/network/network_info.dart';
import 'package:elden_ring_cl/features/bosses/data/datasources/bosses_local_data_source.dart';
import 'package:elden_ring_cl/features/bosses/data/datasources/bosses_remote_data_source.dart';
import 'package:elden_ring_cl/features/bosses/data/models/bosses_model.dart';
import 'package:elden_ring_cl/features/bosses/domain/entities/bosses.dart';
import 'package:elden_ring_cl/features/bosses/domain/repositories/bosses_repository.dart';

class BossesRepositoryImpl implements BossesRepository {
  late final BossesRemoteDataSource remoteDataSource;
  late final BossesLocalDataSource localDataSource;
  late final NetworkInfo networkInfo;

  BossesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Bosses>> getBosses() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getBosses();
        localDataSource.cacheNumberTrivia(remoteTrivia as BossesModel);
        return Right(remoteTrivia as Bosses);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastBosses();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
