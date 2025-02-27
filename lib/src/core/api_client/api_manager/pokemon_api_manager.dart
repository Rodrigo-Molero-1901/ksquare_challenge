import 'package:fpdart/fpdart.dart';

import '../api/api.dart';
import '../error/api_error.dart';
import '../models/pokemon_details_response.dart';
import '../models/pokemon_row_response.dart';
import '../utils/api_utils.dart';

class PokemonApiManager {
  late final Api _api;

  PokemonApiManager({required Api api}) : _api = api;

  Future<Either<ApiError, List<PokemonRowResponseModel>>> getAllPokemons({
    required int offset,
  }) async {
    return ApiUtils.handleApiCall<List<PokemonRowResponseModel>>(
      () => _api.pokemonApi.getAllPokemons(offset: offset),
    );
  }

  Future<Either<ApiError, PokemonDetailsResponseModel>> getPokemonDetails({
    required String id,
  }) async {
    return ApiUtils.handleApiCall<PokemonDetailsResponseModel>(
      () => _api.pokemonApi.getPokemonDetails(id: id),
    );
  }
}
