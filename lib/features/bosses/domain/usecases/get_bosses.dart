import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/core/usecases/usecase.dart';
import 'package:elden_ring_cl/features/bosses/domain/entities/bosses.dart';
import 'package:elden_ring_cl/features/bosses/domain/repositories/bosses_repository.dart';

import '../../../../core/error/failures.dart';

class GetBosses implements UseCase<Bosses, NoParams> {
  final BossesRepository repository;

  GetBosses(this.repository);

  @override
  Future<Either<Failure, Bosses>> call(NoParams params) async {
    return await repository.getBosses();
  }
}

class NoParams {}
