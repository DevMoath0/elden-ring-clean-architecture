import 'package:meta/meta.dart';
import '../../domain/entities/bosses.dart';

class BossesModel extends Bosses {
  const BossesModel(
      {required super.name,
      required super.image,
      required super.description,
      required super.location});

  factory BossesModel.fromJson(Map<String, dynamic> json) {
    return BossesModel(
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
}
