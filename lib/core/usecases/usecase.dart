import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/core/error/failures.dart';

import '../../features/bosses/domain/entities/bosses.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Bosses>> call(Params params);
}
