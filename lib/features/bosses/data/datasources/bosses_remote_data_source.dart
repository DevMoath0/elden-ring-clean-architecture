import 'package:dio/dio.dart';

import '../../../../constants/strings.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/bosses.dart';

abstract class BossesRemoteDataSource {
  /// Calls the https://eldenring.fanapis.com/api/bosses endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<Bosses> getAllBosses(String bosses);
}

class BossesRemoteDataSourceImpl implements BossesRemoteDataSource {
  late Dio dio;

  BossesRemoteDataSourceImpl({required this.dio});

  @override
  Future<Bosses> getAllBosses(String bosses) {
    return _getAllBosses(bosses);
  }

  Future<Bosses> _getAllBosses(String requiredType) async {
    // Options that will be passed to dio
    BaseOptions baseOptions = BaseOptions(
      baseUrl: '$baseUrl/$requiredType',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
    );
    dio = Dio(baseOptions);

    Response response = await dio.get('data');

    if (response.statusCode == 200) {
      print(response.data.toString());
      return response.data['data'];
    } else {
      throw ServerException();
    }
  }
}
