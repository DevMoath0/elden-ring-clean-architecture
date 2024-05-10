 import 'package:equatable/equatable.dart';

class Boss extends Equatable{

  final String name;
  final String image;
  final String description;
  final String location;

  Boss({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
}) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    image,
    description,
    location,
  ];

}