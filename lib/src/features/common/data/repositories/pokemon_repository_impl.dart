import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ksquare_challenge/src/features/common/data/models/pokemon_details.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../../../core/api_client/api_manager/api_manager.dart';
import '../../../../core/api_client/error/api_error.dart';
import '../../data/models/pokemon_row.dart';
import '../../domain/repositories/pokemon_repository.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  final ApiManager _apiManager;

  PokemonRepositoryImpl(this._apiManager);

  @override
  Future<Either<ApiError, List<PokemonRowModel>>> getAllPokemons({
    required int offset,
  }) async {
    final response = await _apiManager.pokemonApiManager.getAllPokemons(
      offset: offset,
    );
    return response.fold((error) => Left(error), (pokemonsResponse) {
      final pokemons =
          pokemonsResponse
              .map(
                (pokemon) => PokemonRowModel(
                  id: pokemon.id,
                  name: pokemon.name,
                  url: pokemon.url,
                ),
              )
              .toList();
      return Right(pokemons);
    });
  }

  @override
  Future<Either<ApiError, PokemonDetailsModel>> getPokemonDetails({
    required String id,
  }) async {
    final response = await _apiManager.pokemonApiManager.getPokemonDetails(
      id: id,
    );
    return response.fold((error) => Left(error), (pokemonResponse) {
      final pokemon = PokemonDetailsModel(
        name: pokemonResponse.name,
        orderNumber: pokemonResponse.orderNumber,
        baseExp: pokemonResponse.baseExp,
        height: pokemonResponse.height.safeValue / 10,
        weight: pokemonResponse.weight.safeValue / 10,
        imageUrl: pokemonResponse.sprites?.imageUrl,
        shinyImageUrl: pokemonResponse.sprites?.shinyImageUrl,
        stats:
            pokemonResponse.stats.safeValue
                .map(
                  (stat) =>
                      PokemonStatModel(value: stat.value, name: stat.name),
                )
                .toList(),
      );
      return Right(pokemon);
    });
  }
}
