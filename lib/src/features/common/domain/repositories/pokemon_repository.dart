import 'package:fpdart/fpdart.dart';

import '../../../../core/api_client/error/api_error.dart';
import '../../data/models/pokemon_details.dart';
import '../../data/models/pokemon_row.dart';

abstract class PokemonRepository {
  Future<Either<ApiError, List<PokemonRowModel>>> getAllPokemons({
    required int offset,
  });

  Future<Either<ApiError, PokemonDetailsModel>> getPokemonDetails({
    required String id,
  });
}
