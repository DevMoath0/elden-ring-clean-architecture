//JsonDecode import from this package
import 'dart:convert';

import 'package:elden_ring_cl/features/bosses/data/models/bosses_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/bosses.dart';

abstract class BossesLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<Bosses> getLastBosses();

  Future<void> cacheNumberTrivia(BossesModel triviaToCache);
}

const CACHED_BOSSES = 'CACHED_NUMBER_TRIVIA';

class BossesLocalDataSourceImpl implements BossesLocalDataSource {
  late final SharedPreferences sharedPreferences;

  BossesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Bosses> getLastBosses() {
    final jsonString = sharedPreferences.getString(CACHED_BOSSES);

    if (jsonString != null) {
      return Future.value(BossesModel.fromJson(jsonDecode(jsonString!)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(BossesModel triviaToCache) async {
    sharedPreferences.setString(
        CACHED_BOSSES, jsonEncode(triviaToCache.toJson()));
    jsonEncode(triviaToCache.toJson());
  }
}
