import 'package:dartz/dartz.dart';
import 'package:elden_ring_cl/core/error/failures.dart';
import 'package:equatable/equatable.dart';
//import 'package:elden_ring_cl/features/bosses/domain/entities/bosses_entities.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
