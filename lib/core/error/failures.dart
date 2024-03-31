import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic> properties;

  const Failure({this.properties = const []});

  //This one for Equatable
  @override
  List<Object?> get props {
    return [properties];
  }
}

// General Failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InvalidInputFailure extends Failure {}