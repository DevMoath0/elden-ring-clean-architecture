import '../../domain/entities/boss_entity.dart';

class BossModel extends BossEntity {
  const BossModel({
    required super.name,
    required super.image,
    required super.description,
    required super.location,
  });

  factory BossModel.fromJson(Map<String, dynamic> json) {
    return BossModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'location': location,
    };
  }

  @override
  String toString() {
    return "Boss is {$name Description:$description Location: $location}";
  }
}
