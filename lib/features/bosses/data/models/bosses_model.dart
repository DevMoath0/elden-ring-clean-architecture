import '../../domain/entities/bosses_entities.dart';
import 'boss_model.dart';

class BossesModel extends BossesEntities {
  const BossesModel({
    required super.success,
    required super.count,
    required super.total,
    required super.data,
  });

  factory BossesModel.fromJson(Map<String, dynamic> json) {
    return BossesModel(
      success: json['success'],
      count: json['count'],
      total: json['total'],
      data: (json['data'] as List<dynamic>)
          .map((bossJson) => BossModel.fromJson(bossJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'count': count,
      'total': total,
      'data': data,
    };
  }

  @override
  String toString() {
    return "Details are {$success Count:$count Total: $total Data:$data}";
  }
}
