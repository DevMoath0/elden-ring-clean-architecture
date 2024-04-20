//JsonDecode import from this package
import 'dart:convert';

import 'package:elden_ring_cl/features/bosses/data/models/bosses_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class BossesLocalDataSource {
  /// Gets the cached [BossesModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<BossesModel> getLastBosses();

  Future<void> bossesCache(BossesModel bossesToCache);
}

const CACHED_BOSSES = 'CACHED_BOSSES';

class BossesLocalDataSourceImpl implements BossesLocalDataSource {
  late final SharedPreferences sharedPreferences;

  BossesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<BossesModel> getLastBosses() {
    final jsonString = sharedPreferences.getString(CACHED_BOSSES);

    if (jsonString != null) {
      return Future.value(BossesModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> bossesCache(BossesModel bossesToCache) async {
    sharedPreferences.setString(
        CACHED_BOSSES, jsonEncode(bossesToCache.toJson()));
    jsonEncode(bossesToCache.toJson());
  }
}
