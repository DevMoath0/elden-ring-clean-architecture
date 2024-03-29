import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/core/error/failures.dart';
import 'package:elden_ring_cl/features/bosses/domain/entities/bosses.dart';

abstract class BossesRepository {
  Future<Either<Failure, Bosses>> getBosses();
}
