part of 'home_bosses_bloc.dart';

@immutable
sealed class HomeBossesState extends Equatable {
  final List<Object> _props;

  const HomeBossesState([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class Init extends HomeBossesState {}

class Empty extends HomeBossesState {}

class Loading extends HomeBossesState {}

class Loaded extends HomeBossesState {
  final List<Boss> bosses;

  Loaded({required this.bosses}) : super([bosses]);
}

class Error extends HomeBossesState {
  final String message;

  Error({required this.message}) : super([message]);
}
