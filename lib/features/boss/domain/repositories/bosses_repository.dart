
import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/features/boss/domain/entities/boss.dart';

import '../../../../core/error/failures.dart';

abstract class BossesRepository {
  Future<Either<Failure, List<Boss>>> getBosses();
}