part 'pokemon_details_navigation.dart';
part 'pokemon_details_overlay.dart';

class PokemonDetailsViewModel {
  final PokemonDetailsNavigation? navigation;
  final PokemonDetailsOverlay? overlay;

  PokemonDetailsViewModel.fromSuccessState({
    this.navigation,
    this.overlay,
  });
}
