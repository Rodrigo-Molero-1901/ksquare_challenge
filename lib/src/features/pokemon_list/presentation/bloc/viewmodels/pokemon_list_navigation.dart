part of 'pokemon_list_view_model.dart';

sealed class PokemonListNavigation {}

class DetailsNavigation extends PokemonListNavigation {
  final int pokemonId;
  final String pokemonName;

  DetailsNavigation({required this.pokemonId, required this.pokemonName});
}
