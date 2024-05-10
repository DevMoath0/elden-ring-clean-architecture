import 'package:elden_ring_cl/core/error/exceptions.dart';
import 'package:elden_ring_cl/features/boss/data/models/boss_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/boss_model.dart';

abstract class BossesRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<List<BossModel>> getBosses();
}

class BossesRemoteDataSourceImpl implements BossesRemoteDataSource {
  final http.Client client;

  BossesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BossModel>> getBosses() {
    return _getBossesUrl('https://eldenring.fanapis.com/api/bosses?limit=100');
  }

  Future<List<BossModel>> _getBossesUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return bossesResponseFromJson(response.body)
          .data
          .where((element) => element.image.isNotEmpty)
          .toList();
    } else {
      throw ServerException();
    }
  }
}
