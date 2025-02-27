import '../../../../common/data/models/pokemon_row.dart';
import 'pokemon_row_view_model.dart';

part 'pokemon_list_navigation.dart';

enum PokemonListStatus { loading, error, success }

enum LoadingIndicatorStatus { invisible, visible }

extension LoadingIndicatorStatusExt on LoadingIndicatorStatus {
  bool get isVisible => this == LoadingIndicatorStatus.visible;
}

class PokemonListViewModel {
  final PokemonListStatus pokemonListStatus;
  final LoadingIndicatorStatus loadingIndicatorStatus;
  final List<PokemonRowViewModel> pokemonRowViewModels;
  final PokemonListNavigation? navigation;

  PokemonListViewModel.fromSuccessState({
    required this.pokemonListStatus,
    required this.loadingIndicatorStatus,
    required List<PokemonRowModel> pokemons,
    this.navigation,
  }) : pokemonRowViewModels =
           pokemons.map(PokemonRowViewModel.fromModel).toList();
}
