import 'package:dio/dio.dart';

import '../models/pokemon_row_response.dart';

final class PokemonApi {
  late final Dio _dio;

  PokemonApi({required Dio dio}) : _dio = dio;

  Future<Response<List<PokemonRowResponseModel>>> getAllPokemons({
    required int offset,
  }) async {
    const limit = 20;
    final path = r'/api/v2/pokemon';
    final options = Options(method: 'GET');
    final queryParameters = {'limit': '$limit', 'offset': '$offset'};

    try {
      final response = await _dio.request(
        path,
        options: options,
        queryParameters: queryParameters,
      );

      final rawData = response.data['results'] as List<dynamic>;
      final data =
          rawData.map((e) => PokemonRowResponseModel.fromJson(e)).toList();

      return Response<List<PokemonRowResponseModel>>(
        data: data,
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } catch (e, st) {
      throw DioException(
        requestOptions: RequestOptions(path: path),
        error: e,
        stackTrace: st,
      );
    }
  }

  Future<Response<dynamic>> getPokemonDetails({required String id}) async {
    final path = r'/api/v2/pokemon/{pokemonId}'.replaceAll('{pokemonId}', id);
    final options = Options(method: 'GET');

    try {
      return await _dio.request(path, options: options);
    } catch (e, st) {
      throw DioException(
        requestOptions: RequestOptions(path: path),
        error: e,
        stackTrace: st,
      );
    }
  }
}
