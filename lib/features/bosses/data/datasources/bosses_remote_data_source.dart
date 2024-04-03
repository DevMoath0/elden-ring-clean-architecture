import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elden_ring_cl/features/bosses/data/models/bosses_model.dart';

import '../../../../constants/strings.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/bosses.dart';
import 'package:http/http.dart' as http;

abstract class BossesRemoteDataSource {
  /// Calls the https://eldenring.fanapis.com/api/bosses endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<BossesModel> getAllBosses();
}

class BossesRemoteDataSourceImpl implements BossesRemoteDataSource {
  late final http.Client client;

  BossesRemoteDataSourceImpl({required this.client});

  @override
  Future<BossesModel> getAllBosses() {
    return _getAllBossesFromUrl('https://eldenring.fanapis.com/api/bosses');
  }

  Future<BossesModel> _getAllBossesFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      print("Yes");
      print(response.body.toString());
      print('*****************************');
      return BossesModel.fromJson(jsonDecode(response.body));
    } else {
      print('No');
      throw ServerException();
    }
  }
}
