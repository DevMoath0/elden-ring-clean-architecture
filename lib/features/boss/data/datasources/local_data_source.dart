

import 'package:elden_ring_cl/features/boss/data/models/boss_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/boss_model.dart';

abstract class BossesLocalDataSource {
  /// Gets the cached [BossModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<List<BossModel>> getAll();

  Future<void> cache(List<BossModel> bosses);
}

const CACHED_BOSSES = 'cached_bosses';

class SharedPreferencesLocalDataSource implements BossesLocalDataSource{
  final SharedPreferences sharedPreferences;

  SharedPreferencesLocalDataSource({required this.sharedPreferences});

  @override
  Future<List<BossModel>> getAll() {
    final jsonString = sharedPreferences.getString(CACHED_BOSSES);
    if(jsonString == null){
      throw CacheException();
    }else{
      return Future.value(bossesFromJson(jsonString));
    }
  }

  @override
  Future<void> cache(List<BossModel> bosses) {
    return sharedPreferences.setString(CACHED_BOSSES, bossesToJson(bosses));
  }


}