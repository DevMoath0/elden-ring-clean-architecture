import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/core/error/failures.dart';
import 'package:elden_ring_cl/core/usecases/usecase.dart';
import 'package:elden_ring_cl/features/boss/domain/repositories/bosses_repository.dart';

import '../entities/boss.dart';

class GetBosses implements UseCase<List<Boss>, NoParams> {
  final BossesRepository bossesRepository;

  GetBosses(this.bossesRepository);

  @override
  Future<Either<Failure, List<Boss>>> call(NoParams params) {
    return bossesRepository.getBosses();
  }
}
