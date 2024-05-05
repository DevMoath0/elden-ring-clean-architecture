import 'dart:convert';

import 'package:elden_ring_cl/features/bosses/data/models/bosses_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';

abstract class BossesRemoteDataSource {
  /// Calls the https://eldenring.fanapis.com/api/bosses endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<BossesModel> getAllBossesFromApi();
}

class BossesRemoteDataSourceImpl implements BossesRemoteDataSource {
  late final http.Client client;

  BossesRemoteDataSourceImpl({required this.client});

  @override
  Future<BossesModel> getAllBossesFromApi() {
    return _getAllBossesFromUrl();
  }

  Future<BossesModel> _getAllBossesFromUrl() async {
    final response = await client.get(
      Uri.parse('https://eldenring.fanapis.com/api/bosses'),
      headers: {
        "Content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      // Since the response is a Map<String, dynamic> I converted it to a json form.
      debugPrint(response.statusCode.toString() +
          '************************** yes the response is true ');
      debugPrint(response.statusCode.toString() +
          '************************** Nawaf I agreed to your suggestion!');
      debugPrint(
          BossesModel.fromJson(jsonDecode(response.body)).success.toString());
      return BossesModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
