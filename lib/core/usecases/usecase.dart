import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/core/error/failures.dart';
import 'package:elden_ring_cl/features/bosses/domain/entities/bosses_entities.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, BossesEntities>> call(Params params);
}
