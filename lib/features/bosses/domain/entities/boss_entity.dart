import 'package:equatable/equatable.dart';

class BossEntity extends Equatable {
  final String name;
  final String? image;
  final String description;
  final String location;

  const BossEntity({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        image,
        description,
        location,
      ];
}
