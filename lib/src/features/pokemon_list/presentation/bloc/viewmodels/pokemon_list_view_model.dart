part 'pokemon_list_navigation.dart';
part 'pokemon_list_overlay.dart';

class PokemonListViewModel {
  final PokemonListNavigation? navigation;
  final PokemonListOverlay? overlay;

  PokemonListViewModel.fromSuccessState({
    this.navigation,
    this.overlay,
  });
}
