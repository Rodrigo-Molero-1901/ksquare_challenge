part of 'pokemon_details_cubit.dart';

sealed class PokemonDetailsState {}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsMain extends PokemonDetailsState {
  PokemonDetailsViewModel viewModel;

  PokemonDetailsMain({required this.viewModel});
}
