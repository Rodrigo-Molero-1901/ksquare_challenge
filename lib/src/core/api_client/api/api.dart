import 'package:dio/dio.dart';

import 'pokemon_api.dart';

class Api {
  late final Dio _dio;

  Api({required Dio dio}) : _dio = dio;

  PokemonApi get pokemonApi => PokemonApi(dio: _dio);
}
