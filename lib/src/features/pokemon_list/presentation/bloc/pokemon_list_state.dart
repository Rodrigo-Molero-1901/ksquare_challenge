part of 'pokemon_list_cubit.dart';

sealed class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListMain extends PokemonListState {
  PokemonListViewModel viewModel;

  PokemonListMain({required this.viewModel});
}
