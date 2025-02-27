import 'package:dio/dio.dart';

import '../api/api.dart';
import 'pokemon_api_manager.dart';

class ApiManager {
  static const _basePath = r'https://pokeapi.co';

  late Dio _dio;
  late Api _api;

  static ApiManager init() => ApiManager._();

  ApiManager._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _basePath,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    _dio.interceptors.add(LogInterceptor(responseBody: true));

    _api = Api(dio: _dio);
  }

  PokemonApiManager get pokemonApiManager => PokemonApiManager(api: _api);
}
