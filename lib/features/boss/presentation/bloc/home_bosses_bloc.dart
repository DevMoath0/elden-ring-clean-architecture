import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/boss.dart';
import '../../domain/usecases/get_bosses.dart';

part 'home_bosses_event.dart';
part 'home_bosses_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class HomeBossesBloc extends Bloc<HomeEvent, HomeBossesState> {
  final GetBosses getBosses;

  HomeBossesBloc({required this.getBosses}) : super(Init()) {
    on<GetBossesEvent>(_getBossesHandler);
  }

  FutureOr<void> _getBossesHandler(
      GetBossesEvent event, Emitter<HomeBossesState> emit) async {
    emit(Loading());
    final result = await getBosses(NoParams());

    result.fold(
      (failure) {
        emit(Error(message: _mapFailureToMessage(failure)));
      },
      (bosses) {
        debugPrint("${bosses.length}*********************** Bosses length");
        emit(Loaded(bosses: bosses));
      },
    );
  }

  // Instead of using ternary operator to decide which failure message to provide.
  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return SERVER_FAILURE_MESSAGE;
    } else if (failure is CacheFailure) {
      return CACHE_FAILURE_MESSAGE;
    } else {
      return 'Unexpected Error';
    }
  }
}
