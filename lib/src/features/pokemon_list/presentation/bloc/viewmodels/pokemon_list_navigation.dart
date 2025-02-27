part of 'pokemon_list_view_model.dart';

sealed class PokemonListNavigation {}

class DetailsNavigation extends PokemonListNavigation {
  final String pokemonId;

  DetailsNavigation({required this.pokemonId});
}
