import 'dart:convert';

import 'package:elden_ring_cl/features/boss/domain/entities/boss.dart';

List<BossModel> bossesFromJson(String str) =>
    List<BossModel>.from(json.decode(str).map((x) => BossModel.fromJson(x)));

String bossesToJson(List<BossModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BossModel extends Boss{

  BossModel({
    required name,
    required image,
    required description,
    required location,
}) : super(
    name: name,
    image: image,
    description: description,
    location: location,
  );

  factory BossModel.fromJson(Map<String,dynamic> json) {
    return BossModel(name: json["name"], image: json["image"] ?? '',
      description: json["description"] ?? '', location: json["location"],);
  }

  Map<String, dynamic> toJson() => {
    "name":name,
    "image":image,
    "description":description,
    "location":location,
    };
  
}