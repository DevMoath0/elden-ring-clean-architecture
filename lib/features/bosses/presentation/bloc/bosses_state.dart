part of 'bosses_bloc.dart';

@immutable
sealed class BossesState extends Equatable {
  const BossesState();
}

final class BossesInitial extends BossesState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class Empty extends BossesState {
  @override
  List<Object> get props => [];
}

class Loading extends BossesState {
  @override
  List<Object> get props => throw UnimplementedError('Loading');
}

class Loaded extends BossesState {
  final Bosses bosses;

  Loaded({required this.bosses});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      bosses,
    ];
  }
}

class Error extends BossesState {
  final String message;

  Error({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      message,
    ];
  }
}
