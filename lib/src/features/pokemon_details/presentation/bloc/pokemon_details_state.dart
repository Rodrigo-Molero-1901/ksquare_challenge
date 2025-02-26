part of 'pokemon_details_cubit.dart';

sealed class PokemonDetailsState {}

class PokemonDetailsLoading extends PokemonDetailsState {}

class PokemonDetailsError extends PokemonDetailsState {
  bool internetError;

  PokemonDetailsError({required this.internetError});
}

class PokemonDetailsMain extends PokemonDetailsState {
  PokemonDetailsViewModel viewModel;

  PokemonDetailsMain({required this.viewModel});
}
