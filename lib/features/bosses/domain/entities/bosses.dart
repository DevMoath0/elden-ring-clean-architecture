import 'package:equatable/equatable.dart';

class Bosses extends Equatable {
  final String name;
  final String image;
  final String description;
  final String location;

  const Bosses({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
  });

  //To implement Equatable
  @override
  List<Object> get props {
    return [
      name,
      image,
      description,
      location,
    ];
  }
}
