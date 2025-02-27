part of 'pokemon_list_cubit.dart';

sealed class PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListError extends PokemonListState {
  bool internetError;

  PokemonListError({required this.internetError});
}

class PokemonListMain extends PokemonListState {
  PokemonListViewModel viewModel;

  PokemonListMain({required this.viewModel});
}
