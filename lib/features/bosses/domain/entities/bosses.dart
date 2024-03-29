import 'package:equatable/equatable.dart';

class Bosses extends Equatable {
  late final String name;
  late final String image;
  late final String description;
  late final String location;

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
