import 'package:bloc/bloc.dart';
import 'package:elden_ring_cl/features/bosses/domain/entities/bosses_entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_bosses.dart';

part 'bosses_event.dart';
part 'bosses_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

class BossesBloc extends Bloc<BossesEvent, BossesState> {
  final GetBosses getBosses;

  BossesBloc({required this.getBosses}) : super(Empty()) {
    on<GetForBosses>(_getBossesHandler);
  }

  // For the Bosses
  Future<void> _getBossesHandler(
    GetForBosses event,
    Emitter<BossesState> emit,
  ) async {
    print('In handler *********************************');
    emit(Loading());

    final result = await getBosses(NoParams());

    result.fold(
      (failure) {
        emit(Error(message: _mapFailureToMessage(failure)));
      },
      (bosses) {
        debugPrint(bosses.data[0].toString());
        emit(Loaded(bosses: bosses));
      },
    );
  }

  // Instead of using ternary operator to decide which failure message to provide.
  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return serverFailureMessage;
    } else if (failure is CacheFailure) {
      return cacheFailureMessage;
    } else {
      return 'Unexpected Error';
    }
  }
}
