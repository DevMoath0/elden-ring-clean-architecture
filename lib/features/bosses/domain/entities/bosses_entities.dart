import 'package:elden_ring_cl/features/bosses/domain/entities/boss_entity.dart';
import 'package:equatable/equatable.dart';

class BossesEntities extends Equatable {
  final bool success;
  final int count;
  final int total;
  final List<BossEntity> data;

  const BossesEntities({
    required this.success,
    required this.count,
    required this.total,
    required this.data,
  });

  //To implement Equatable
  @override
  List<Object> get props {
    return [
      success,
      count,
      total,
      data,
    ];
  }
}
